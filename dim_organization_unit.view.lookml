- view: dim_organization_unit
  sql_table_name: DimOrganizationUnit
  fields:

  - dimension: _audit_key
    type: number
    sql: ${TABLE}._AuditKey

  - dimension_group: billing_live
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.BillingLiveDate
  
  - dimension: has_been_cancelled
    type: yesno
    sql: ${cancel_date} IS NOT NULL

  - dimension_group: cancel
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.CancelDate

  - dimension: cancel_reason_key
    type: number
    sql: ${TABLE}.CancelReasonKey

  - dimension: capacity
    type: number
    sql: ${TABLE}.Capacity

  - dimension_group: date_created
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.DateCreated

  - dimension: discriminator
    type: string
    sql: ${TABLE}.Discriminator

  - dimension: enrollment_status
    type: number
    sql: ${TABLE}.EnrollmentStatus

  - dimension: geography_key
    type: number
    sql: ${TABLE}.GeographyKey

  - dimension_group: go_live
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.GoLiveDate

  - dimension_group: implementation
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.ImplementationDate

  - dimension: name
    type: string
    sql: ${TABLE}.Name
    html: | 
      {{ linked_value }}
      <a href="{{ value }}" target="_new"> 
      <img src="/images/qr-graph-line@2x.png" height=20 width=20></a>
  - dimension: oukey
    type: number
    sql: ${TABLE}.OUKey
    primary_key: true

  - dimension: ouparent_key
    type: number
    sql: ${TABLE}.OUParentKey

  - measure: count
    type: count
    drill_fields: detail*
  
  - measure: total_capacity
    type: sum
    sql: ${capacity}
  
  - measure: avearge_capacity
    type: average
    sql: ${capacity}
    value_format_name: decimal_2
  
  sets:
    detail:
    - oukey
    - name
    - capacity
    - enrollment_status