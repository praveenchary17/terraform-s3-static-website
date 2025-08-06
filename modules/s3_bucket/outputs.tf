output "bucket_id" {
  value = aws_s3_bucket.website_bucket.id
}

output "website_url" {
  value = aws_s3_bucket.website_bucket.website_endpoint
}