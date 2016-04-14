- view: factless_child_organization_unit
  sql_table_name: FactlessChildOrganizationUnit
  fields:

  - dimension: child_key
    type: number
    sql: ${TABLE}.ChildKey

  - dimension: end_date_key
    type: number
    sql: ${TABLE}.EndDateKey

  - dimension: oukey
    type: number
    sql: ${TABLE}.OUKey

  - dimension: start_date_key
    type: number
    sql: ${TABLE}.StartDateKey

  - measure: count
    type: count
    drill_fields: []

