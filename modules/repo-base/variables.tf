variable "name" {
  type        = string
  description = "Repository name"
}

variable "description" {
  type        = string
  default     = ""
  description = "Repository description"
}

variable "default_branch" {
  type        = string
  default     = "main"
  description = "Default branch of the repository"
}

variable "branches" {
  type        = list(string)
  default     = ["release", "dev"]
  description = "List of the repository branches"
}

variable "auto_init" {
  type        = string
  default     = "true"
  description = "If true, the repository will be initialized with an initial commit and a README file. If false, it will be empty"
}
