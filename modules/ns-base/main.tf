terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0"
    }
  }
}

# namespace
resource "kubernetes_namespace" "base" {
  metadata {
    annotations = var.annotations
    labels = var.labels
    name = var.name
  }
}