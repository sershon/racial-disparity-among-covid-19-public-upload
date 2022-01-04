library(dplyr)
library(lintr)
library(ggplot2)
plot2_neg <- function(df) {
  df1 <- df
  df1_filteredv3 <- df1 %>%
    filter(State == "United States" & Indicator != "Count of COVID-19 deaths" &
             Indicator != "Unweighted distribution of population (%)")
  df1_filteredv3 <- subset(df1_filteredv3, select = -c(Data.as.of, Start.Week,
                                                       End.Week, Footnote,
                                                       Indicator, State))
  df_for_convert <- df1_filteredv3[1, ] - df1_filteredv3[2, ]
  chart_raw_df <- as.data.frame(t(df_for_convert))
  colnames(chart_raw_df) <- c("Disproportionate_impact")
  chart1_df <- subset(chart_raw_df, chart_raw_df[, 1] > 0)
  chart2_df <- subset(chart_raw_df, chart_raw_df[, 1] < 0)
  chart2_df <- abs(chart2_df)

  #added code by rae
  chart1_df <- cbind(Races = rownames(chart1_df), chart1_df)
  rownames(chart1_df) <- 1:nrow(chart1_df)
  chart2_df <- cbind(Races = rownames(chart2_df), chart2_df)
  rownames(chart2_df) <- 1:nrow(chart2_df)

  #Pie Chart of neg disproportion COVID impact % by race
  pc_neg <- ggplot(data = chart1_df,
                   aes(x = "", y = Disproportionate_impact, fill = Races)) +
    geom_bar(stat = "identity", width = 1) +
    coord_polar("y", start = 0)
  return(pc_neg)

  #Pie Chart of pos disproportion COVID impact % by race
  pc_pos <- ggplot(data = chart2_df,
                   aes(x = "", y = Disproportionate_impact, fill = Races)) +
    geom_bar(stat = "identity", width = 1) +
    coord_polar("y", start = 0)
  return(pc_neg)
}

plot2_pos <- function(df) {
  df1 <- df
  df1_filteredv3 <- df1 %>%
    filter(State == "United States" & Indicator != "Count of COVID-19 deaths" &
             Indicator != "Unweighted distribution of population (%)")
  df1_filteredv3 <- subset(df1_filteredv3, select = -c(Data.as.of, Start.Week,
                                                       End.Week, Footnote,
                                                       Indicator, State))
  df_for_convert <- df1_filteredv3[1, ] - df1_filteredv3[2, ]
  chart_raw_df <- as.data.frame(t(df_for_convert))
  colnames(chart_raw_df) <- c("Disproportionate_impact")
  chart1_df <- subset(chart_raw_df, chart_raw_df[, 1] > 0)
  chart2_df <- subset(chart_raw_df, chart_raw_df[, 1] < 0)
  chart2_df <- abs(chart2_df)

  #added code by rae
  chart1_df <- cbind(Races = rownames(chart1_df), chart1_df)
  rownames(chart1_df) <- 1:nrow(chart1_df)
  chart2_df <- cbind(Races = rownames(chart2_df), chart2_df)
  rownames(chart2_df) <- 1:nrow(chart2_df)

  #Pie Chart of pos disproportion COVID impact % by race
  pc_pos <- ggplot(data = chart2_df,
                   aes(x = "", y = Disproportionate_impact, fill = Races)) +
    geom_bar(stat = "identity", width = 1) +
    coord_polar("y", start = 0)
  return(pc_pos)
}
