resource "aws_route53_zone" "gmorini" {
  name = "gmorini.org"
}

resource "aws_route53_record" "s3site" {
  zone_id = aws_route53_zone.gmorini.zone_id
  name = "gmorini.org"
  type = "A"
  
  alias {
    name = aws_s3_bucket.first_bucket.s3_bucket_website_domain
    zone_id = "gmorini.org"
    evaluate_target_health = false
  }
}