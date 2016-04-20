- view: fact_enrollment
  sql_table_name: FactEnrollment
  fields:

  - dimension: _audit_key
    type: number
    sql: ${TABLE}._AuditKey

  - dimension: date_key
    type: number
    sql: ${TABLE}.DateKey

  - dimension: fact_id
    type: number
    sql: ${TABLE}.FactID

  - dimension: number_of_children
    type: number
    sql: ${TABLE}.NumberOfChildren

  - dimension: number_of_enrolled_children
    type: number
    sql: ${TABLE}.NumberOfEnrolledChildren

  - dimension: oukey
    type: number
    sql: ${TABLE}.OUKey

  - measure: count
    type: count
    drill_fields: []

