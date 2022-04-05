view: bm_f_subway_passenger_dd {
  sql_table_name: `project_b_team.bm_f_subway_passenger_dd`
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

  dimension: passenger_type_gb_cd {
    type: string
    sql: ${TABLE}.passenger_type_gb_cd ;;
  }

  dimension: station_no_cd {
    type: string
    sql: ${TABLE}.station_no_cd ;;
  }

  dimension: subway_line_no_cd {
    type: string
    label: "호선"
    sql: ${TABLE}.subway_line_no_cd ;;
  }

  measure: sunsusong_cnt {
    type: number
    label: "순수송인원수"
    sql: abs(sum(${TABLE}.sunsusong_cnt)) ;;
  }

  dimension: time_gb_cd {
    type: string
    sql: ${TABLE}.time_gb_cd ;;
  }

  measure: dynamic_filter_value{
    type: max
    sql: 1 ;;
    html: <p style =
              "color: #000000;
              font-size:70%;
              text-align:left">
              기간 : {% if _filters['dt_date']%}
                          {{_filters['dt_date']}}
                          {% else %} 전체 {% endif %}
              &nbsp;&nbsp;&nbsp;
              승객유형 : {% if _filters['bm_d_passenger_type_cd.passenger_type']%}
                          {{_filters['bm_d_passenger_type_cd.passenger_type']}}
                          {% else %} 전체 {% endif %}

      </p>;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
