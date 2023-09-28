# terraform {
#     organization = "mariachiinajar"

#     workspaces {
#         name = "terra-house"
#     }

#     cloud {
#         organization = "mariachiinajar"
#         workspaces {
#           name = "terra-house"
#         }
#     }
# }

module "terrahouse_aws" {
    source = "./modules/terrahouse_aws"
    user_uuid = var.user_uuid
    bucket_name = var.bucket_name
}
