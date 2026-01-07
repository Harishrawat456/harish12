


terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.32.0"
    }
  }
   
}


provider "azurerm" {
  features {}
  client_id       = "b6c3c877-7158-4283-9bcb-311f5602bf19"
  client_secret   = "~HO8Q~fK3V5JQOKLP99AWSSQmmEt6sJ8xZk-mcHh"
  tenant_id       = "c28e5f26-06dc-439c-b874-557c13f4c5e6"
  subscription_id = "eac08841-5119-4501-b5ac-82e7a5d29114"
}

