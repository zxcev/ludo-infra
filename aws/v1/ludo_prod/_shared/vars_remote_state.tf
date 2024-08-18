variable "remote_state" {
  type = object({
    network = {
      prod = {
        region = string
        bucket = string
        key    = string
      }
    }
    service = {
      prod = {
        region = string
        bucket = string
        key    = string
      }
    }
  })
}
