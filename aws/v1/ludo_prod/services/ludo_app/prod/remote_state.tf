data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = local.remote_state.service.ludo_app.prod
}
