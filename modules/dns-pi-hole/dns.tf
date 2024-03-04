resource "pihole_dns_record" "pihole_dns_record" {
  domain = "${var.name}.${var.host_name}"
  ip     = var.local_ip
}
