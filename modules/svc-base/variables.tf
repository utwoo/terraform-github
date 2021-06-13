variable "name" {
  type = string
}

variable "namespace" {
  type = string
}

variable "labels" {
  type    = map(string)
  default = null
}

variable "annotations" {
  type    = map(string)
  default = null
}

variable "replicas" {
  type    = number
  default = 1
}

variable "image" {
  type = string
}

# ClusterIP,NodePort
variable "service_type" {
  type = string
}

variable "ports" {
  type = list(object({
    port        = number
    target_port = number
  }))
}

variable "environments" {
  type = map
  default = {}
}
