locals {
  remote_state = {
    service = {
      ludo_app = {
        prod = {
          region = var.regions.ap_northeast_2
          bucket = ""
          key    = ""
        }
      }
    }
  }
}
