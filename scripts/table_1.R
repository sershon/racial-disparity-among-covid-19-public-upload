library(dplyr)
library(lintr)
summary_table <- function(df) {
  summary_table_covid <- df %>%
    select(State,
           Indicator,
           Non.Hispanic.White,
           Non.Hispanic.Black.or.African.American,
           Non.Hispanic.American.Indian.or.Alaska.Native,
           Non.Hispanic.Asian,
           Non.Hispanic.Native.Hawaiian.or.Other.Pacific.Islander,
           Hispanic.or.Latino,
           Other) %>%
    filter(Indicator == "Count of COVID-19 deaths") %>%
    group_by(State) %>%
    summarize(
      white = sum(Non.Hispanic.White, na.rm = TRUE),
      black = sum(Non.Hispanic.Black.or.African.American, na.rm = TRUE),
      native = sum(Non.Hispanic.American.Indian.or.Alaska.Native, na.rm = TRUE),
      asian = sum(Non.Hispanic.Asian, na.rm = TRUE),
      native = sum(
        Non.Hispanic.Native.Hawaiian.or.Other.Pacific.Islander, na.rm = TRUE),
      hispanic = sum(Hispanic.or.Latino, na.rm = TRUE))
}
