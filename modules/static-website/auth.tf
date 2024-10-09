resource "aws_cloudfront_function" "basic_auth_function" {
  count   = var.enable_basic_auth ? 1 : 0
  name    = "${var.project_name}-basic-auth-function"
  runtime = "cloudfront-js-1.0"

  code = <<EOF

EOF
}
