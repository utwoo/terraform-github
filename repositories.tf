terraform {
  backend "azurerm" {
    resource_group_name  = "utwoo-dev"
    storage_account_name = "tfstorage"
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
}

module "terraform_test" {
  source = "./modules/repo-base"

  name        = "terraform-test"
  description = "this repo create by terraform."
}
