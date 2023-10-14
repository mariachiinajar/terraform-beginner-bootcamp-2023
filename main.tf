terraform {
  required_providers {
    terratowns = {
      source  = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
}

provider "terratowns" {
  endpoint  = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token     = var.terratowns_access_token
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

module "terrahouse_aws" {
  source              = "./modules/terrahouse_aws"
  user_uuid           = var.teacherseat_user_uuid
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version     = var.content_version
  assets_path         = var.assets_path
}

resource "terratowns_home" "home" {
  name        = "Nomadiachi's nomadic life"
  description = <<DESCRIPTION
    Mariachi works nomadically so popping in and checking out here and there.
    Pictures of some memorable moments, quick snapshots of days in and days out. 
    Come join my nomadinary journey? :D 
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  # domain_name     = "4fdq3gz.cloudfront.net"
  town            = "missingo"
  content_version = 3
}
