terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0"
    }
  }
}

resource "kubernetes_namespace" "ns" {
  metadata {
    annotations = var.annotations
    labels = var.labels
    name = var.name
  }
}