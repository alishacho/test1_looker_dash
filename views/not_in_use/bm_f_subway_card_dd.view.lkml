view: bm_f_subway_card_dd {
  sql_table_name: `project_b_team.bm_f_subway_card_dd`
    ;;

  dimension_group: dt {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt ;;
  }

  measure: get_cnt {
    type: sum
    label: "총승차인원수"
    sql: ${TABLE}.get_cnt ;;
  }

  measure: get_off_cnt {
    type: sum
    label: "총하차인원수"
    sql: ${TABLE}.get_off_cnt ;;
  }

  measure: moving_passenger_cnt {
    type: sum
    label: "유동인원수"
    sql: ${TABLE}.moving_passenger_cnt ;;
  }

  dimension: station_nm {
    type: string
    sql: ${TABLE}.station_nm ;;
  }

  dimension: subway_line_nm {
    type: string
    sql: ${TABLE}.subway_line_nm ;;
  }

  measure: sunsusong_cnt {
    type: sum
    label: "순수송인원수"
    sql: ${TABLE}.sunsusong_cnt ;;
  }


  measure: count {
    type: count
    drill_fields: []
  }
}
