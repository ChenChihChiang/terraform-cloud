resource "aws_route53_zone" "dev_chenchihchiang_tw" {
  name = "dev.chenchihchiang.tw"

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}


resource "aws_route53_record" "test" {
  zone_id = aws_route53_zone.dev_chenchihchiang_tw.zone_id
  name    = "test.dev.chenchihchiang.tw"
  type    = "A"
  ttl     = "300"
  records = ["1.1.1.1"]
}


resource "aws_route53_record" "dev_nginx" {
  zone_id = aws_route53_zone.dev_chenchihchiang_tw.zone_id
  name    = "nginx.dev.chenchihchiang.tw"
  type    = "A"

  alias {
    name                   = aws_lb.dev_alb.dns_name
    zone_id                = aws_lb.dev_alb.zone_id
    evaluate_target_health = true
  }

}