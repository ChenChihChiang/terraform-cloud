data "aws_acm_certificate" "chenchihchiang_tw" {
  domain      = "*.chenchihchiang.tw"
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}
