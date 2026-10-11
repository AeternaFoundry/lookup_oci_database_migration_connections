data "oci_database_migration_connections" "database_migration_connections_lookup" {
  for_each = var.database_migration_connections_lookup

  compartment_id       = each.value.compartment_id
  connection_type      = each.value.connection_type
  display_name         = each.value.display_name
  source_connection_id = each.value.source_connection_id
  state                = each.value.state
  technology_sub_type  = each.value.technology_sub_type
  technology_type      = each.value.technology_type

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

