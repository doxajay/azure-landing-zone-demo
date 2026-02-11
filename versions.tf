terraform {
  required_version = ">= 1.5.0"

  cloud {
    organization = "POV-1"
    workspaces {
      name = "azure-landing-zone-demo-prod"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}
