resource "aws_ecs_task_definition" "test" {
  family                   = "webapp"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 3072
  execution_role_arn       = "arn:aws:iam::058264111519:role/mayank-ecs-execution-role"
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "maya-container",
    "image": "${aws_ecr_repository.foo.repository_url}:v1",
    "cpu": 1024,
    "memory": 3072,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ]
  }
]
TASK_DEFINITION

  runtime_platform {

    cpu_architecture = "X86_64"
  }
}