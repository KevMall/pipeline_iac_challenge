provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "static_web" {
  name     = "${var.prefix}-rg"
  location = "West Europe"
}

resource "azurerm_service_plan" "static_plan" {
  name                = "${var.prefix}-plan"
  resource_group_name = azurerm_resource_group.static_web.name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "static_web_app" {
  name                = "${var.prefix}-plan"
  resource_group_name = azurerm_resource_group.static_web.name
  location            = var.location
  service_plan_id     = azurerm_service_plan.static_plan.id

  site_config {}
}