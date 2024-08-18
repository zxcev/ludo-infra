module "ludo_app" {
  source = "../mods/ludo_app"

  # vpc_id = 
  service_name      = "ludo"
  app_instance_type = "t2.micro"
  app_port          = "8080"
  region            = var.region
  health_check_path = "/health"
  health_check_port = "8080"

  vpc_id                    = data.terraform_remote_state.network.outputs.vpc_id
  public_subnets            = data.terraform_remote_state.network.outputs.public_subnets
  app_subnet_id             = data.terraform_remote_state.network.outputs.app_subnet_id
  app_instance_ssh_key_name = "sshkey.pem"

}
