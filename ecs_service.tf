resource "aws_ecs_service" "nginx" {
  name            = "nginx"
  cluster         = aws_ecs_cluster.dev_ecs.id
  task_definition = aws_ecs_task_definition.nginx.arn
  desired_count   = 1

  launch_type = "FARGATE"

  network_configuration {
    subnets = ["subnet-075cba30be46ffaae","subnet-028870594e8e6a304","subnet-01cb3df2da0522a1f"]
    security_groups = [aws_security_group.allow_tls.id]
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