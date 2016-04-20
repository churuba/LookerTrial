- view: fact_mrr
  sql_table_name: FactMRR
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

  - dimension_group: full
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.FullDate

  - dimension: merchant_fee_percent
    type: number
    sql: ${TABLE}.MerchantFeePercent

  - dimension: monthly_children_tuition_fee
    type: number
    sql: ${TABLE}.TuitionAmount

  - dimension: monthly_technology_fee
    type: number
    sql: ${TABLE}.MonthlyTechnologyFee

  - dimension: number_of_achpayers
    type: number
    sql: ${TABLE}.NumberOfACHPayers
  
  - dimension: number_of_active_children
    type: number
    sql: ${TABLE}.NumberOfActiveChildren

  - dimension: number_of_children_per_center
    type: number
    sql: ${TABLE}.NumberOfChildrenPerCenter

  - dimension: oukey
    type: number
    sql: ${TABLE}.OUKey

  - dimension: smart_care_merchant_fee_percent
    type: number
    sql: ${TABLE}.SmartCareMerchantFeePercent

  - dimension_group: snapshot
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.SnapshotDate
  
  - dimension_group: current
    type: time
    timeframes: [date, week]
    sql: getdate()
  
  - dimension: is_latest_snapshot
    type: yesno
    sql: ${snapshot_week} = ${current_week}
    
    

##### MEASURES
  - measure: count
    type: count
    drill_fields: detail*

  - measure: technology_fee
    type: avg
    sql: ${monthly_technology_fee}
    value_format_name: usd
    drill_fields: detail*
  
  - measure: total_monthly_child_tuition_fee
    type: sum
    sql: ${monthly_children_tuition_fee}
    value_format_name: usd
    drill_fields: detail*

  - measure: total_number_of_children_per_center
    type: sum
    sql: ${number_of_children_per_center}
    drill_fields: detail*
    
  - measure: number_of_credit_card_payers
    type: sum
    sql: ${TABLE}.NumberOfCreditCardPayers
    drill_fields: detail*

  - measure: total_number_of_active_children
    type: sum
    sql: ${number_of_active_children}
    drill_fields: detail*

  - measure: total_active_children_at_the_end_of_year
    type: sum
    sql: ${number_of_active_children}
    drill_fields: detail*
    filters:
      dim_date.calendar_month_name: 'December'

  - measure: total_active_children_current
    type: sum
    sql: ${number_of_active_children}
    drill_fields: detail*
    filters:
      dim_date.is_latest_month: 'Yes'
  
  sets:
    detail:
    - oukey
    - merchant_fee_percent
    - smart_care_merchant_fee_percent
    - total_monthly_child_tuition_fee
    