variable "name" {
  type        = string
  description = "Name of deployment"
}

variable "namespace" { type = string }

variable "labels" {
  type        = map(string)
  default     = null
  description = "Labels of deployment"
}

variable "annotations" {
  type        = map(string)
  default     = null
  description = "Annotations of deployment"
}

variable "replicas" {
  type    = number
  default = 1
}

variable "image" { type = string }

variable "service_type" { type = string }

variable "ports" {
  type = list(object({
    port        = number
    target_port = number
  }))
}
