variable "database_migration_connections_lookup" {
  description = <<EOT
Map of database_migration_connections_lookup, attributes below
Required:
    - compartment_id
Optional:
    - connection_type
    - display_name
    - source_connection_id
    - state
    - technology_sub_type
    - technology_type
    - filter (block):
        - name (required)
        - regex (optional)
        - values (required)
EOT

  type = map(object({
    compartment_id       = string
    connection_type      = optional(list(string))
    display_name         = optional(string)
    source_connection_id = optional(string)
    state                = optional(string)
    technology_sub_type  = optional(string)
    technology_type      = optional(list(string))
    filter = optional(list(object({
      name   = string
      regex  = optional(bool)
      values = list(string)
    })))
  }))
}

