- view: dim_snapshot_date
  sql_table_name: DimSnapshotDate
  fields:

  - dimension: is_last_snapshot
    type: yesno
    sql: ${TABLE}.IsLastSnapshot = 1

  - dimension_group: snapshot
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.SnapshotDate

  - dimension: snapshot_date_key
    hidden: true
    type: number
    sql: ${TABLE}.SnapshotDateKey



