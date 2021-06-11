terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }

     azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.63.0"
    }
  }
}

resource "github_repository" "repo" {
  name        = var.name
  description = var.description
  auto_init   = var.auto_init

  lifecycle {
    ignore_changes  = [auto_init]
    prevent_destroy = true
  }
}

resource "github_branch_default" "default_branch" {
  repository = github_repository.repo.name
  branch     = var.default_branch
}

resource "github_branch" "branches" {
  for_each   = toset(var.branches)
  repository = github_repository.repo.name
  branch     = each.value
}
