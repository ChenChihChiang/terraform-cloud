resource "aws_ecs_task_definition" "nginx" {
  family                   = "nginx"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  task_role_arn            = "arn:aws:iam::312490145519:role/ecsTaskExecutionRole"
  execution_role_arn       = "arn:aws:iam::312490145519:role/ecsTaskExecutionRole"
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "nginx",
    "image": "docker.io/library/httpd:latest",
    "essential": true,
    "logConfiguration": {
                "logDriver": "awslogs",
                "options": {
                    "awslogs-region" : "ap-northeast-1",
                    "awslogs-group" : "dev",
                    "awslogs-stream-prefix" : "dev-nginx"
                }
    },
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort":      80,
        "protocol":      "tcp"
      }
    ]
  }
]
TASK_DEFINITION

  tags = {
    Terraform = "true"
    Environment = "dev"
  }

}