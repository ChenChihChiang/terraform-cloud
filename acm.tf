data "aws_acm_certificate" "chenchihchiang_tw" {
  domain      = "*.chenchihchiang.tw"
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}

resource "aws_acm_certificate" "dev_chenchihchiang_tw" {
  domain_name       = "*.dev.chenchihchiang.tw"
  validation_method = "DNS"

  tags = {
    Terraform = "true"
    Environment = "test"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "dev_chenchihchiang_tw" {
  for_each = {
    for dvo in aws_acm_certificate.dev_chenchihchiang_tw.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.dev_chenchihchiang_tw.zone_id
}

resource "aws_acm_certificate_validation" "dev_chenchihchiang_tw" {
  certificate_arn         = aws_acm_certificate.dev_chenchihchiang_tw.arn
  validation_record_fqdns = [for record in aws_route53_record.dev_chenchihchiang_tw : record.fqdn]
}
