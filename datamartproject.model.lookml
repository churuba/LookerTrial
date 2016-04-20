- connection: smartcare_datamart_amazon

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards



- explore: dim_date

- explore: dim_organization_unit

- explore: fact_center_sign_in_out
  label: "Attendance"
  joins:
    - join: organization_unit
      from: dim_organization_unit
      sql_on: ${fact_center_sign_in_out.oukey} = ${organization_unit.oukey}
      relationship: many_to_one
    
    - join: dim_child
      sql_on: ${fact_center_sign_in_out.child_key} = ${dim_child.child_key}
      relationship: many_to_one

- explore: fact_mrr
  joins:
    - join: dim_date
      foreign_key: date_key
    
    - join: organization_unit
      from: dim_organization_unit
      sql_on: ${fact_mrr.oukey} = ${organization_unit.oukey}
      relationship: many_to_one # many fact_mrr -> one organization
    
    - join: organization_unit_parent
      from: dim_organization_unit
      sql_on: ${organization_unit.ouparent_key} = ${organization_unit_parent.oukey}
      relationship: many_to_one
    
    - join: location
      from: dim_geography
      sql_on: ${organization_unit.geography_key} = ${location.geography_key}
      fields: [export_set*]
      relationship: many_to_one



