resource "aws_lambda_function" "function" {
  function_name    = var.function_name
  role             = aws_iam_role.lambda_exec.arn
  handler          = var.handler
  runtime          = var.runtime
  filename         = var.filename
  
  environment {
    variables = {
      BUCKET_NAME = aws_s3_bucket.bucket.id
    }
  }
}

resource "aws_lambda_permission" "s3_bucket_cleaner_invoke" {
  statement_id  = var.statement_id
  action        = var.action
  function_name = aws_lambda_function.function.function_name
  principal     = var.principal
  source_arn    = aws_cloudwatch_event_rule.trigger.arn
}
