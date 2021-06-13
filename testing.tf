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

module "ns_terraform" {
  source = "./modules/ns-base"
  name   = "terraform"
  annotations = {
    creator = "terraform"
  }
}

module "nginx_test" {
  source = "./modules/svc-base"

  name         = "nginx"
  namespace    = module.ns_terraform.name
  replicas     = 2
  image        = "nginx:alpine"
  service_type = "NodePort"

  ports = [{
    port        = 8080
    target_port = 80
  }]
}

module "fakesvc_web" {
  source = "./modules/svc-base"

  name         = "web"
  namespace    = module.ns_terraform.name
  replicas     = 1
  image        = "nicholasjackson/fake-service:v0.21.0"
  service_type = "NodePort"

  ports = [{
    port        = 9090
    target_port = 9090
  }]

  environments = {
    LISTEN_ADDR = "0.0.0.0:9090"
    UPSTREAM_URIS = "http://api-svc:9090"
    MESSAGE = "Hello World"
    NAME = "web"
    SERVER_TYPE = "http"
  }
}

module "fakesvc_api" {
  source = "./modules/svc-base"

  name         = "api"
  namespace    = module.ns_terraform.name
  replicas     = 1
  image        = "nicholasjackson/fake-service:v0.21.0"
  service_type = "ClusterIP"

  ports = [{
    port        = 9090
    target_port = 9090
  }]

  environments = {
    LISTEN_ADDR = "0.0.0.0:9090"
    MESSAGE = "API response"
    NAME = "api"
    SERVER_TYPE = "http"
  }
}

