resource "aws_security_group" "alb" {
  vpc_id = var.vpc_id

  name        = var.app_name
  description = "Application Load Balancer for ${var.app_name}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.alb_ingress_cidr_blocks
  }

  egress {
    from_port = 0
    to_port   = 0
    // all protocol
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}

resource "aws_security_group" "instance" {
  vpc_id = var.vpc_id

  name        = var.app_name
  description = ""

  ingress {
    from_port = var.app_port
    to_port   = var.app_port
    protocol  = "tcp"

    security_groups = [
      aws_security_group.alb.id,
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

