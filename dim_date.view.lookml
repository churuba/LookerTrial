- view: dim_date
  sql_table_name: DimDate
  fields:

  - dimension: calendar_month_name
    label: "Month Name"
    order_by_field: calendar_month_number
    type: string
    sql: ${TABLE}.CalendarMonthName

  - dimension: calendar_month_number
    label: "Month Number"
    type: number
    sql: ${TABLE}.CalendarMonthNumber

  - dimension: calendar_quarter_name
    label: "Quarter Name"
    type: string
    sql: ${TABLE}.CalendarQuarterName

  - dimension: calendar_quarter_number
    label: "Quarter Number"
    type: number
    sql: ${TABLE}.CalendarQuarterNumber

  - dimension: calendar_year_number
    label: "Year"
    type: number
    sql: ${TABLE}.CalendarYearNumber

  - dimension: date_key
    primary_key: true
    hidden: true
    type: number
    sql: ${TABLE}.DateKey

  - dimension: day
    hidden: true
    type: number
    sql: ${TABLE}.Day

  - dimension: day_of_week
    hidden: true
    type: string
    sql: ${TABLE}.DayOfWeek

  - dimension: day_of_week_in_month
    hidden: true
    type: number
    sql: ${TABLE}.DayOfWeekInMonth

  - dimension: day_of_week_number
    hidden: true
    type: number
    sql: ${TABLE}.DayOfWeekNumber

  - dimension: day_of_year_number
    hidden: true
    type: number
    sql: ${TABLE}.DayOfYearNumber

  - dimension: day_suffix
    hidden: true
    type: string
    sql: ${TABLE}.DaySuffix

  - dimension: first_day_of_calendar_month_flag
    hidden: true
    type: string
    sql: ${TABLE}.FirstDayOfCalendarMonthFlag

  - dimension_group: full
    hidden: true
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.FullDate

  - dimension: holiday_flag
    hidden: true
    type: string
    sql: ${TABLE}.HolidayFlag

  - dimension: holiday_text
    hidden: true
    type: string
    sql: ${TABLE}.HolidayText

  - dimension: last_day_of_calendar_month_flag
    hidden: true
    type: string
    sql: ${TABLE}.LastDayOfCalendarMonthFlag

  - dimension_group: last_day_of_month
    hidden: true
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.LastDayOfMonth

  - dimension: month_key
    hidden: true
    type: number
    sql: ${TABLE}.MonthKey

  - dimension: open_flag
    hidden: true
    type: string
    sql: ${TABLE}.OpenFlag

  - dimension: standard_date
    label: "Date"
    type: string
    sql: ${TABLE}.StandardDate

  - dimension: week_day_flag
    hidden: true
    type: string
    sql: ${TABLE}.WeekDayFlag

  - dimension: week_of_month_number
    hidden: true
    type: number
    sql: ${TABLE}.WeekOfMonthNumber

  - dimension: week_of_year_number
    hidden: true
    type: number
    sql: ${TABLE}.WeekOfYearNumber


