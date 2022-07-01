resource "aws_s3_bucket" "first_bucket" {
    bucket = "gmorini-first-bucket"
    acl = "public-read"
    policy = templatefile("templates/s3-policy.json", {bucket = "www.gmorini.org"})
    
    cors_rule {
        allowed_headers = ["Authorization", "Content-length"]
        allowed_methods = ["GET", "POST"]
        allowed_origins = ["https://www.gmorini.org"]
        max_age_seconds = 3000
    }
    
    website {
      index_document = "index.html"
      error_document = "404.html"
    }
}