variable "username" {
  type    = string
  default = ""
}

variable "password" {
  type    = string
  default = ""
}

variable "controller_ip" {
  type    = string
  default = ""
}

variable "aws_transit_1_gw_name" {
  default = ""
}

variable "aws_transit_2_gw_name" {
  default = ""
}

variable "azure_account_name" {
  default = ""
}

variable "azure_transit_cidr1" {
  default = ""
}

variable "azure_region1" {
  default = ""
}

variable "azure_gw_size" {
  default = ""
}

variable "azure_spoke1_name" {
  type    = string
  default = ""
}

variable "azure_spoke1_cidr" {
  type    = string
  default = ""
}

variable "azure_spoke1_region" {
  type    = string
  default = ""
}

variable "azure_spoke2_name" {
  type    = string
  default = ""
}

variable "azure_spoke2_cidr" {
  type    = string
  default = ""
}

variable "azure_spoke2_region" {
  type    = string
  default = ""
}

variable "firewall_image" {
  type    = string
  default = ""
}

variable "firewall_image_version" {
  type    = string
  default = ""
}

variable "insane" {
  type    = bool
  default = true
}

variable "ha_enabled" {
  type    = bool
  default = true
}

variable "azure_test_vm_rg" {
  type    = string
  default = ""
}

variable "instance_size" {
  type    = string
  default = ""
}

variable "test_instance_size" {
  type    = string
  default = ""
}

