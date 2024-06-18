resource "aws_ecs_cluster" "foo" {
  name = "web-app-cluster"
}



# service
resource "aws_ecs_service" "ecs" {
  name            = "web-app"
  cluster         = aws_ecs_cluster.foo.id
  task_definition = aws_ecs_task_definition.test.arn
  desired_count   = 2
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = [aws_subnet.pub.id, aws_subnet.public.id]
    security_groups  = [aws_security_group.allow_tls.id]
    assign_public_ip = true
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.target.arn
    container_name   = "maya-container"
    container_port   = 80

  }
  depends_on = [aws_lb_listener.front_end]


}

resource "null_resource" "open_browser" {
  provisioner "local-exec" {
    command = "start chrome http://${aws_lb.test.dns_name}:4000"
  }
  depends_on = [aws_ecs_service.ecs]
}
