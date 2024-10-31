// variables.tf
variable "aws_s3_bucket" {
  description = "Nome do bucket S3 para Terraform"
  type        = string
}

variable "aws_s3_bucket_bk" {
  description = "Nome do bucket S3 para backup"
  type        = string
}

variable "lambda_function_name" {
  description = "Nome da função Lambda"
  type        = string
}

variable "region" {
  description = "Região AWS"
  type        = string
}
