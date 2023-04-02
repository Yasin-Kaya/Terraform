# outputs.tf

output "bucket_name" {
  value = aws_s3_bucket.bucket.id
}

output "function_name" {
  value = aws_lambda_function.function.function_name
}

output "lambda_arn" {
  value = aws_lambda_function.function.arn
}

output "s3_trigger_arn" {
  value = aws_cloudwatch_event_rule.trigger.arn
}