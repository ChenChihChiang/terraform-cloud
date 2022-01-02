resource "aws_route53_zone" "dev_chenchihchiang_tw" {
  name = "dev.chenchihchiang.tw"

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
