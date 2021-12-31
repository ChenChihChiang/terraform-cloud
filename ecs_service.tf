resource "aws_ecs_service" "nginx" {
  name            = "nginx"
  cluster         = aws_ecs_cluster.dev_ecs.id
  task_definition = aws_ecs_task_definition.nginx.arn
  desired_count   = 1

  launch_type = "FARGATE"

  network_configuration {
    subnets = [for subnet in module.dev_vpc.public_subnets : subnet]
    security_groups = [aws_security_group.allow_tls.id]
  }

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
  
}