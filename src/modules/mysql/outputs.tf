output "server_name" {
  value = azurerm_mysql_flexible_server.mysql_server.name
  description = "Server name"
  sensitive = false
}
output "server_id" {
  value       = azurerm_mysql_flexible_server.mysql_server.id 
  description = "value of the mysql server id"
  sensitive = false
}

output "database_names" {
  value = {
    for k, v in azurerm_mysql_flexible_database.mysql_db : k => v.name
  }
  description = "Database names"
  sensitive = false
}

output "database_ids" {
  value = {
    for k, v in azurerm_mysql_flexible_database.mysql_db : k => v.id
  }
  description = "Database ids"
  sensitive = false
}