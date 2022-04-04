connection: "alisha_looker_dash1"

# include all the views
include: "/views/**/*.view"

datagroup: alisha_looker_dash1_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: alisha_looker_dash1_default_datagroup

explore: bm_f_subway_passenger_dd {
  join: bm_d_passenger_type_cd {
    type: left_outer
    sql_on: ${bm_d_passenger_type_cd.cd} = ${bm_f_subway_passenger_dd.passenger_type_gb_cd} ;;
    relationship: many_to_one
  }
}

explore: bm_d_passenger_type_cd {}
