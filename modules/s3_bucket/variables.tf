variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "website_index_document" {
  description = "The index document for the static website"
  type        = string
}

variable "website_error_document" {
  description = "The error document for the static website"
  type        = string
}