


module "rg_config" {
  source    = "../../modules/azurerm_resource_group"
  rg_config = var.rg_config
}

module "vnet" {
  source      = "../../modules/azurerm_networking"
  vnet_config = var.vnet_config
  depends_on  = [module.rg_config]
}

module "subnet" {
  source        = "../../modules/azurerm_subnet"
  subnet_config = var.subnet_config
  depends_on    = [module.vnet]
}

module "pip" {
  source     = "../../modules/azurerm_Public-IP"
  ip_config  = var.ip_config
  depends_on = [module.rg_config]
}

module "nic" {
  source     = "../../modules/azurerm_nic"
  nic_config = var.nic_config
  depends_on = [module.subnet, module.pip]
}

module "nsg" {
  source     = "../../modules/azurerm_nsg"
  nsg_config = var.nsg_config
  depends_on = [module.rg_config]
}

module "nsg_association" {
  source         = "../../modules/azurerm_nsg_associaton"
  nsg_nic_config = var.nsg_nic_config
  depends_on     = [module.nic, module.nsg]
}

module "vm" {
  source     = "../../modules/azurerm_VM"
  vm_config  = var.vm_config
  depends_on = [module.nic]
}
