library(plotly)
library(dplyr)
library(ggplot2)
library(shinythemes)
library(stringr)
library(lintr)
lint("app_server.R")


server <- function(input, output) {
  death_counts <- read.csv("data/Death_Counts_For_COVID-19.csv",
                           stringsAsFactors = FALSE)
  population <- death_counts[death_counts$Indicator == "Weighted distribution of population (%)", ]
  new_dat <- read.csv("data/deaths_with_age_race.csv",
                      stringsAsFactors = FALSE)
  dat <- new_dat[new_dat$State != "United States" &
                   new_dat$Age.group != "All Ages" &
                   new_dat$Race.and.Hispanic.Origin.Group != "Total Deaths", ]
  output$interactive_one <- renderPlotly({
    plot <- plot_ly(
      data = dat,
      x = ~get(input$interactive_x),
      y = ~COVID.19.Deaths,
      color = ~State,
      type = "scatter",
      mode = "markers"
    ) %>%
      layout(
        title = "Covid Deaths Compared to Race or Age.",
        height = "1000",
        xaxis = list(title = "Age or Race"),
        yaxis = list(title = "Covid 19 Deaths")
      )
  })

  output$interactive_three <- renderPlotly({
    plot <- plot_ly(
      data = population,
      x = ~get(input$race_3),
      y = ~State,
      type = "scatter",
      mode = "markers"
    ) %>%
      layout(
        title = "Weight Distribution of Covid-19 deaths",
        height = "1000",
        xaxis = list(title = "Weighted Percent"),
        yaxis = list(title = "Population Location")
      )
  })

  # Bar charts for interactive 2
  death_counts <- read.csv("data/Death_Counts_For_COVID-19.csv",
                           stringsAsFactors = FALSE)
  df1_filteredv3 <- death_counts %>%
    filter(Indicator == "Distribution of COVID-19 deaths (%)" &
             State != "United States")
  df1_filteredv3 <- subset(df1_filteredv3, select = -c(Data.as.of, Start.Week,
                                                       End.Week, Footnote,
                                                       Indicator))
  chart_raw_df <- as.data.frame(t(df1_filteredv3))
  header_true <- function(df) {
    names(df) <- as.character(unlist(df[1, ]))
    df[-1, ]
  }
  new_df <- header_true(chart_raw_df)
  new_df <- tibble::rownames_to_column(new_df, "Racial groups")
  new_df <- new_df[-c(7), ]
  new_df$`Racial groups` <- gsub(".", " ", new_df$`Racial groups`, fixed = TRUE)
  # The lintr error arises here because of not using snake case, but
  # `Racial groups` in the column name in the cleaned data frame.
  new_df$newrg <- str_wrap(new_df$`Racial groups`, width = 3)

  output$bar_chart <- renderPlotly({
    state_bar_chart <- ggplot(new_df) +
      geom_col(mapping = aes(x = newrg,
                             y = new_df[[input$select_state]],
                             color = newrg,
                             fill = newrg,
                             alpha = 0,
                             text = paste0(new_df[[input$select_state]], "%"))
               ) +
      labs(
          title = paste0("COVID-19 Death (%) of racial groups in ",
                       input$select_state),
          x = "Racial groups",
          y = "Percentage",
          color = "Racial groups"
        ) +
      theme(plot.background = element_rect(fill = "bisque2"),
            panel.background = element_rect(fill = "bisque2"),
            legend.background = element_rect(fill = "bisque2"))
    state_bar_chart <- ggplotly(state_bar_chart, tooltip = "text")
    })
}
library(lintr)
lint("app_server.R")

