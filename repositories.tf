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

module terraform_test {
    source = "./modules/repo-base"

    name = "terraform-test"
    description = "this repo create by terraform."
}