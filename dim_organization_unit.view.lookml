##organization unit
- view: dim_organization_unit
  sql_table_name: DimOrganizationUnit
  fields:

  - dimension: _audit_key
    hidden: true
    type: number
    sql: ${TABLE}._AuditKey

  - dimension_group: billing_live
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.BillingLiveDate

  - dimension_group: cancel
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.CancelDate

  - dimension: cancel_reason_key
    hidden: true
    type: number
    sql: ${TABLE}.CancelReasonKey

  - dimension: capacity
    hidden: true
    type: number
    sql: ${TABLE}.Capacity

  - dimension_group: date_created
    label: "Creation"
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.DateCreated

  - dimension: discriminator
    hidden: true
    type: string
    sql: ${TABLE}.Discriminator

  - dimension: enrollment_status
    hidden: true
    type: number
    sql: ${TABLE}.EnrollmentStatus

  - dimension: geography_key
    hidden: true
    type: number
    sql: ${TABLE}.GeographyKey

  - dimension_group: go_live
    hidden: true
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.GoLiveDate

  - dimension_group: implementation
    hidden: true
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.ImplementationDate

  - dimension: is_active
    label: "Is Active" 
    type: yesno
    sql: ${TABLE}.IsActive = 1

  - dimension: name
    label: "Organization Name"
    type: string
    sql: ${TABLE}.Name

  - dimension: oukey
    primary_key: true
    hidden: true
    type: number
    sql: ${TABLE}.OUKey

  - dimension: ouparent_key
    hidden: true
    type: number
    sql: ${TABLE}.OUParentKey

  - measure: count
    label: "Number of OUs"
    type: count
    drill_fields: [name]


