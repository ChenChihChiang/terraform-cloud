terraform {
  backend "remote" {
    organization = "chihchinag"

workspaces {
      name = "terraform-cloud"
    }
  }
}
