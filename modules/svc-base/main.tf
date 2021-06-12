terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0"
    }
  }
}

resource "kubernetes_deployment" "deploy" {
  metadata {
    namespace   = var.namespace
    annotations = var.annotations
    labels      = var.labels
    name        = var.name
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = var.labels
    }

    template {
      metadata {
        labels = var.labels
      }
      spec {
        container {
          image = var.image
          name  = var.name
        }
      }
    }
  }
}

resource "kubernetes_service" "svc" {
  metadata {
    namespace = var.namespace
    name      = "${var.name}-svc"
    labels    = var.labels
  }
  spec {
    selector = var.labels
    type     = var.service_type
    dynamic "port" {
      for_each = var.ports
      content {
        port        = port.value["port"]
        target_port = port.value["target_port"]
      }
    }
  }
}
