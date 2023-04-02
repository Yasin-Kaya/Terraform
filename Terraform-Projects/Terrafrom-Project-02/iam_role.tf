resource "aws_iam_role" "lambda_exec" {
  name = var.iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        
      }
    ]
  })
}


resource "aws_iam_policy" "bucket_policy" {
  name        = var.iam_policy_name
  description = var.iam_policy_description

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
            "Action": [
                "sns:*"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
      {
        "Effect": "Allow",
        "Action": [
            "s3:*",
            "s3-object-lambda:*"
            ]
        "Resource" = "*"
      },
      {
        Effect: "Allow",
        Action: [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource: "arn:aws:logs:*:*:*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_exec_s3" {
  policy_arn = aws_iam_policy.bucket_policy.arn
  role       = aws_iam_role.lambda_exec.name
}
