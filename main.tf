terraform {
  required_providers {
    terratowns = {
      source  = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #     workspaces {
  #         name = "terra-house"
  #     }

  cloud {
    organization = "mariachiinajar"
    workspaces {
      name = "terra-house"
    }
  }
}

provider "terratowns" {
  endpoint  = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token     = var.terratowns_access_token
}

module "home_nomadiachi_hosting" {
  source          = "./modules/terrahome_aws"
  user_uuid       = var.teacherseat_user_uuid
  public_path     = var.nomadiachi.public_path
  content_version = var.nomadiachi.content_version
}

resource "terratowns_home" "home" {
  name            = "Nomadiachi's nomadic life"
  description     = <<DESCRIPTION
    Mariachi works nomadically so popping in and checking out here and there.
    Pictures of some memorable moments, quick snapshots of days in and days out. 
    Come join my nomadinary journey? :D 
DESCRIPTION
  domain_name     = module.home_nomadiachi_hosting.domain_name
  town            = "missingo"
  content_version = var.nomadiachi.content_version
}

module "home_voices_hosting" {
  source              = "./modules/terrahome_aws"
  user_uuid           = var.teacherseat_user_uuid
  public_path = var.voices.public_path
  content_version     = var.voices.content_version
}

resource "terratowns_home" "home_voices" {
  name        = "Voices that keep me going"
  description = <<DESCRIPTION
    There were many moments and days I entertained quitting. 
    But there were voices that give me nudges and pushes (and punches and smashes... and slaps and !@#$@$). 
    I'm still here and keep moving forward.
    Come have a look who are those with the badass voices. lol
DESCRIPTION
  domain_name = module.home_voices_hosting.domain_name
  town            = "missingo"
  content_version = var.voices.content_version
}
