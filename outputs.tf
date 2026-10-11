output "iam_workforce_pool_providers_id" {
  description = "Map of id values across all iam_workforce_pool_providers, keyed the same as var.iam_workforce_pool_providers except keys with no id are omitted"
  value       = { for k, v in google_iam_workforce_pool_provider.iam_workforce_pool_providers : k => v.id if v.id != null && length(v.id) > 0 }
}
output "iam_workforce_pool_providers_attribute_condition" {
  description = "Map of attribute_condition values across all iam_workforce_pool_providers, keyed the same as var.iam_workforce_pool_providers except keys with no attribute_condition are omitted"
  value       = { for k, v in google_iam_workforce_pool_provider.iam_workforce_pool_providers : k => v.attribute_condition if v.attribute_condition != null && length(v.attribute_condition) > 0 }
}
output "iam_workforce_pool_providers_attribute_mapping" {
  description = "Map of attribute_mapping values across all iam_workforce_pool_providers, keyed the same as var.iam_workforce_pool_providers except keys with no attribute_mapping are omitted"
  value       = { for k, v in google_iam_workforce_pool_provider.iam_workforce_pool_providers : k => v.attribute_mapping if v.attribute_mapping != null && length(v.attribute_mapping) > 0 }
}
output "iam_workforce_pool_providers_deletion_policy" {
  description = "Map of deletion_policy values across all iam_workforce_pool_providers, keyed the same as var.iam_workforce_pool_providers except keys with no deletion_policy are omitted"
  value       = { for k, v in google_iam_workforce_pool_provider.iam_workforce_pool_providers : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "iam_workforce_pool_providers_description" {
  description = "Map of description values across all iam_workforce_pool_providers, keyed the same as var.iam_workforce_pool_providers except keys with no description are omitted"
  value       = { for k, v in google_iam_workforce_pool_provider.iam_workforce_pool_providers : k => v.description if v.description != null && length(v.description) > 0 }
}
output "iam_workforce_pool_providers_detailed_audit_logging" {
  description = "Map of detailed_audit_logging values across all iam_workforce_pool_providers, keyed the same as var.iam_workforce_pool_providers except keys with no detailed_audit_logging are omitted"
  value       = { for k, v in google_iam_workforce_pool_provider.iam_workforce_pool_providers : k => v.detailed_audit_logging if v.detailed_audit_logging != null }
}
output "iam_workforce_pool_providers_disabled" {
  description = "Map of disabled values across all iam_workforce_pool_providers, keyed the same as var.iam_workforce_pool_providers except keys with no disabled are omitted"
  value       = { for k, v in google_iam_workforce_pool_provider.iam_workforce_pool_providers : k => v.disabled if v.disabled != null }
}
output "iam_workforce_pool_providers_display_name" {
  description = "Map of display_name values across all iam_workforce_pool_providers, keyed the same as var.iam_workforce_pool_providers except keys with no display_name are omitted"
  value       = { for k, v in google_iam_workforce_pool_provider.iam_workforce_pool_providers : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "iam_workforce_pool_providers_extended_attributes_oauth2_client" {
  description = "Map of extended_attributes_oauth2_client values across all iam_workforce_pool_providers, keyed the same as var.iam_workforce_pool_providers except keys with no extended_attributes_oauth2_client are omitted"
  value       = { for k, v in google_iam_workforce_pool_provider.iam_workforce_pool_providers : k => one(v.extended_attributes_oauth2_client) if v.extended_attributes_oauth2_client != null && length(v.extended_attributes_oauth2_client) > 0 }
  sensitive   = true
}
output "iam_workforce_pool_providers_extra_attributes_oauth2_client" {
  description = "Map of extra_attributes_oauth2_client values across all iam_workforce_pool_providers, keyed the same as var.iam_workforce_pool_providers except keys with no extra_attributes_oauth2_client are omitted"
  value       = { for k, v in google_iam_workforce_pool_provider.iam_workforce_pool_providers : k => one(v.extra_attributes_oauth2_client) if v.extra_attributes_oauth2_client != null && length(v.extra_attributes_oauth2_client) > 0 }
  sensitive   = true
}
output "iam_workforce_pool_providers_location" {
  description = "Map of location values across all iam_workforce_pool_providers, keyed the same as var.iam_workforce_pool_providers except keys with no location are omitted"
  value       = { for k, v in google_iam_workforce_pool_provider.iam_workforce_pool_providers : k => v.location if v.location != null && length(v.location) > 0 }
}
output "iam_workforce_pool_providers_name" {
  description = "Map of name values across all iam_workforce_pool_providers, keyed the same as var.iam_workforce_pool_providers except keys with no name are omitted"
  value       = { for k, v in google_iam_workforce_pool_provider.iam_workforce_pool_providers : k => v.name if v.name != null && length(v.name) > 0 }
}
output "iam_workforce_pool_providers_oidc" {
  description = "Map of oidc values across all iam_workforce_pool_providers, keyed the same as var.iam_workforce_pool_providers except keys with no oidc are omitted"
  value       = { for k, v in google_iam_workforce_pool_provider.iam_workforce_pool_providers : k => one(v.oidc) if v.oidc != null && length(v.oidc) > 0 }
  sensitive   = true
}
output "iam_workforce_pool_providers_provider_id" {
  description = "Map of provider_id values across all iam_workforce_pool_providers, keyed the same as var.iam_workforce_pool_providers except keys with no provider_id are omitted"
  value       = { for k, v in google_iam_workforce_pool_provider.iam_workforce_pool_providers : k => v.provider_id if v.provider_id != null && length(v.provider_id) > 0 }
}
output "iam_workforce_pool_providers_saml" {
  description = "Map of saml values across all iam_workforce_pool_providers, keyed the same as var.iam_workforce_pool_providers except keys with no saml are omitted"
  value       = { for k, v in google_iam_workforce_pool_provider.iam_workforce_pool_providers : k => one(v.saml) if v.saml != null && length(v.saml) > 0 }
}
output "iam_workforce_pool_providers_scim_usage" {
  description = "Map of scim_usage values across all iam_workforce_pool_providers, keyed the same as var.iam_workforce_pool_providers except keys with no scim_usage are omitted"
  value       = { for k, v in google_iam_workforce_pool_provider.iam_workforce_pool_providers : k => v.scim_usage if v.scim_usage != null && length(v.scim_usage) > 0 }
}
output "iam_workforce_pool_providers_state" {
  description = "Map of state values across all iam_workforce_pool_providers, keyed the same as var.iam_workforce_pool_providers except keys with no state are omitted"
  value       = { for k, v in google_iam_workforce_pool_provider.iam_workforce_pool_providers : k => v.state if v.state != null && length(v.state) > 0 }
}
output "iam_workforce_pool_providers_workforce_pool_id" {
  description = "Map of workforce_pool_id values across all iam_workforce_pool_providers, keyed the same as var.iam_workforce_pool_providers except keys with no workforce_pool_id are omitted"
  value       = { for k, v in google_iam_workforce_pool_provider.iam_workforce_pool_providers : k => v.workforce_pool_id if v.workforce_pool_id != null && length(v.workforce_pool_id) > 0 }
}

