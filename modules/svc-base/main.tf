terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0"
    }
  }
}

locals {
  default_labels      = merge({ app = var.name }, var.labels)
  default_annotations = merge({ createdBy = "terraform" }, var.annotations)
}

resource "kubernetes_deployment" "base" {
  metadata {
    namespace   = var.namespace
    annotations = local.default_annotations
    labels      = local.default_labels
    name        = var.name
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = local.default_labels
    }

    template {
      metadata {
        labels = local.default_labels
      }
      spec {
        container {
          image = var.image
          name  = var.name

          dynamic "env" {
            for_each = var.environments
            content {
              name   = env.key
              value = env.value
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "base" {
  metadata {
    namespace = var.namespace
    name      = "${var.name}-svc"
    labels    = local.default_labels
  }
  spec {
    selector = local.default_labels
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
