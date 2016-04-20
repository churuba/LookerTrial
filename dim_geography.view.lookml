- view: dim_geography
  sql_table_name: DimGeography
  fields:

  - dimension: geography_key
    hidden: true
    type: number
    sql: ${TABLE}.GeographyKey

  - dimension: offset
    hidden: true
    type: number
    sql: ${TABLE}.Offset

  - dimension: state_code
    type: string
    sql: ${TABLE}.StateCode

  - dimension: state_name
    type: string
    sql: ${TABLE}.StateName

  - dimension: time_zone
    hidden: true
    type: string
    sql: ${TABLE}.TimeZone

  - dimension: utc
    hidden: true
    type: string
    sql: ${TABLE}.UTC

