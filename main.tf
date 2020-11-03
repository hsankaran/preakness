// Preakness
# Azure Transit Module
module "azure_transit_1" {
  source                 = "terraform-aviatrix-modules/azure-transit-firenet/aviatrix"
  version                = "1.1.1"
  ha_gw                  = true
  cidr                   = var.azure_transit_cidr1
  region                 = var.azure_region1
  account                = var.azure_account_name
  firewall_image         = var.firewall_image
  firewall_image_version = var.firewall_image_version
}

# Azure Spoke 1 
module "azure_spoke1" {
  source     = "terraform-aviatrix-modules/azure-spoke/aviatrix"
  version    = "1.1.1"
  name       = var.azure_spoke1_name
  cidr       = var.azure_spoke1_cidr
  region     = var.azure_spoke1_region
  account    = var.azure_account_name
  ha_gw      = var.ha_enabled
  transit_gw = module.azure_transit_1.transit_gateway.gw_name
}

# Azure Spoke 2
module "azure_spoke2" {
  source     = "terraform-aviatrix-modules/azure-spoke/aviatrix"
  version    = "1.1.1"
  name       = var.azure_spoke2_name
  cidr       = var.azure_spoke2_cidr
  region     = var.azure_spoke2_region
  account    = var.azure_account_name
  ha_gw      = var.ha_enabled
  transit_gw = module.azure_transit_1.transit_gateway.gw_name
}

/*# Multi region AWS and Single region Azure transit peering
module "transit-peering" {
  source           = "terraform-aviatrix-modules/mc-transit-peering/aviatrix"
  version          = "1.0.0"
  transit_gateways = [var.aws_transit_1_gw_name, var.aws_transit_2_gw_name, module.azure_transit_1.transit_gateway.gw_name]
}*/
