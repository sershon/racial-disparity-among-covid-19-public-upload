library("ggplot2")
library(lintr)
make_plot_one <- function(data2, col) {
  data_edited <- data2[data2$Indicator == col, ]
  edit <- data2$State
  for (c in edit) {
    edit[c] <- substr(c, 1, 1)
  }
  plot <- ggplot(data_edited, aes(x = State)) +
    geom_point(aes(y = Non.Hispanic.White), color = "green") +
    geom_point(aes(y = Non.Hispanic.Black.or.African.American),
               color = "blue") +
    geom_point(aes(y = Non.Hispanic.American.Indian.or.Alaska.Native),
               color = "red") +
    geom_point(aes(y = Non.Hispanic.Asian), color = "purple") +
    geom_point(aes(y = Non.Hispanic.Native.Hawaiian.or.Other.Pacific.Islander),
               color = "yellow") +
    geom_point(aes(y = Hispanic.or.Latino), color = "cyan") +
    geom_point(aes(y = Other), color = "pink") +
    ggtitle(col) +
    xlab("State") +
    ylab("Percentage") +
    scale_x_discrete(labels = edit)
  return(plot)
}
