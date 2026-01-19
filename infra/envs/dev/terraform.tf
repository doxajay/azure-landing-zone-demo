terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  cloud {
    organization = "paul-landingzone-org"

    workspaces {
      name = "alz-dev"
    }
  }
}
