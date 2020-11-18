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

# Aviatrix Gateway size
instance_size = "Standard_F16s_v2"
# Test Kit
test_instance_size = "Standard_F16s_v2" # 8000 Mbps

# HA flags
ha_enabled = false

# Transit Gateway Network Variables
//Azure
azure_transit_cidr1 = "10.21.2.0/24"
azure_region1       = "West US"

# Transit Spoke Parameters
// Azure Spokes
azure_spoke1_name   = "azure-app1s2"
azure_spoke1_cidr   = "10.21.1.0/24" # REPLACE_ME
azure_spoke1_region = "West US"
azure_spoke2_name   = "azure-app2s2"
azure_spoke2_cidr   = "10.21.3.0/24" # REPLACE_ME
azure_spoke2_region = "West US"



