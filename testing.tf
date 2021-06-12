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
  name   = "terraform"
  annotations = {
    name    = "terraform"
    creator = "terraform"
  }
  labels = {
    env = "test"
  }
}

module "nginx_test" {
  source = "./modules/svc-base"

  name      = "nginx"
  namespace = module.namespace_test.name
  labels = {
    app = "nginx"
  }
  annotations = {
    app     = "nginx"
    creator = "terraform"
  }
  replicas     = 2
  image        = "nginx:alpine"
  service_type = "NodePort"

  ports = [{
    port        = 8080
    target_port = 80
  }]
}
