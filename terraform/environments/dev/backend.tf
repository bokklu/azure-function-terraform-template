terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tf-dbuc"
    storage_account_name = "satfdbuc"
    container_name       = "sactfdbuc"
    key                  = "terraform.tfstate"
  }
}