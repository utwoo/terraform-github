variable name {
  type = string
  description = "Name of namespace"
}

variable labels {
    type = map(string)
    default = null
    description = "Labels of namespace"
}

variable annotations {
    type = map(string)
    default = null
    description = "Annotations of namespace"
} 