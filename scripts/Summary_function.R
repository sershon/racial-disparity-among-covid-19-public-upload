# Summary functions
library(dplyr)
library(lintr)

get_most_deaths_states_list <- function(df) {
  df <- subset(df, select = -c(Data.as.of, Start.Week, End.Week, Footnote))
  df <- subset(df, Indicator == "Count of COVID-19 deaths")
  most_deaths_states_list <- list()

  most_whitedeath_state <- df %>%
    top_n(2, Non.Hispanic.White) %>%
    filter(Non.Hispanic.White == min(Non.Hispanic.White, na.rm = T)) %>%
    pull(State)

  most_blackdeath_state <- df %>%
    top_n(2, Non.Hispanic.Black.or.African.American) %>%
    filter(Non.Hispanic.Black.or.African.American ==
             min(Non.Hispanic.Black.or.African.American, na.rm = T)) %>%
    pull(State)

  most_indiandeath_state <- df %>%
    top_n(2, Non.Hispanic.American.Indian.or.Alaska.Native) %>%
    filter(Non.Hispanic.American.Indian.or.Alaska.Native ==
             min(Non.Hispanic.American.Indian.or.Alaska.Native, na.rm = T)) %>%
    pull(State)

  most_asiandeath_state <- df %>%
    top_n(2, Non.Hispanic.Asian) %>%
    filter(Non.Hispanic.Asian == min(Non.Hispanic.Asian, na.rm = T)) %>%
    pull(State)

  most_pideath_state <- df %>%
    top_n(2, Non.Hispanic.Native.Hawaiian.or.Other.Pacific.Islander) %>%
    filter(Non.Hispanic.Native.Hawaiian.or.Other.Pacific.Islander ==
             min(Non.Hispanic.Native.Hawaiian.or.Other.Pacific.Islander,
                 na.rm = T)) %>%
    pull(State)

  most_latinodeath_state <- df %>%
    top_n(2, Hispanic.or.Latino) %>%
    filter(Hispanic.or.Latino == min(Hispanic.or.Latino, na.rm = T)) %>%
    pull(State)

  most_otherdeath_state <- df %>%
    top_n(2, Other) %>%
    filter(Other == min(Other, na.rm = T)) %>%
    pull(State)

  most_deaths_states_list$nh_white <- most_whitedeath_state
  most_deaths_states_list$nh_black_african_american <-
    most_blackdeath_state
  most_deaths_states_list$nh_us_indian_alaska_native <-
    most_indiandeath_state
  most_deaths_states_list$nh_asian <- most_asiandeath_state
  most_deaths_states_list$nh_hawaiian_pacific_islander <-
    most_pideath_state
  most_deaths_states_list$hispanic_or_latino <- most_latinodeath_state
  most_deaths_states_list$other <- most_otherdeath_state

  return(most_deaths_states_list)
}


get_states_list <- function(df, indicator_name) {
  df <- subset(df, select = -c(Data.as.of, Start.Week, End.Week, Footnote))
  most_indicator_by_state <- list()
  df <- subset(df, Indicator == indicator_name)

  most_whitewdp_state <- df %>%
    filter(Non.Hispanic.White == max(Non.Hispanic.White, na.rm = T)) %>%
    pull(State)

  most_blackwdp_state <- df %>%
    filter(Non.Hispanic.Black.or.African.American ==
             max(Non.Hispanic.Black.or.African.American, na.rm = T)) %>%
    pull(State)

  most_indianwdp_state <- df %>%
    filter(Non.Hispanic.American.Indian.or.Alaska.Native ==
             max(Non.Hispanic.American.Indian.or.Alaska.Native, na.rm = T)) %>%
    pull(State)

  most_asianwdp_state <- df %>%
    filter(Non.Hispanic.Asian == max(Non.Hispanic.Asian, na.rm = T)) %>%
    pull(State)

  most_piwdp_state <- df %>%
    filter(Non.Hispanic.Native.Hawaiian.or.Other.Pacific.Islander ==
             max(Non.Hispanic.Native.Hawaiian.or.Other.Pacific.Islander,
                 na.rm = T)) %>%
    pull(State)

  most_latinowdp_state <- df %>%
    filter(Hispanic.or.Latino == max(Hispanic.or.Latino, na.rm = T)) %>%
    pull(State)

  most_otherwdp_state <- df %>%
    filter(Other == max(Other, na.rm = T)) %>%
    pull(State)

  most_indicator_by_state$nh_white <- most_whitewdp_state
  most_indicator_by_state$nh_black_african_american <-
    most_blackwdp_state
  most_indicator_by_state$nh_us_indian_alaska_native <-
    most_indianwdp_state
  most_indicator_by_state$nh_asian <- most_asianwdp_state
  most_indicator_by_state$
    nh_hawaiian_pacific_islander <- most_piwdp_state
  most_indicator_by_state$hispanic_or_latino <- most_latinowdp_state
  most_indicator_by_state$other <- most_otherwdp_state

  return(most_indicator_by_state)
}
