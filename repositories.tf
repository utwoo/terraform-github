terraform {
  backend "azurerm" {
    resource_group_name  = "utwoo-dev"
    storage_account_name = "utterraformbackend"
    container_name       = "general"
    key                  = "github-repo.tfstate"
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0.0"
    }
  }
}

provider "github" {
  token = var.github_token
}

provider "azurerm" {
  features {}

  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = var.agent_client_id
  client_secret   = var.agent_client_secret
}

module "terraform_test" {
  source = "./modules/repo-base"

  name        = "terraform-test"
  description = "this repo create by terraform."
}
