variable "sg_tags" {
  type = object({
    app = {
      Name = string
      env  = string
    }
  })
}
