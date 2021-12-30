resource "aws_ecs_service" "nginx" {
  name            = "nginx"
  cluster         = aws_ecs_cluster.john.id
  task_definition = aws_ecs_task_definition.service.arn
  desired_count   = 1
  iam_role        = aws_iam_role.john.arn
  depends_on      = [aws_iam_role_policy.john]

  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.john.arn
    container_name   = "nginx"
    container_port   = 80
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [ap-northeast-1a, ap-northeast-1c]"
  }
}