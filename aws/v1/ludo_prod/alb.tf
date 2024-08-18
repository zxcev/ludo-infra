# module "alb" {
#   source   = "./mod/alb"
#   app_name = "ludo-application"

#   public_subnet_cidr_blocks = local.public_subnet_cidr_blocks
#   public_subnet_ids = [
#     for subnet in aws_subnet.public : subnet.id
#   ]
#   vpc_id            = aws_vpc.main.id
#   app_port          = 80
#   health_check_port = 80
#   #   az                        = local.azs
#   region = var.aws_region
# }
