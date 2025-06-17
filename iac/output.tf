output "web_app_url" {
  value = "https://${azurerm_linux_web_app.static_web_app.default_hostname}"
}