resource "aws_cloudwatch_event_rule" "trigger" {
  name                = var.cloudwatch_event_rule_name
  description         = var.cloudwatch_event_rule_description
  schedule_expression = var.cloudwatch_event_rule_schedule_expression
}

resource "aws_cloudwatch_event_target" "target" {
  rule      = aws_cloudwatch_event_rule.trigger.name
  target_id = aws_lambda_function.function.function_name
  arn  = aws_lambda_function.function.arn
}
