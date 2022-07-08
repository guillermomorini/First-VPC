resource "aws_route53_zone" "gmorini" {
  name = "gmorini.org"
}

resource "aws_route53_record" "s3site" {
  zone_id = aws_route53_zone.gmorini.zone_id
  name = "gmorini.org"
  type = "A"
  
  alias {
    name = "s3-website.us-east-1.amazonaws.com"
    zone_id = "Z3AQBSTGFYJSTF"
    evaluate_target_health = false
  }
}