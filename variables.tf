variable "region" {
  type        = string
  default = "us-east-1"
}
variable "aws_s3_bucket" {
  type        = string
}

variable "aws_s3_bucket_bk" {
  type        = string
}
variable "lambda_function_name" {
  type        = string
}