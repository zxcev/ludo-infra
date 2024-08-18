variable "regions" {
  type = object({
    ap_northeast_2 = string
  })

  default = {
    ap_northeast_2 = "ap-northeast-2"
  }
}

locals {
  remote_state = {

    network = {
      prod = {
        region = var.regions.ap_northeast_2
        bucket = "ludo-app-northeast-2-tfstate"
        key    = "ludo/terraform/network/prod-terraform.tfstate"
      }

      stag = {
        region = var.regions.ap_northeast_2
        bucket = "ludo-app-northeast-2-tfstate"
        key    = "ludo/terraform/network/stag-terraform.tfstate"
      }

    }

  }
}
