resource "aws_s3_bucket" "main_bucket" {
  bucket = var.bucket_name
}
resource "aws_s3_bucket" "backup_bucket" {
  bucket = var.bucket_name_bk
}