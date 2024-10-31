resource "aws_s3_bucket" "main_bucket" {
  bucket = var.aws_s3_bucket
}
resource "aws_s3_bucket" "backup_bucket" {
  bucket = var.aws_s3_bucket_bk
}