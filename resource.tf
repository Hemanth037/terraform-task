resource "azurerm_resource_group" "practice-terra05" {
  name     = "terra-practice"
  location = "East US"
}

resource "azurerm_virtual_network" "practice-vnet05" {
    name                = "vnet-practice"
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.practice-terra05.location
    resource_group_name = azurerm_resource_group.practice-terra05.name
}
 
resource "azurerm_subnet" "subnet1" {
    name                 = "subnet1"
    resource_group_name  = azurerm_resource_group.practice-terra05.name
    virtual_network_name = azurerm_virtual_network.practice-vnet05.name
    address_prefixes     = ["10.0.1.0/24"]
}
 
