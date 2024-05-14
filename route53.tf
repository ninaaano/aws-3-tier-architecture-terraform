data "aws_acm_certificate" "cert" {
  domain = var.domain
}

data "aws_route53_zone" "front" {
  name         = var.domain
  private_zone = false
}

resource "aws_route53_record" "front" {
  zone_id = data.aws_route53_zone.front.zone_id
  name    = var.domain
  type    = "A"

  alias {
    name                   = aws_lb.prod-alb.dns_name
    zone_id                = aws_lb.prod-alb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "cert_validation" {
  name    = data.aws_acm_certificate.cert.domain_validation_options[0].resource_record_name
  type    = data.aws_acm_certificate.cert.domain_validation_options[0].resource_record_type
  zone_id = data.aws_route53_zone.front.zone_id
  records = [data.aws_acm_certificate.cert.domain_validation_options[0].resource_record_value]
  ttl     = 60
}