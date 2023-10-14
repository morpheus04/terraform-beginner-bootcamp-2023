terraform {
  required_providers {
    terratowns = {
      source  = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "morpheus-io"

  #  workspaces {
  #    name = "terraform-house"
  #  }
  #}
  cloud {
    organization = "morpheus-io"
    workspaces {
      name = "terraform-house"
    }
  }
}


provider "terratowns" {
  endpoint  = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token     = var.terratowns_access_token
}

module "home_playlist_hosting" {
  source          = "./modules/terrahome_aws"
  user_uuid       = var.teacherseat_user_uuid
  public_path     = var.playlist.public_path
  content_version = var.playlist.content_version
}

resource "terratowns_home" "home_playlist" {
  name            = "Music is the divine way to tell beautiful, poetic things to the heart!"
  description     = <<DESCRIPTION
Music is a moral law. It gives soul to the universe, wings to the mind, flight to the imagination, and charm and gaiety to life and to everything.
DESCRIPTION
  domain_name     = module.home_playlist_hosting.domain_name
  town            = var.playlist.town
  content_version = var.playlist.content_version
}


/* module "home_arcanum_hosting" {
  source          = "./modules/terrahome_aws"
  user_uuid       = var.teacherseat_user_uuid
  public_path     = var.arcanum.public_path
  content_version = var.arcanum.content_version
}
resource "terratowns_home" "home" {
  name            = "How to play Arcanum in 2023!"
  description     = <<DESCRIPTION
Arcanum is a game from 2001 that shipped with alot of bugs.
Modders have removed all the originals making this game really fun
to play (despite that old look graphics). This is my guide that will
show you how to play arcanum without spoiling the plot.
DESCRIPTION
  domain_name     = module.home_arcanum_hosting.domain_name
  town            = var.arcanum.town
  content_version = var.arcanum.content_version
} */

/* module "home_payday_hosting" {
  source          = "./modules/terrahome_aws"
  user_uuid       = var.teacherseat_user_uuid
  public_path     = var.payday.public_path
  content_version = var.payday.content_version
}

resource "terratowns_home" "home_payday" {
  name            = "Making your Payday Bar"
  description     = <<DESCRIPTION
Since I really like Payday candy bars but they cost so much to import
into Canada, I decided I would see how I could my own Paydays bars,
and if they are most cost effective.
DESCRIPTION
  domain_name     = module.home_payday_hosting.domain_name
  town            = var.payday.town
  content_version = var.payday.content_version
}  */