data "cloudflare_zones" "zone" {
  account {
    name = var.host_name
  }
}

resource "cloudflare_dns_record" "dns_record" {
  zone_id = lookup(data.cloudflare_zones.zone.zones[0], "id")
  name    = var.name
  value   = var.ip
  type    = var.type
  ttl     = var.ttl
  proxied = var.proxied
}
