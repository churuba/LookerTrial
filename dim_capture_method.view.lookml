- view: dim_capture_method
  sql_table_name: DimCaptureMethod
  fields:

  - dimension: capture_mehod_key
    type: number
    sql: ${TABLE}.CaptureMehodKey

  - dimension: name
    type: string
    sql: ${TABLE}.Name

  - measure: count
    type: count
    drill_fields: [name]

