variable "iam_workforce_pool_providers" {
  description = <<EOT
Map of iam_workforce_pool_providers, attributes below
Required:
    - location
    - provider_id
    - workforce_pool_id
Optional:
    - attribute_condition
    - attribute_mapping
    - deletion_policy
    - description
    - detailed_audit_logging
    - disabled
    - display_name
    - scim_usage
    - extended_attributes_oauth2_client (block):
        - attributes_type (required)
        - client_id (required)
        - client_secret (required, block):
            - value (optional, block):
                - plain_text (optional)
                - plain_text_wo (optional)
                - plain_text_wo_version (optional)
        - issuer_uri (required)
        - query_parameters (optional, block):
            - filter (optional)
    - extra_attributes_oauth2_client (block):
        - attributes_type (required)
        - client_id (required)
        - client_secret (required, block):
            - value (optional, block):
                - plain_text (optional)
                - plain_text_wo (optional)
                - plain_text_wo_version (optional)
        - issuer_uri (required)
        - query_parameters (optional, block):
            - filter (optional)
    - oidc (block):
        - client_id (required)
        - client_secret (optional, block):
            - value (optional, block):
                - plain_text (optional)
                - plain_text_wo (optional)
                - plain_text_wo_version (optional)
        - issuer_uri (required)
        - jwks_json (optional)
        - web_sso_config (optional, block):
            - additional_scopes (optional)
            - assertion_claims_behavior (required)
            - response_type (required)
    - saml (block):
        - idp_metadata_xml (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    location               = string
    provider_id            = string
    workforce_pool_id      = string
    attribute_condition    = optional(string)
    attribute_mapping      = optional(map(string))
    deletion_policy        = optional(string)
    description            = optional(string)
    detailed_audit_logging = optional(bool)
    disabled               = optional(bool)
    display_name           = optional(string)
    scim_usage             = optional(string)
    extended_attributes_oauth2_client = optional(object({
      attributes_type = string
      client_id       = string
      client_secret = object({
        value = optional(object({
          plain_text            = optional(string)
          plain_text_wo         = optional(string)
          plain_text_wo_version = optional(string)
        }))
      })
      issuer_uri = string
      query_parameters = optional(object({
        filter = optional(string)
      }))
    }))
    extra_attributes_oauth2_client = optional(object({
      attributes_type = string
      client_id       = string
      client_secret = object({
        value = optional(object({
          plain_text            = optional(string)
          plain_text_wo         = optional(string)
          plain_text_wo_version = optional(string)
        }))
      })
      issuer_uri = string
      query_parameters = optional(object({
        filter = optional(string)
      }))
    }))
    oidc = optional(object({
      client_id = string
      client_secret = optional(object({
        value = optional(object({
          plain_text            = optional(string)
          plain_text_wo         = optional(string)
          plain_text_wo_version = optional(string)
        }))
      }))
      issuer_uri = string
      jwks_json  = optional(string)
      web_sso_config = optional(object({
        additional_scopes         = optional(list(string))
        assertion_claims_behavior = string
        response_type             = string
      }))
    }))
    saml = optional(object({
      idp_metadata_xml = string
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.iam_workforce_pool_providers : (
        !startswith(v.provider_id, "gcp-")
      )
    ])
    error_message = "[from ValidateWorkforcePoolProviderId: must not start with \"gcp-\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.iam_workforce_pool_providers : (
        v.extended_attributes_oauth2_client == null || (v.extended_attributes_oauth2_client.client_secret.value == null || (v.extended_attributes_oauth2_client.client_secret.value.plain_text == null || (length(v.extended_attributes_oauth2_client.client_secret.value.plain_text) > 0)))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.iam_workforce_pool_providers : (
        v.extra_attributes_oauth2_client == null || (v.extra_attributes_oauth2_client.client_secret.value == null || (v.extra_attributes_oauth2_client.client_secret.value.plain_text == null || (length(v.extra_attributes_oauth2_client.client_secret.value.plain_text) > 0)))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.iam_workforce_pool_providers : (
        v.oidc == null || (v.oidc.client_secret == null || (v.oidc.client_secret.value == null || (v.oidc.client_secret.value.plain_text == null || (length(v.oidc.client_secret.value.plain_text) > 0))))
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

