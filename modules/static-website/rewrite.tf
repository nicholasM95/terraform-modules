resource "aws_cloudfront_function" "rewrite_function" {
  count   = var.enable_rewrite ? 1 : 0
  name    = "rewrite-url-${var.project_name}"
  runtime = "cloudfront-js-2.0"
  publish = true
  code    = file("${path.module}/function.js")
}
