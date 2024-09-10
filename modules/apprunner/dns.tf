data "aws_route53_zone" "zone" {
  name         = var.host_name
  private_zone = false
}

resource "aws_route53_record" "validation" {
  count = 2

  name    = aws_apprunner_custom_domain_association.apprunner_custom_domain.certificate_validation_records.*.name[count.index]
  type    = aws_apprunner_custom_domain_association.apprunner_custom_domain.certificate_validation_records.*.type[count.index]
  ttl     = 60
  zone_id = data.aws_route53_zone.zone.id
  records = [aws_apprunner_custom_domain_association.apprunner_custom_domain.certificate_validation_records.*.value[count.index]]
}

resource "aws_route53_record" "dns_cname" {
  name    = var.domain_name
  type    = "CNAME"
  ttl     = 60
  zone_id = data.aws_route53_zone.zone.id
  records = [aws_apprunner_custom_domain_association.apprunner_custom_domain.dns_target]
}

resource "aws_wafv2_web_acl_association" "waf" {
  resource_arn = aws_apprunner_service.apprunner_service.arn
  web_acl_arn  = var.web_acl
}
