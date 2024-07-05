resource "aws_acm_certificate" "cert" {
  provider          = aws.virginia
  domain_name       = var.website_host
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}
