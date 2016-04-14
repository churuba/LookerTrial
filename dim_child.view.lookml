- view: dim_child
  sql_table_name: DimChild
  fields:

  - dimension: _audit_key
    type: number
    sql: ${TABLE}._AuditKey

  - dimension_group: birth
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.BirthDate

  - dimension: child_key
    primary_key: true
    type: number
    sql: ${TABLE}.ChildKey

  - dimension: first_name
    type: string
    sql: ${TABLE}.FirstName

  - dimension: last_name
    type: string
    sql: ${TABLE}.LastName

  - dimension: middle_name
    type: string
    sql: ${TABLE}.MiddleName

  - dimension: preferred_name
    type: string
    sql: ${TABLE}.PreferredName

  - dimension: year_in_school
    type: string
    sql: ${TABLE}.YearInSchool

  - measure: count
    type: count
    drill_fields: [first_name, middle_name, last_name, preferred_name]

