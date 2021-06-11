terraform {
 backend "azurerm" {
    storage_account_name = "utterraformbackend"
    container_name       = "general"
    key                  = "github-repo.tfstate"
    access_key           =  var.storage_access_key
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

  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = var.agent_client_id
  client_secret   = var.agent_client_secret
}

resource "azurerm_resource_group" "utwooGithubAction" {
  name     = "utwooGithubAction"
  location = "West US"
}
