output repository_attributes {
    value = {
        id = module.terraform_test.repository_attributes.repo_id
        full_name= module.terraform_test.repository_attributes.full_name
        html_url= module.terraform_test.repository_attributes.html_url
        git_clone_url = module.terraform_test.repository_attributes.git_clone_url
    }
}