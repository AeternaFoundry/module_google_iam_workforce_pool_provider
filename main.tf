resource "google_iam_workforce_pool_provider" "iam_workforce_pool_providers" {
  for_each = var.iam_workforce_pool_providers

  location               = each.value.location
  provider_id            = each.value.provider_id
  workforce_pool_id      = each.value.workforce_pool_id
  attribute_condition    = each.value.attribute_condition
  attribute_mapping      = each.value.attribute_mapping
  deletion_policy        = each.value.deletion_policy
  description            = each.value.description
  detailed_audit_logging = each.value.detailed_audit_logging
  disabled               = each.value.disabled
  display_name           = each.value.display_name
  scim_usage             = each.value.scim_usage

  dynamic "extended_attributes_oauth2_client" {
    for_each = each.value.extended_attributes_oauth2_client != null ? [each.value.extended_attributes_oauth2_client] : []
    content {
      attributes_type = extended_attributes_oauth2_client.value.attributes_type
      client_id       = extended_attributes_oauth2_client.value.client_id
      client_secret {
        dynamic "value" {
          for_each = extended_attributes_oauth2_client.value.client_secret.value != null ? [extended_attributes_oauth2_client.value.client_secret.value] : []
          content {
            plain_text            = value.value.plain_text
            plain_text_wo         = value.value.plain_text_wo
            plain_text_wo_version = value.value.plain_text_wo_version
          }
        }
      }
      issuer_uri = extended_attributes_oauth2_client.value.issuer_uri
      dynamic "query_parameters" {
        for_each = extended_attributes_oauth2_client.value.query_parameters != null ? [extended_attributes_oauth2_client.value.query_parameters] : []
        content {
          filter = query_parameters.value.filter
        }
      }
    }
  }

  dynamic "extra_attributes_oauth2_client" {
    for_each = each.value.extra_attributes_oauth2_client != null ? [each.value.extra_attributes_oauth2_client] : []
    content {
      attributes_type = extra_attributes_oauth2_client.value.attributes_type
      client_id       = extra_attributes_oauth2_client.value.client_id
      client_secret {
        dynamic "value" {
          for_each = extra_attributes_oauth2_client.value.client_secret.value != null ? [extra_attributes_oauth2_client.value.client_secret.value] : []
          content {
            plain_text            = value.value.plain_text
            plain_text_wo         = value.value.plain_text_wo
            plain_text_wo_version = value.value.plain_text_wo_version
          }
        }
      }
      issuer_uri = extra_attributes_oauth2_client.value.issuer_uri
      dynamic "query_parameters" {
        for_each = extra_attributes_oauth2_client.value.query_parameters != null ? [extra_attributes_oauth2_client.value.query_parameters] : []
        content {
          filter = query_parameters.value.filter
        }
      }
    }
  }

  dynamic "oidc" {
    for_each = each.value.oidc != null ? [each.value.oidc] : []
    content {
      client_id = oidc.value.client_id
      dynamic "client_secret" {
        for_each = oidc.value.client_secret != null ? [oidc.value.client_secret] : []
        content {
          dynamic "value" {
            for_each = client_secret.value.value != null ? [client_secret.value.value] : []
            content {
              plain_text            = value.value.plain_text
              plain_text_wo         = value.value.plain_text_wo
              plain_text_wo_version = value.value.plain_text_wo_version
            }
          }
        }
      }
      issuer_uri = oidc.value.issuer_uri
      jwks_json  = oidc.value.jwks_json
      dynamic "web_sso_config" {
        for_each = oidc.value.web_sso_config != null ? [oidc.value.web_sso_config] : []
        content {
          additional_scopes         = web_sso_config.value.additional_scopes
          assertion_claims_behavior = web_sso_config.value.assertion_claims_behavior
          response_type             = web_sso_config.value.response_type
        }
      }
    }
  }

  dynamic "saml" {
    for_each = each.value.saml != null ? [each.value.saml] : []
    content {
      idp_metadata_xml = saml.value.idp_metadata_xml
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

