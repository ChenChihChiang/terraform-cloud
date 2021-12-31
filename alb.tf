resource "aws_lb" "dev_alb" {
  name               = "dev-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_tls.id]
  subnets            = [for subnet in module.dev_vpc.public_subnets : subnet]

  enable_deletion_protection = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_lb_target_group" "nginx_tg" {
  name     = "nginx_tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.dev_vpc.vpc_id

  tags = {
    Terraform = "true"
    Environment = "dev"
  }

}