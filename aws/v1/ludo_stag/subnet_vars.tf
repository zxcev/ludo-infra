# variable "subnet_config" {
#   description = "map of subnet configuration"

#   type = map(
#     object({
#       public = object({
#         cidr_block        = string
#         availability_zone = string
#       })
#       private = object({
#         cidr_block        = string
#         availability_zone = string
#       })
#       isolated_private = object({
#         cidr_block        = string
#         availability_zone = string
#       })
#     })
#   )

#   default = {
#     for az in local.azs : az => {
#       public = {
#         availability_zone = az
#         cidr_block        = "value"
#       }
#       private = {
#         availability_zone = az
#         cidr_block        = "value"
#       }
#       isolated_private = {
#         availability_zone = az
#         cidr_block        = "value"
#       }
#     }
#   }

# }
