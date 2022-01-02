resource "aws_cloudwatch_log_group" "dev_nginx" {
  name = "/ecs/dev_ecs/"

  tags = {
    Terraform = "true"
    Environment = "dev"
  }

}