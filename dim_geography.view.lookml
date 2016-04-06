- view: dim_geography
  sql_table_name: DimGeography
  fields:

  - dimension: geography_key
    type: number
    sql: ${TABLE}.GeographyKey

  - dimension: name
    type: string
    sql: ${TABLE}.Name

  - dimension: offset
    type: number
    sql: ${TABLE}.Offset

  - dimension: state
    type: string
    sql: ${TABLE}.State

  - dimension: time_zone
    type: string
    sql: ${TABLE}.TimeZone

  - dimension: utc
    type: string
    sql: ${TABLE}.UTC

  - measure: count
    type: count
    drill_fields: [name]

