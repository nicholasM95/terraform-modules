variable "domain_name" {
  type        = string
  description = "Host name (host.be)"
}

variable "sub_domain_name" {
  description = "Name of the sub domain"
  type        = string
}

variable "website_host" {
  type        = string
  description = "Website host (sub.host.be)"
}

variable "website_path" {
  type        = string
  description = "Website path (files to upload)"
}

variable "project_name" {
  type        = string
  description = "Project name"
}

variable "permission_policy" {
  type        = string
  description = "Permission Policy header"
  default     = "accelerometer=(),autoplay=(),camera=(),encrypted-media=(),fullscreen=*,geolocation=(),gyroscope=(),magnetometer=(),microphone=(),midi=(),payment=(),sync-xhr=(),usb=(),xr-spatial-tracking=()"
}

variable "content_security_policy" {
  type        = string
  description = "Content Security Policy header"
  default     = "frame-ancestors 'none'; default-src 'none'; img-src 'self' data:; script-src 'self' 'unsafe-inline'; script-src-elem 'self'; style-src 'self' 'unsafe-inline'; object-src 'none'; font-src 'self'; connect-src 'self'; base-uri 'self'; form-action 'self'; frame-src 'self'; worker-src 'self' blob:"
}

variable "web_acl_id" {
  type        = string
  description = "WEB ACL ID"
}

variable "enable_basic_auth" {
  type        = bool
  description = "Boolean to enable or disable Basic Authentication"
  default     = false
}

variable "basic_auth_username_password" {
  type        = string
  description = "Username Password for Basic Authentication (username:password) | base64"
  default     = ""
}
