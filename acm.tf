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