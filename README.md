# Terraform: Github provider
## Tasks
- [x] Use Azure backend storage to save .tfstate file.
- [x] Module for creating github repo and branches.

## Terraform Variables
* github_token: github token with specific access. (default github toekn in github action hasn't access to create repositories.)
* agent_client_id:  AppId in Azure Service Principal
* agent_client_secret: Password in Azure Service Principal
* tenant_id: tenant in Azure Service Principal
* subscription_id: Subscription ID in Azure
