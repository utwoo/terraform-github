terraform {
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

module github-test {
    source = "./modules/repo-base"

    name = "github-test"
    desc = "github repo by terraform."
    default_branch = "master"
}