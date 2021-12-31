module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "nginx-alb"

  load_balancer_type = "application"

  vpc_id             = module.dev_vpc.vpc_id
  subnets            = module.dev_vpc.public_subnets
  security_groups    = [aws_security_group.allow_tls.id]

  access_logs = {
    bucket = "dev-alb-logs"
  }

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = "arn:aws:acm:ap-northeast-1:312490145519:certificate/684674c1-deee-449f-a8cc-7f5484452e1f"
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}