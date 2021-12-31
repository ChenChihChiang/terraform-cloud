resource "aws_ecs_cluster" "dev_ecs" {
  name = "dev_ecs"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    Terraform = "true"
    Environment = "dev"
  }

}
