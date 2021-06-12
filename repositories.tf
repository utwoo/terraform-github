terraform {
 backend "azurerm" {
    resource_group_name  = "utwoo-dev"
    storage_account_name = "utterraformbackend"
    container_name       = "general"
    key                  = "github-repo.tfstate"
  }
 
 required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.63.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.agent_client_id
  client_secret   = var.agent_client_secret
  tenant_id       = var.tenant_id
}

resource "azurerm_resource_group" "utwooGithubAction" {
  name     = "utwooGithubAction"
  location = "West US"
}
