data "aws_iam_policy_document" "vault_auth_policy_document" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    resources = ["*"]
  }
}


data "aws_iam_policy_document" "rds_connect_policy_document" {
  statement {
    effect = "Allow"

    actions = [
      "rds-db:connect"
    ]

    resources = [
      "arn:aws:rds-db:eu-west-1:${var.aws_account}:dbuser:${var.database_resource_id}/${var.database_user}"
    ]
  }
}

data "aws_iam_policy_document" "vault_rds_connect_policy_document" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "rds-db:connect"
    ]

    resources = [
      "arn:aws:rds-db:eu-west-1:${var.aws_account}:dbuser:${var.database_resource_id}/${var.database_user}"
    ]
  }
}

data "aws_iam_policy_document" "empty_policy_document" {
}




