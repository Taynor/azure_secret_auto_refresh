# Azure Secret Auto Refresh
Refresh secret for Service Principal using Terraform and store the refreshed secret into the Key Vault

# Prerequisites
- Terraform 1.4.6
- Existing Resource Group
- Existing Service Principal


## Internal module prerequisites
hashicorp/azurerm minimum 3.57.0

## Overview
The Terraform code that takes an existing Azure Service Principal, creates a new secret and stores the new secret value into a Key Vault secret.

## Resources created
- time_rotating
- azuread_application_password
- azurerm_key_vault_secret

## Existing resources referenced
- azurerm_resource_group
- azuread_application
- azurerm_key_vault

## Terraform provider Links 
- azuread_application_password
https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_password

- azurerm_key_vault_secret
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret

## Instructions
- Initiate Terraform by running the following command:
"terraform init"

- Validate the terraform configuration
"terraform validate"

- Create a Terraform of the configuration to manage State using the tfplan State file
"terraform plan -out=tfplan"

- Execute the Terraform configuration by using the tfplan State file
"terraform apply tfplan"
