- view: fact_center_sign_in_out
  sql_table_name: FactCenterSignInOut
  fields:

  - dimension: capture_method_key
    type: number
    sql: ${TABLE}.CaptureMethodKey

  - dimension: child_key
    type: number
    sql: ${TABLE}.ChildKey

  - dimension: oukey
    type: number
    sql: ${TABLE}.OUKey

  - dimension: registered_local_date_key
    type: number
    sql: ${TABLE}.RegisteredLocalDateKey

  - dimension_group: check_in
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.RegisteredLocalTime_CheckIn
  
  - dimension: unique_key
    primary_key: true
    hidden: true
    sql: ${TABLE}.RegisteredLocalTime_CheckIn

  - dimension_group: check_out
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.RegisteredLocalTime_CheckOut

  - measure: count
    type: count
    drill_fields: []
  
  - measure: count_of_check_ins
    type: count_distinct
    sql: ${check_in_time}
    sql_distinct_key: ${child_key}
    
  - measure: count_of_check_outs
    type: count_distinct
    sql: ${check_out_time}
    sql_distinct_key: ${child_key}  
  
  - measure: check_in_and_out_discrepancy
    type: number
    sql: ${count_of_check_ins} - ${count_of_check_outs}
    

