library(lintr)
make_plot_3 <- function(df) {
# Import data set.
  data <- df

# Load Libraries.
library(dplyr)
library(ggplot2)

### Sorting some variables to make the plot code cleaner.

# Removing all rows but the most deaths.
data_edited <- data[data$Indicator == "Count of COVID-19 deaths", ]

#Creating a new column with total deaths.
total_deaths <- data_edited %>%
  select(6:12)

# Some spaghetti code to remove NA values in every row.
total_deaths <- mutate(total_deaths, total = rowSums(
  total_deaths, na.rm = TRUE)
  * NA ^ (rowSums(!is.na(total_deaths)) == 0))

# Adding the new column to the data set
data_edited$total <- total_deaths$total

# Removing the United States row from the Dataset (To be able to
# find the state that has the most deaths)
data_edited <- data_edited[-c(1), , ]

#Finding the state with the highest deaths.
most_deaths_state <- data_edited %>%
  filter(total == max(total))

# Creating a variable with the total number of PoC Deaths.
poc_deaths <- sum(most_deaths_state[, c(7:12)], na.rm = TRUE)

# Creating a variable for the amount of caucasian deaths.
caucasian_deaths <- most_deaths_state[, 6]

# Making a new dataframe for the chart.
deaths <- c(poc_deaths, caucasian_deaths)
races <- c("People of Color", "Caucasian")
racial_disparity_deaths <- data.frame(races, deaths)

# Creating a plot
chart <- ggplot(racial_disparity_deaths) +
  geom_col(mapping = aes(x = races, y = deaths)) +
  labs(x = "Race", y = "Deaths")

  return(chart)
}
