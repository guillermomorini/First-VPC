resource "aws_s3_bucket" "first_bucket" {
    bucket = "gmorini-first-bucket"
    acl = "public-read"
}

resource "aws_s3_bucket_cors_configuration" "cors_config" {
    bucket = aws_s3_bucket.first_bucket.id
    cors_rule {
        allowed_headers = ["Authorization", "Content-length"]
        allowed_methods = ["GET", "POST"]
        allowed_origins = ["https://www.gmorini.org"]
        max_age_seconds = 3000
    }
}

resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.first_bucket.id
  
  index_document {
    suffix = "index.html"
  }
  
  error_document {
    key = "404.html"
  }
}
resource "aws_s3_bucket_policy" "bucket_policy" {
    bucket = aws_s3_bucket.first_bucket.id
    policy = templatefile("templates/s3-policy.json", { bucket = "www.gmorini.org"})
}