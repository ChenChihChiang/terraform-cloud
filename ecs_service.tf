resource "aws_ecs_service" "nginx" {
  name            = "nginx"
  cluster         = aws_ecs_cluster.dev_ecs.id
  task_definition = aws_ecs_task_definition.nginx.arn
  desired_count   = 1

  launch_type = "FARGATE"


  ignore_changes = ["task_definition"]


  network_configuration {
    subnets = [for subnet in module.dev_vpc.private_subnets : subnet]
    security_groups = [aws_security_group.allow_http.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.nginx_tg.arn
    container_name   = "nginx"
    container_port   = 80
  }

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
  
}