terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

module "namespace_test" {
  source = "./modules/ns-base"
  name = "terraform"
  annotations = {
    name = "terraform"
    creator  = "terraform"
  }
  labels = {
    env = "test"
  }
}
