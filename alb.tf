resource "aws_lb" "dev_alb" {
  name               = "dev_alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_tls.id]
  subnets            = [for subnet in module.dev_vpc.public : subnet.id]

  enable_deletion_protection = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}