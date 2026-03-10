terraform {
  backend "azurerm" {
    resource_group_name  = "REPLACE_WITH_REAL_VALUE"
    storage_account_name = "REPLACE_WITH_REAL_VALUE"
    container_name       = "tfstate"
    key                  = "staging.terraform.tfstate"
  }
}
