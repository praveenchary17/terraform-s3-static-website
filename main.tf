module "s3_bucket" {
  source                  = "./modules/s3_bucket"
  bucket_name             = var.bucket_name
  website_index_document  = var.website_index_document
  website_error_document  = var.website_error_document
}