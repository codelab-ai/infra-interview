output "client_id" {
  value = auth0_client.app.client_id
}

output "client_secret" {
  value = auth0_client.app.client_secret
}

output "grant_types" {
  value = auth0_client.app.grant_types
}
