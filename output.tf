output "lambda_function_arn" {
  value = aws_lambda_function.s3_copy.arn
}

output "lambda_function_name" {
  value = aws_lambda_function.s3_copy.function_name
}
output "s3_buckets" {
  value = {
    main_bucket_id   = aws_s3_bucket.main_bucket.id
    backup_bucket_id = aws_s3_bucket.backup_bucket.id
  }
}