resource "aws_lb" "dev_alb" {
  name               = "dev-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_https.id]
  subnets            = [for subnet in module.dev_vpc.public_subnets : subnet]

  enable_deletion_protection = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_lb_target_group" "nginx_tg" {
  name     = "nginx-tg"
  port     = 80
  protocol = "HTTP"
  target_type = "ip"
  vpc_id   = module.dev_vpc.vpc_id

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_lb_listener" "nginx" {
  load_balancer_arn = aws_lb.dev_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.dev_chenchihchiang_tw.id

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx_tg.arn
  }

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}