resource "aws_security_group" "ludo_app" {
  vpc_id = var.vpc_id
  name   = var.service_name

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
    cidr_blocks     = []
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "ludo_app" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.app_instance_type
  key_name      = var.app_instance_ssh_key_name
  subnet_id     = var.app_subnet_id

  user_data = file("${path.module}/scripts/init_instance.sh")
}
