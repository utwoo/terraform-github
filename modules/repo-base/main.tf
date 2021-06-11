resource "github_repository" "repo" {
  name        = var.name
  description = var.desc
  auto_init   = var.auto_init
  
  lifecycle {
    ignore_changes  = [auto_init]
    prevent_destroy = false
  }
}
