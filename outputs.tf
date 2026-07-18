output "id" {
  description = "ID of the Linux web app."
  value       = azurerm_linux_web_app.this.id
}

output "name" {
  description = "Name of the Linux web app."
  value       = azurerm_linux_web_app.this.name
}

output "default_hostname" {
  description = "Default hostname of the web app."
  value       = azurerm_linux_web_app.this.default_hostname
}

output "service_plan_id" {
  description = "ID of the service plan hosting the web app."
  value       = azurerm_service_plan.this.id
}
