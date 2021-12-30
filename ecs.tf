resource "aws_ecs_cluster" "john" {
  name = "john"

  capacity_providers = "FARGATE"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
  
}
