resource "aws_security_group" "alb" {
  vpc_id = var.vpc_id

  name = local.service_name

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {}
}

resource "aws_security_group" "app_instance" {
  vpc_id = var.vpc_id
  name   = local.service_name

  ingress {
    # source_security_group_id = aws_
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "app" {
  name               = local.service_name
  load_balancer_type = "application"
  subnets            = var.public_subnets
  internal           = false

  security_groups = [
    aws_security_group.alb.id,
  ]

  tags = {}
}

resource "aws_lb_listener" "http" {
  protocol          = "HTTP"
  port              = "80"
  load_balancer_arn = aws_lb.app.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }
}

resource "aws_lb_target_group" "app" {
  vpc_id   = var.vpc_id
  name     = local.service_name
  port     = var.app_port
  protocol = "HTTP"

  health_check {
    interval            = 10
    port                = var.health_check_port
    path                = var.health_check_path
    timeout             = 3
    healthy_threshold   = 3
    unhealthy_threshold = 2
    matcher             = "200"
  }
}


