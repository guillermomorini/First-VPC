resource "aws_acm_certificate" "gmorini_cert" {
    domain_name = "gmorini.org"
    validation_method = "DNS"
}