variable "resource_group_name" {
    description = "the name of the resource group for the key vault instance"
    type = string
}

variable "resource_group_location" {
    description = "the location of the resource group"
    type = string
}

variable "azuread_application_name" {
    description = "the name of service principal or enterprise application name"
    type = string
}

variable "key_vault_name" {
    description = "the name of the key vault instance"
    type = string
}

variable "key_vault_secret_name" {
    description = "the value of the key vault secret name"
    type = string
}