resource "aws_lb" "app" {
  name               = var.app_name
  subnets            = var.public_subnet_ids
  load_balancer_type = "application"
  internal           = false

  security_groups = [
    aws_security_group.alb.id,
  ]

  tags = {
    Name = "${var.app_name}"
  }
}

resource "aws_lb_target_group" "alb" {
  vpc_id = var.vpc_id

  name     = var.app_name
  port     = var.app_port
  protocol = "HTTP"

  health_check {
    interval            = 10
    port                = var.health_check_port
    path                = "/"
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name = var.app_name
  }

}

resource "aws_lb_listener" "alb" {
  load_balancer_arn = aws_lb.app.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb.arn
  }

  tags = {
    Name = var.app_name
  }
}

