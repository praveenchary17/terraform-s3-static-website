resource "aws_s3_bucket" "static_website" {
  bucket = var.bucket_name

  website {
    index_document = var.website_index_document
    error_document = var.website_error_document
  }
}

resource "aws_s3_bucket_policy" "static_website_policy" {
  bucket = aws_s3_bucket.static_website.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.static_website.arn}/*"
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.static_website]
}

resource "aws_s3_bucket_object" "website_files" {
  for_each     = fileset("${path.module}/../../website", "*.html")
  bucket       = aws_s3_bucket.static_website.id
  key          = each.value
  source       = "${path.module}/../../website/${each.value}"
  content_type = "text/html"
  etag         = filemd5("${path.module}/../../website/${each.value}")
}

resource "aws_s3_bucket_public_access_block" "static_website" {
  bucket                  = aws_s3_bucket.static_website.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}