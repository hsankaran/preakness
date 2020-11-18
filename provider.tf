provider "aviatrix" {
  controller_ip = var.controller_ip
  username      = var.username
  password      = var.password
  version       = "2.17"
}

provider "azurerm" {
  version = "=2.30.0"
  features {}
}