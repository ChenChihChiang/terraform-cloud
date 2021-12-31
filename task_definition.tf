resource "aws_ecs_task_definition" "nginx" {
  family                   = "nginx"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "nginx",
    "image": "library/nginx",
    "cpu": 1024,
    "memory": 2048,
    "essential": true,
    "portMappings" = [
      {
        "containerPort": 80
        "hostPort":      80
      }
}
]
TASK_DEFINITION

}