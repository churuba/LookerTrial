- connection: smartcare_datamart_amazon

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: dim_capture_method
  hidden: true

- explore: dim_child
  hidden: true

- explore: dim_date
  hidden: true
  label: "Date"

- explore: dim_geography
  hidden: true
  label: "Location"

- explore: dim_organization_unit
  hidden: true
  label: "Organization Unit"

- explore: dim_snapshot_date
  hidden: true
  label: "Snapshot Date"

- explore: dim_year_in_school
  hidden: true

- explore: fact_enrollment
  hidden: true

- explore: fact_mrr
  label: "Revenue"
  conditionally_filter:
    date.calendar_month_name: 'April'
    date.calendar_year_number: '2016'
    unless: [date.calendar_month_name]
  joins:
    - join: date
      from: dim_date
      sql_on: ${fact_mrr.date_key} = ${date.date_key}
      relationship: many_to_one
    
    - join: organization_unit
      from: dim_organization_unit
      sql_on: ${fact_mrr.oukey} = ${organization_unit.oukey}
      relationship: many_to_one # many fact_mrr -> one organization
    
    - join: snapshot_date
      from: dim_snapshot_date
      sql_on: ${fact_mrr.snapshot_date_key} = ${snapshot_date.snapshot_date_key}
      relationship: many_to_one # many fact_mrr -> one snapshot date
    
    - join: organization_unit_parent
      from: dim_organization_unit
      sql_on: ${organization_unit.ouparent_key} = ${organization_unit_parent.oukey}
      relationship: many_to_one
    
    - join: location
      from: dim_geography
      sql_on: ${organization_unit.geography_key} = ${location.geography_key}
      ##fields: [export_set*]
      relationship: many_to_one
