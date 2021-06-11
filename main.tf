module github-test {
    source = "./modules/repo-base"

    name = "github-test"
    desc = "github test repo by terraform."
    default_branch = "master"

    github_token = var.github_token
}