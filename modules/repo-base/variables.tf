variable "name" {}
variable "desc" {}
variable "default_branch" {}

variable "auto_init" {
  type        = string
  default     = "true"
  description = "If true, the repository will be initialized with an initial commit and a README file. If false, it will be empty"
}
