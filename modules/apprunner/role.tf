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

resource "aws_iam_role" "vault_apprunner_iam_role" {
  name               = "${var.application_name}-vault-apprunner-role"
  assume_role_policy = data.aws_iam_policy_document.apprunner_iam_policy_document.json
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
  role       = aws_iam_role.apprunner_iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSAppRunnerServicePolicyForECRAccess"
}

resource "aws_iam_policy" "vault_auth_policy" {
  name        = "${var.application_name}-vault-apprunner-policy"
  description = "Policy for App Runner to authenticate with Vault"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "sts:AssumeRoleWithWebIdentity"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "apprunner_policy_attachment" {
  role       = aws_iam_role.vault_apprunner_iam_role.name
  policy_arn = aws_iam_policy.vault_auth_policy.arn
}
