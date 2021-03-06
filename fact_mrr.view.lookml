- view: fact_mrr
  sql_table_name: FactMRR
  label: "Monthly Recurring Revenue"
  fields:

  - dimension: _audit_key
    hidden: true
    type: number
    sql: ${TABLE}._AuditKey

  - dimension: date_key
    hidden: true
    type: number
    sql: ${TABLE}.DateKey

  - dimension: fact_id
    hidden: true
    type: number
    sql: ${TABLE}.FactID

  - dimension: oukey
    hidden: true
    type: number
    sql: ${TABLE}.OUKey

  - dimension: snapshot_date_key
    hidden: true
    type: number
    sql: ${TABLE}.SnapshotDateKey
  
  - dimension: monthly_children_tuition_fee
    hidden: true
    type: number
    sql: ${TABLE}.TuitionAmount

  - dimension: monthly_technology_fee
    hidden: true
    type: number
    sql: ${TABLE}.MonthlyTechnologyFee

  - dimension: number_of_achpayers
    hidden: true
    type: number
    sql: ${TABLE}.NumberOfACHPayers
  
  - dimension: number_of_active_children
    hidden: true
    type: number
    sql: ${TABLE}.NumberOfActiveChildren

  - dimension: number_of_children
    hidden: true
    type: number
    sql: ${TABLE}.NumberOfChildren
    
  - dimension: number_of_enrolled_children
    hidden: true
    type: number
    sql: ${TABLE}.NumberOfEnrolledChildren
  
  - dimension: number_of_children_paid_with_cc
    hidden: true
    type: number
    sql: ${TABLE}.NumberOfChildrenPaidWithCC  
  
  - dimension: number_of_children_paid_with_ach
    hidden: true
    type: number
    sql: ${TABLE}.NumberOfChildrenPaidWithACH  

  - dimension: smart_care_merchant_fee_percent
    hidden: true
    type: number
    sql: ${TABLE}.SmartCareMerchantFeePercent
  
  - dimension: pot_tech_fee
    hidden: true
    type: number
    sql: ${TABLE}.NumberOfEnrolledChildren * ${TABLE}.MonthlyTechnologyFee
  
  - dimension: rlz_tech_fee
    hidden: true
    type: number
    sql: ${TABLE}.NumberOfActiveChildren * ${TABLE}.MonthlyTechnologyFee

  - dimension: tuition_fee_to_merchant
    type: number
    hidden: true
    sql: ${TABLE}.MerchantFeePercent * ${TABLE}.TuitionAmount
  
  - dimension: smc_tuition_fee_to_merchant
    type: number
    hidden: true
    sql: (${TABLE}.MerchantFeePercent - ${TABLE}.SmartCareMerchantFeePercent) * ${TABLE}.TuitionAmount


##### MEASURES

  - measure: total_number_of_children
    label: "Number Of Children"
    type: sum
    sql: ${number_of_children}
    drill_fields: detail*
    
  - measure: total_number_of_enrolled_children
    label: "Number Of Enrolled Children"
    type: sum
    sql: ${number_of_enrolled_children}
    drill_fields: detail*
  
  - measure: total_number_of_active_children
    label: "Number Of Active Children"
    type: sum
    sql: ${number_of_active_children}
    drill_fields: detail*
  
  - measure: total_number_of_children_paid_with_cc
    label: "Number Of Children Paid With CC"
    type: sum
    sql: ${number_of_children_paid_with_cc}
    drill_fields: detail*
  
  - measure: total_number_of_children_paid_with_ach
    label: "Number Of Children Paid With ACH"
    type: sum
    sql: ${number_of_children_paid_with_ach}
    drill_fields: detail*
    
  - measure: number_of_credit_card_payers
    label: "Number Of CreditCard Payers"
    type: sum
    sql: ${TABLE}.NumberOfCreditCardPayers
    drill_fields: detail*
    
  - measure: number_of_ach_payers
    label: "Number Of ACH Payers"
    type: sum
    sql: ${TABLE}.NumberOfACHPayers
    drill_fields: detail*

  - measure: cc_rate
    label: "CrediCard Rate"
    type: number
    sql: 100.00 * ${total_number_of_children_paid_with_cc} / NULLIF(${total_number_of_enrolled_children},0) 
    value_format: '0.00\%' # Percent with 2 decimals (1.00%)
  
  - measure: ach_rate
    label: "ACH Rate"
    type: number
    sql: 100.00 * ${total_number_of_children_paid_with_ach} / NULLIF(${total_number_of_enrolled_children},0) 
    value_format: '0.00\%' # Percent with 2 decimals (1.00%)
  
  - measure: total_monthly_child_tuition_fee
    label: "Monthly Children Tuition Fee"
    type: sum
    sql: ${monthly_children_tuition_fee}
    value_format_name: usd
    drill_fields: detail*
  
  - measure: potential_technology_fee
    label: "Potential Technology Fee"
    type: sum
    sql: ${pot_tech_fee}
    value_format_name: usd
  
  - measure: realized_technology_fee
    label: "Realized Technology Fee"
    type: sum
    sql: ${rlz_tech_fee}
    value_format_name: usd
  
  - measure: tuition_fee_times_merchant_fee
    hidden: true
    type: sum
    sql: ${tuition_fee_to_merchant}
  
  - measure: expected_cc_revenue
    label: "Expected CreditCard Revenue"
    type: number
    sql: ${tuition_fee_times_merchant_fee} * ${cc_rate} / 100.00
    value_format: '0.00'

  - measure: smc_tuition_fee_times_merchant_fee
    hidden: true
    type: sum
    sql: ${smc_tuition_fee_to_merchant}
    
  - measure: smc_expected_cc_revenue
    label: "SmartCare Expected CreditCard Revenue"
    type: number
    sql: ${smc_tuition_fee_times_merchant_fee} * ${cc_rate} / 100.00
    value_format: '0.00'
  
  - measure: gross_mrr
    label: "Gross MRR"
    type: number
    sql: ${potential_technology_fee} + ${tuition_fee_times_merchant_fee}
    value_format_name: usd
  
  - measure: net_mrr
    label: "Net MRR"
    type: number
    sql: ${potential_technology_fee} + ${smc_tuition_fee_times_merchant_fee}
    value_format_name: usd

#   - measure: total_active_children_at_the_end_of_year
#     type: sum
#     sql: ${number_of_active_children}
#     drill_fields: detail*
#     filters:
#       dim_date.calendar_month_name: 'December'
# 
#   - measure: total_active_children_current
#     type: sum
#     sql: ${number_of_active_children}
#     drill_fields: detail*
#     filters:
#       dim_date.is_latest_month: 'Yes'
#   - measure: technology_fee
#     label: "Available Technology Fee"
#     type: sum
#     sql: ${monthly_technology_fee}
#     value_format_name: usd
#     drill_fields: detail*
#   

    
#   - measure: merchant_fee_percent
#     hidden: true
#     type: number
#     sql: ${TABLE}.MerchantFeePercent
#     
#   - measure: smart_care_merchant_fee_percent
#     hidden: true
#     type: number
#     sql: ${TABLE}.SmartCareMerchantFeePercent
  
#   - measure: total_number_of_children_per_center
#     type: sum
#     sql: ${number_of_children}
#     drill_fields: detail*
  
  sets:
    detail:
    - total_number_of_active_children
    - technology_fee
    - merchant_fee_percent
    - smart_care_merchant_fee_percent
    - total_monthly_child_tuition_fee  
    
