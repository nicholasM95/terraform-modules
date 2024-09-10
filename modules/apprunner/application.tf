resource "aws_apprunner_service" "apprunner_service" {
  service_name = var.application_name

  source_configuration {
    image_repository {
      image_configuration {
        port = "8080"

        runtime_environment_variables = {
          "SPRING_PROFILES_ACTIVE" = "aws"
          "VAULT_URI"              = var.vault_uri
        }
      }
      image_identifier      = var.image_identifier
      image_repository_type = "ECR"

    }
    authentication_configuration {
      access_role_arn = aws_iam_role.apprunner_iam_role.arn
    }
    auto_deployments_enabled = true
  }

  instance_configuration {
    instance_role_arn = aws_iam_role.instance_apprunner_iam_role.arn
  }

}

resource "aws_apprunner_custom_domain_association" "apprunner_custom_domain" {
  domain_name          = var.domain_name
  service_arn          = aws_apprunner_service.apprunner_service.arn
  enable_www_subdomain = false
}


