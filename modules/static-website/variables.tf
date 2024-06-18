variable "domain_name" {
  type = string
  description = "Host name (host.be)"
}

variable "sub_domain_name" {
  description = "Name of the sub domain"
  type        = string
}

variable "website_host" {
  type = string
  description = "Website host (sub.host.be)"
}

variable "website_path" {
  type = string
  description = "Website path (files to upload)"
}

variable "permission_policy" {
  type = string
  description = "Permission Policy header"
  default = "accelerometer=(),autoplay=(),camera=(),encrypted-media=(),fullscreen=*,geolocation=(),gyroscope=(),magnetometer=(),microphone=(),midi=(),payment=(),sync-xhr=(),usb=(),xr-spatial-tracking=()"
}

variable "content_security_policy" {
  type = string
  description = "Content Security Policy header"
  default = "frame-ancestors 'none'; default-src 'none'; img-src 'self' data:; script-src 'self' 'unsafe-inline'; script-src-elem 'self'; style-src 'self' 'unsafe-inline'; object-src 'none'; font-src 'self'; connect-src 'self'; base-uri 'self'; form-action 'self'; frame-src 'self'; worker-src 'self' blob:"
}
