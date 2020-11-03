// Modify values below as needed
# Aviatrix Controller
controller_ip = "REPLACE_ME"
username      = "REPLACE_ME"
password      = "REPLACE_ME"

# Azure Access Account Name defined in Controller
azure_account_name = "REPLACE_ME"

# NGFW Variables
firewall_image         = "Palo Alto Networks VM-Series Next-Generation Firewall Bundle 2"
firewall_image_version = "9.1.0"

# HA flags
ha_enabled = true

# Transit Gateway Network Variables
//Azure
azure_transit_cidr1 = "10.21.2.0/24"
azure_region1       = "East US"

# Transit Spoke Parameters
// Azure Spokes
azure_spoke1_name   = "azure-app1s2"
azure_spoke1_cidr   = "10.21.1.0/24"
azure_spoke1_region = "East US"
azure_spoke2_name   = "azure-app2s2"
azure_spoke2_cidr   = "10.21.3.0/24"
azure_spoke2_region = "East US"