- view: dim_year_in_school
  sql_table_name: DimYearInSchool
  fields:

  - dimension: name
    type: string
    sql: ${TABLE}.Name

  - dimension: year_in_school_key
    type: number
    sql: ${TABLE}.YearInSchoolKey

  - measure: count
    type: count
    drill_fields: [name]

