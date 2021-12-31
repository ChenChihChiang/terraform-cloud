resource "aws_route53_zone" "aws_chenchihchiang_tw" {
  name = "aws.chenchihchiang.tw"

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
