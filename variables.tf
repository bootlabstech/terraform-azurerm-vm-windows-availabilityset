# virtual_machine
variable "name" {
  type        = string
  description = "Name for the virtual machine. Must not contain uppercase maximum of 15 characters length"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group inside which the VM will be created in"
}

variable "location" {
  type        = string
  description = "Location of the resource group. Must be one of following, Central India or South India"
}

variable "vm_size" {
  type        = string
  description = "Specifies the size of the Virtual Machine.Refer documentation for all options"
}

variable "admin_username" {
  type        = string
  description = "Specifies the name of the local administrator account."

}

variable "license_type" {
  type        = string
  description = "The License type for Windows VM . Must be one of the values [None, Windows_Client, Windows_Server]"

}

variable "patch_assessment_mode" {
  type = string
  default = "AutomaticByPlatform"

}

variable "patch_mode" {
  type = string
  default = "AutomaticByPlatform"
}

# os_disk
variable "storage_account_type" {
  type        = string
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS, Premium_LRS, StandardSSD_ZRS and Premium_ZRS"
  default     = "Standard_LRS"
}

variable "disk_size_gb" {
  type        = string
  description = "The Size of the Internal OS Disk in GB, if you wish to vary from the size used in the image this Virtual Machine is sourced from."

}

# # source_image_reference
# variable "publisher" {
#   type        = string
#   description = "Specifies the Publisher of the Marketplace Image this Virtual Machine should be created from.View documentation for all options"
#   default     = "MicrosoftWindowsServer"
# }

# variable "offer" {
#   type        = string
#   description = " Specifies the offer of the image used to create the virtual machines.View documentation for all options "
#   default     = "WindowsServer"
# }

variable "availability_set_id" {
  type        = string
  description = "Specifies the SKU of the image used to create the virtual machines.View documentation for all options"

}




# azurerm_network_interface
variable "ip_name" {
  type        = string
  description = "A name used for this IP Configuration."
  default     = "internal"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the Subnet where this Network Interface should be located in. Select subnet according to factors 1.application server (appsubnet) 2. web server (websubnet) 3. database server (dbsubnet)"
}

variable "private_ip_address_allocation" {
  type        = string
  description = "The allocation method used for the Private IP Address. Possible values are Dynamic and Static"
  default     = "Dynamic"
}

# azurerm_network_security_rule
variable "nsg_rules" {
  type = map(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_address_prefix      = string
    source_port_range          = string
    destination_address_prefix = string
    destination_port_range     = string
  }))
  default = {
    "https" = {
      access                     = "Allow"
      destination_address_prefix = "*"
      destination_port_range     = "443"
      direction                  = "Inbound"
      name                       = "allow-https"
      priority                   = 100
      protocol                   = "Tcp"
      source_address_prefix      = "*"
      source_port_range          = "*"
    }
  }
}

# azurerm_recovery_services_vault
variable "recovery_services_vault_name" {
  type        = string
  description = "name of the recover service vault"
}
variable "services_vault_resource_group_name" {
  type        = string
  description = "name of resource group where the recovery service vault reside in"
}
variable "keyvault_name" {
  type        = string
  description = "name of keyvault where VM password will be stored in"
}
variable "image_id" {
  type        = string
  
}
variable "secure_boot_enabled" {
  type        = bool
  default = true
  
}