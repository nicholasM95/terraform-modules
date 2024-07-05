locals {
  mime_types = {
    "css"         = "text/css"
    "html"        = "text/html"
    "ico"         = "image/vnd.microsoft.icon"
    "js"          = "application/javascript"
    "json"        = "application/json"
    "map"         = "application/json"
    "png"         = "image/png"
    "svg"         = "image/svg+xml"
    "txt"         = "text/plain"
    "webmanifest" = "application/json"
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.website_host
}

resource "aws_s3_object" "files" {
  bucket = aws_s3_bucket.bucket.bucket

  for_each = fileset(var.website_path, "**")
  key      = each.key

  source       = "${var.website_path}/${each.value}"
  content_type = lookup(tomap(local.mime_types), element(split(".", each.key), length(split(".", each.key)) - 1))
  etag         = filemd5("${var.website_path}/${each.value}")

}

resource "aws_s3_bucket_policy" "aws_s3_bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.aws_iam_policy_document.json
}

data "aws_iam_policy_document" "aws_iam_policy_document" {
  statement {

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "arn:aws:s3:::${var.website_host}/*",
      "arn:aws:s3:::${var.website_host}/icons/*"
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values   = [aws_cloudfront_distribution.s3_distribution.arn]
    }

  }
}

