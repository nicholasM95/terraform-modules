data "aws_iam_policy_document" "apprunner_iam_policy_document" {
  statement {
    effect = "Allow"

    principals {
      type = "Service"
      identifiers = [
        "build.apprunner.amazonaws.com",
        "tasks.apprunner.amazonaws.com"
      ]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "apprunner_iam_role" {
  name               = "${var.application_name}-apprunner-role"
  assume_role_policy = data.aws_iam_policy_document.apprunner_iam_policy_document.json
}

resource "aws_iam_role" "instance_apprunner_iam_role" {
  name               = "${var.application_name}-instance-apprunner-role"
  assume_role_policy = data.aws_iam_policy_document.apprunner_iam_policy_document.json
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
  role       = aws_iam_role.apprunner_iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSAppRunnerServicePolicyForECRAccess"
}

resource "aws_iam_policy" "dynamic_apprunner_policy" {
  name        = "${var.application_name}-dynamic-apprunner-policy"
  description = "Dynamic policy"

  policy = lookup(
    {
      "vault"     = data.aws_iam_policy_document.vault_auth_policy_document.json,
      "rds"       = data.aws_iam_policy_document.rds_connect_policy_document.json,
      "vault_rds" = data.aws_iam_policy_document.vault_rds_connect_policy_document.json
      "empty"     = data.aws_iam_policy_document.empty_policy_document.json
    },
    var.policy_type,
    data.aws_iam_policy_document.vault_auth_policy_document.json
  )
}


resource "aws_iam_role_policy_attachment" "apprunner_policy_attachment" {
  role       = aws_iam_role.instance_apprunner_iam_role.name
  policy_arn = aws_iam_policy.dynamic_apprunner_policy.arn
}
