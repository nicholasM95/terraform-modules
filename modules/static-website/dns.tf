data "cloudflare_zones" "zone" {
  name = var.domain_name
}

resource "cloudflare_dns_record" "dns_record" {
  zone_id = lookup(data.cloudflare_zones.zone.zones[0], "id")
  name    = var.sub_domain_name
  content = aws_cloudfront_distribution.s3_distribution.domain_name
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_dns_record" "dns_record_validation" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  zone_id = lookup(data.cloudflare_zones.zone.zones[0], "id")
  name    = each.value.name
  content = each.value.record
  type    = each.value.type
  ttl     = 1
  proxied = false
}
