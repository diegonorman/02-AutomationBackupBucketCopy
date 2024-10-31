resource "aws_lambda_function" "s3_copy" {
  function_name    = var.lambda_function_name
  handler          = "index.handler"
  runtime          = "nodejs18.x"
  filename         = "lambda/lambda_function.zip"
  source_code_hash = filebase64sha256("lambda/lambda_function.zip")
  role             = aws_iam_role.lambda_role.arn
  timeout          = 30

  environment {
    variables = {
      BACKUP_BUCKET = aws_s3_bucket.backup_bucket.bucket
    }
  }
}