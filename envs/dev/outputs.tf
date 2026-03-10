output "api_url" {
  value = module.app.api_url
}

output "cms_url" {
  value = module.app.cms_url
}

output "db_connection_string_template" {
  value     = module.app.db_connection_string_template
  sensitive = true
}

output "acr_login_server" {
  value = module.app.acr_login_server
}
