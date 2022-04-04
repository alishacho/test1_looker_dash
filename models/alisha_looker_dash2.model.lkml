connection: "alisha_looker_dash1"

# include all the views
include: "/views/**/*.view"

datagroup: alisha_looker_dash1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: alisha_looker_dash1_default_datagroup

explore: bm_f_subway_card_dd {
  join: bm_d_calender_dt {
    type: left_outer
    sql_on: ${bm_f_subway_card_dd.dt_date} = ${bm_d_calender_dt.dt_date} ;;
    relationship: many_to_one
  }
}

explore: bm_d_passenger_type_cd {}
