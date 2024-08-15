locals {
  project = var.project
  owners  = var.owners
  env     = var.environment
  name    = "${local.project}-${local.env}"

  azs = [
    for az_name in data.aws_availability_zones.available.names :
    az_name if endswith(az_name, "a") || endswith(az_name, "c")
  ]

  public_subnet_cidr_blocks = [
    for i, az in local.azs :
    cidrsubnet(var.vpc_cidr_block, 4, i)
  ]

  private_subnet_cidr_blocks = [
    for i, az in local.azs :
    cidrsubnet(var.vpc_cidr_block, 4, 4 + i)
  ]

  isolated_private_subnet_cidr_blocks = [
    for i, az in local.azs :
    cidrsubnet(var.vpc_cidr_block, 4, 8 + i)
  ]

  common_tags = {
    Project = local.project
    Env     = local.env
    Owners  = local.owners
  }

  vpc_tags = merge(
    local.common_tags, {
      Name = "${local.name}"
    }
  )

  igw_tags = merge(
    local.common_tags, {
      Name = "${local.name}"
    }
  )

  nat_tags = merge(
    local.common_tags, {
      Name = "${local.name}"
    }
  )

  public_subnet_tags = merge(
    local.common_tags, {
      Name = "${local.name}-public"
    }
  )

  private_subnet_tags = merge(
    local.common_tags, {
      Name = "${local.name}-private"
    }
  )

  isolated_private_subnet_tags = merge(
    local.common_tags, {
      Name = "${local.name}-isloated-private"
    }
  )

  public_rt_tags = merge(
    local.common_tags, {
      Name = "${local.name}-public"
    }
  )
  # for az in local.azs : az => merge(
  #   local.common_tags, {
  #     Name = "${local.name}-public"
  #   }
  # )

  private_rt_tags_map = {
    for az in local.azs : az => merge(
      local.common_tags, {
        Name = "${local.name}-private"
      }
    )
  }

  isolated_private_rt_tags_map = {
    for az in local.azs : az => merge(
      local.common_tags, {
        Name = "${local.name}-isloated-private"
      }
    )
  }

}

#   tags = {
#     common = {
#       Project = local.project
#       Env     = local.env
#       Owners  = local.owners
#     }

#     vpc = merge(
#       local.tags.common, {
#         Name = "${local.name}"
#       }
#     )

#     igw = merge(
#       local.tags.common, {
#         Name = "${local.name}-main"
#       }
#     )

#     public_subnet = merge(
#       local.tags.common, {
#         Name = "${local.name}-public"
#       }
#     )

#     private_subnet = merge(
#       local.tags.common, {
#         Name = "${local.name}-private"
#       }
#     )

#     nat_private_subnet = merge(
#       local.tags.common, {
#         Name = "${local.name}-nat-private"
#       }
#     )

#   }






