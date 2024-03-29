data "archive_file" "lambda_code_zip" {
    type        = "zip"
    source_dir  = "${path.module}/lambda/"
    output_path = "${path.module}/lambda/lambdacode.zip"
}

resource "aws_lambda_function" "terraform_lambda_func" {
    filename           = "${path.module}/lambda/lambdacode.zip"
    function_name      = "Test_Lambda_Function"
    role               = aws_iam_role.lambda_role.arn
    handler            = "index.lambda_handler"
    runtime            = "python3.8"
    source_code_hash   = "${data.archive_file.lambda_code_zip.output_base64sha256}"
    depends_on         = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}

resource "aws_iam_policy" "iam_policy_for_lambda" {
 
 name         = "aws_iam_policy_for_terraform_aws_lambda_role"
 path         = "/"
 description  = "AWS IAM Policy for managing aws lambda role"
 policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": [
       "logs:CreateLogGroup",
       "logs:CreateLogStream",
       "logs:PutLogEvents"
     ],
     "Resource": "arn:aws:logs:*:*:*",
     "Effect": "Allow"
   },
   {
        "Sid": "DescribeQueryScanBooksTable",
        "Effect": "Allow",
        "Action": [
            "dynamodb:DescribeTable",
            "dynamodb:Query",
            "dynamodb:Scan",
            "dynamodb:BatchGet*",
            "dynamodb:DescribeStream",
            "dynamodb:Get*",
            "dynamodb:Query",
            "dynamodb:BatchWrite*",
            "dynamodb:CreateTable",
            "dynamodb:Delete*",
            "dynamodb:Update*",
            "dynamodb:PutItem"
        ],
        "Resource": "arn:aws:dynamodb:us-east-1:335908724754:table/GameScores"
  }
 ]
}
EOF
}

resource "aws_iam_role" "lambda_role" {
name   = "Spacelift_Test_Lambda_Function_Role"
assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "lambda.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
 role        = aws_iam_role.lambda_role.name
 policy_arn  = aws_iam_policy.iam_policy_for_lambda.arn
}

