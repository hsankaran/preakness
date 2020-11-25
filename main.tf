// Preakness with Test Kit
# Azure Transit Module
module "azure_transit_1" {
  source                 = "terraform-aviatrix-modules/azure-transit-firenet/aviatrix"
  version                = "1.1.1"
  ha_gw                  = true
  cidr                   = var.azure_transit_cidr1
  region                 = var.azure_region1
  account                = var.azure_account_name
  attached               = false
  firewall_image         = var.firewall_image
  firewall_image_version = var.firewall_image_version
  instance_size = var.instance_size
}

# Azure Spoke 1 
module "azure_spoke1" {
  source         = "terraform-aviatrix-modules/azure-spoke/aviatrix"
  version        = "1.1.1"
  name           = var.azure_spoke1_name
  cidr           = var.azure_spoke1_cidr
  region         = var.azure_spoke1_region
  account        = var.azure_account_name
  instance_size  = var.instance_size
  ha_gw          = var.ha_enabled
  transit_gw     = module.azure_transit_1.transit_gateway.gw_name
}

# Azure Spoke 2
module "azure_spoke2" {
  source     = "terraform-aviatrix-modules/azure-spoke/aviatrix"
  version    = "1.1.1"
  name           = var.azure_spoke2_name
  cidr           = var.azure_spoke2_cidr
  region         = var.azure_spoke2_region
  account        = var.azure_account_name
  instance_size  = var.instance_size
  ha_gw          = var.ha_enabled
  transit_gw     = module.azure_transit_1.transit_gateway.gw_name
}

# Test Azure RG + Instances
resource "azurerm_resource_group" "example" {
  name     = "aviatrix-test-rg"
  location = var.azure_region1
}

module "azure_test_vm1" {
  source                        = "Azure/compute/azurerm"
  resource_group_name           = azurerm_resource_group.example.name
  vm_hostname                   = "avxtestvm1"
  nb_public_ip                  = 1
  remote_port                   = "22"
  vm_os_simple                  = "UbuntuServer"
  vnet_subnet_id                = module.azure_spoke1.vnet.public_subnets[1].subnet_id
  delete_os_disk_on_termination = true
  custom_data                   = data.template_file.azure-init.rendered
  vm_size                       = var.test_instance_size
  tags = {
    environment = "aviatrix-poc"
    name        = "aviatrix-test-vm1"
  }
}

module "azure_test_vm2" {
  source                        = "Azure/compute/azurerm"
  resource_group_name           = azurerm_resource_group.example.name
  vm_hostname                   = "avxtestvm2"
  nb_public_ip                  = 1
  remote_port                   = "22"
  vm_os_simple                  = "UbuntuServer"
  vnet_subnet_id                = module.azure_spoke2.vnet.public_subnets[1].subnet_id
  delete_os_disk_on_termination = true
  custom_data                   = data.template_file.azure-init.rendered
  vm_size                       = var.test_instance_size
  tags = {
    environment = "aviatrix-poc"
    name        = "aviatrix-test-vm2"
  }
}

data "template_file" "azure-init" {
  template = "${file("${path.module}/azure-vm-config/azure_bootstrap.sh")}"
}

