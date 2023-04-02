# variables.tf

variable "region" {
  type    = string
}

variable "bucket_name" {
  type    = string
}

variable "function_name" {
  type    = string
}

variable "block_public_acls" {
  type = bool
  default = "true"
}

variable "block_public_policy" {
  type = bool
  default = "true"
}

variable "ignore_public_acls" {
  type = bool
  default = "true"
}

variable "restrict_public_buckets" {
  type = bool
  default = "true"
}

variable "handler" {
  type = string
  default = "lambda_function.lambda_handler"
}

variable "runtime" {
  type = string
}

variable "filename" {
  type = string
}

variable "statement_id" {
  type = string
  default = "AllowExecutionFromCloudWatch"
}

variable "action" {
  type = string
  default = "lambda:InvokeFunction"
}

variable "principal" {
  type = string
  default = "events.amazonaws.com"
}

variable "iam_role_name" {
  type = string
}

variable "iam_policy_name" {
  type = string
}

variable "iam_policy_description" {
  type = string
}

variable "cloudwatch_event_rule_name" {
  type = string
}

variable "cloudwatch_event_rule_description" {
  type = string
}

variable "cloudwatch_event_rule_schedule_expression" {
  type = string
}