resource "aws_ecs_task_definition" "nginx" {
  family                   = "nginx"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  execution_role_arn       = "arn:aws:iam::312490145519:role/aws-service-role/ecs.amazonaws.com/AWSServiceRoleForECS"
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "nginx",
    "image": "312490145519.dkr.ecr.ap-northeast-1.amazonaws.com/nginx:latest",
    "cpu": 512,
    "memory": 1024,
    "essential": true,
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