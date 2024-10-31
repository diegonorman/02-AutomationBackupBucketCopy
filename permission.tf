resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.s3_copy.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.main_bucket.arn
}
