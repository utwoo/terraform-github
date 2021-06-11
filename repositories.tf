terraform {
  backend "azurerm" {
    storage_account_name = "tfstorage"
    container_name       = "general"
    key                  = "github-repo.tfstate"
    use_msi              = true
    subscription_id      = var.subscription_id
    tenant_id            = var.tenant_id
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0.0"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
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
