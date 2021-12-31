resource "aws_ecs_service" "nginx" {
  name            = "nginx"
  cluster         = aws_ecs_cluster.dev_ecs.id
  task_definition = aws_ecs_task_definition.nginx.arn
  desired_count   = 1

  launch_type = "FARGATE"

  network_configuration = "awsvpc"

  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [ap-northeast-1a, ap-northeast-1c]"
  }

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
  
}