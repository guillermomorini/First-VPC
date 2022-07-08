resource "aws_route53_zone" "gmorini" {
  name = "gmorini.org"
}

resource "aws_route53_record" "s3site" {
  zone_id = aws_route53_zone.gmorini.zone_id
  name = "gmorini.org"
  type = "A"
  
  alias {
    name =  "s3-website-us-east-1.amazonaws.com"
    zone_id = aws_s3_bucket.first_bucket.hosted_zone_id
    evaluate_target_health = false
  }
}