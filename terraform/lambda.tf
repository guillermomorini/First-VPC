data "archive_file" "lambda_code_zip" {
type        = "zip"
source_dir  = "${path.module}/lambda/"
output_path = "${path.module}/lambda/lambdacode.zip"
}
