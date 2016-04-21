- view: dim_date
  sql_table_name: DimDate
  fields:

  - dimension: current
    type: time
    timeframes: [date, month, month_num, year] # month: 2016-07, month_num: 1, 2, 3, etc.
    sql: getdate()
  
  - dimension: is_latest_month
    type: yesno
    sql: ${calendar_month_number} = (${current_month_num}-1)

  - dimension: calendar_month_name
    label: "Month Name"
    order_by_field: date_key
    type: string
    sql: ${TABLE}.CalendarMonthName
    order_by_field: calendar_month_number

  - dimension: calendar_month_number
    type: number
    sql: ${TABLE}.CalendarMonthNumber

  - dimension: calendar_quarter_name
    type: string
    sql: ${TABLE}.CalendarQuarterName

  - dimension: calendar_quarter_number
    type: number
    sql: ${TABLE}.CalendarQuarterNumber

  - dimension: calendar_year_number
    type: number
    sql: ${TABLE}.CalendarYearNumber

  - dimension: date_key
    type: number
    sql: ${TABLE}.DateKey
    primary_key: true

  - dimension: day
    type: number
    sql: ${TABLE}.Day

  - dimension: day_of_week
    type: string
    sql: ${TABLE}.DayOfWeek

  - dimension: day_of_week_in_month
    type: number
    sql: ${TABLE}.DayOfWeekInMonth

  - dimension: day_of_week_number
    type: number
    sql: ${TABLE}.DayOfWeekNumber

  - dimension: day_of_year_number
    type: number
    sql: ${TABLE}.DayOfYearNumber

  - dimension: day_suffix
    type: string
    sql: ${TABLE}.DaySuffix

  - dimension: first_day_of_calendar_month_flag
    type: string
    sql: ${TABLE}.FirstDayOfCalendarMonthFlag

  - dimension_group: full
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.FullDate

  - dimension: holiday_flag
    type: string
    sql: ${TABLE}.HolidayFlag

  - dimension: holiday_text
    type: string
    sql: ${TABLE}.HolidayText

  - dimension: last_day_of_calendar_month_flag
    type: string
    sql: ${TABLE}.LastDayOfCalendarMonthFlag

  - dimension: month_key
    type: number
    sql: ${TABLE}.MonthKey

  - dimension: open_flag
    type: string
    sql: ${TABLE}.OpenFlag

  - dimension: standard_date
    type: string
    sql: ${TABLE}.StandardDate

  - dimension: week_day_flag
    type: string
    sql: ${TABLE}.WeekDayFlag

  - dimension: week_of_month_number
    type: number
    sql: ${TABLE}.WeekOfMonthNumber

  - dimension: week_of_year_number
    type: number
    sql: ${TABLE}.WeekOfYearNumber

  - measure: count
    type: count
    drill_fields: [calendar_month_name, calendar_quarter_name]
