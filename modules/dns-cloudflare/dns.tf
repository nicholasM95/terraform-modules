data "cloudflare_zone" "zone" {
  filter = {
    name = var.host_name
  }
}

resource "cloudflare_dns_record" "dns_record" {
  zone_id = data.cloudflare_zone.zone.id
  name    = var.name
  content = var.ip
  type    = var.type
  ttl     = var.ttl
  proxied = var.proxied
}
