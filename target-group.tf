resource "aws_lb_target_group" "target" {
  name     = var.tg-name
  port     = var.target_port
  protocol = var.tg_protocol
  vpc_id   = aws_vpc.loadbalance.id
  target_type = "ip"
  health_check {
    path                = "/"
    interval            = 5
    timeout             = 4
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }
}

