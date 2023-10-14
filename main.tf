terraform {
  required_providers {
    terratowns = {
      source  = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
}

provider "terratowns" {
  endpoint  = "http://localhost:4567/api"
  user_uuid = "e328f4ab-b99f-421c-84c9-4ccea042c7d1"
  token     = "9b49b3fb-b8e9-483c-b703-97ba88eef8e0"
}

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

# module "terrahouse_aws" {
#   source              = "./modules/terrahouse_aws"
#   user_uuid           = var.user_uuid
#   bucket_name         = var.bucket_name
#   index_html_filepath = var.index_html_filepath
#   error_html_filepath = var.error_html_filepath
#   content_version     = var.content_version
#   assets_path         = var.assets_path
# }

resource "terratowns_home" "home" {
  name        = "Nomadiachi's nomadic life"
  description = <<DESCRIPTION
    Mariachi works nomadically so popping in and checking out here and there.
    Pictures of some memorable moments, quick snapshots of days in and days out. 
    Come join my nomadinary journey? :D 
DESCRIPTION
  # domain_name = module.terrahouse_aws.cloudfront_url
  domain_name     = "3fdq3gz.cloudfront.net"
  town            = "the-nomad-pad"
  content_version = 2
}
