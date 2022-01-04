library(plotly)
library(dplyr)
library(ggplot2)
library(shinythemes)
library(shiny)
library(lintr)
lint("app_ui.R")

death_counts <- read.csv("data/Death_Counts_For_COVID-19.csv",
                         stringsAsFactors = FALSE)
state_list <- death_counts %>%
  filter(Indicator == "Distribution of COVID-19 deaths (%)") %>%
  filter(State != "United States") %>%
  pull(State)

overview <- tabPanel(
  "Overview",
  fluidPage(
    p1_header <- img(
      src = "201headercolorful.jpg",
      height = 300,
      width = 600,
      allign = "center"),
    HTML("<p>As the year's end approaches, so does the time for reflection
  about what has transpired throughout the Earth's last orbit. As the entire
  world is aware, COVID-19 has waged its war on our routines, our families, and
  our lives. Presently, COVID-19 takes roughly <strong> 3,000</strong>,
  lives every single day.<p>"),
    HTML("<p>  As far as the U.S is concerned, there was another historic
  chain of events: The Black Lives Matter movement's historic support in the
  wake of the horrific case of police brutality that took George Floyd's life.
  This event has caused many to examine racial disparities in all aspects of
  life. That is why we decided to investigate the potential racial disparity
  evident in data about COVID-19 deaths. We feel it is important to examine
  which groups are being hit the hardest, so that future research may allow
  correlations to be drawn, and solutions to be found. </p>"),
    HTML("<p>  We set out with this project with a main question in mind:
  Are People of Color affected worse by the pandemic than Caucasian people.
  This question, being as broad as it is, led to two additional questions that
  make up the basis of our investigation: Which racial group was hit the hardest
  (most deaths)? In what state is it the worst for People of Color? As you
  investigate this  data for yourself among the following pages, consider the
  questions that we wonder about but can't have concrete answers to: WHY Is
  there a correlation between higher deaths and a particular racial group in
  any given state? What systems need to improve to 'level the playing field'
  as far as health care is concerned? And most pressingly, how are we going
  to protect lives throughout the remainder of this pandemic? With all that
  said, please enjoy our presentation, and consider how you can be a part of
  the solution.  </p>")
  ),
  HTML("<p> Sources:
  CDC. https://data.cdc.gov/NCHS/Provisional-Death-Counts-for-Coronavirus-
  Disease-C/pj7m-y5uh
  Provisional Death Counts for Coronavirus Disease (COVID-19): Distribution of
  Deaths by Race and Hispanic Origin, 2020.

  CDC. Deaths Involving Coronavirus Disease 2019 (COVID-19) by Race and
  Hispanic Origin Group and Age, by State.
  2020, data.cdc.gov/NCHS/Deaths-involving-coronavirus-disease-2019-COVID-19/
       ks3g-spdg. </p>")
)

interactive_one <- tabPanel(
  "Interactive Page One",
  sidebarLayout(
    mainPanel(
      tags$h1("Graph Description"),
      tags$p("This graph has two modes either comparing age to Covid Deaths or
      Race to Covid Deaths.
             In both cases you can see clear disparities when looking at
             proportions and compared state to state."),
      tags$h2("Insights"),
      tags$p("With comparing Age to Covid Deaths you can see the number of
            deaths increase exponentially as Age goes up. This is expected as
            this disease can be very deadly with underlying diseases or other
            health conditions. In checking the proportions of Deaths for South
            Dakota compared to California, there is close to double the amount
            of deaths with South Dakota being .000937 and California .000570.
            This is likely because South Dakota was rated as the state with the
            least COVID-19 restrictions. This can be seen by double clicking
            both states."),
      plotlyOutput(
        outputId = "interactive_one"
      )
    ),
    sidebarPanel(
      h2("Edit Graph"),
      selectInput(
        inputId = "interactive_x",
        label = "X_var",
        choices = c("Race.and.Hispanic.Origin.Group", "Age.group"),
        selected = 1
      )
    )
  )
)

interactive_two <- tabPanel(
  "Interactive Page Two",
  sidebarLayout(
    mainPanel(
      tags$h1("Graph Description"),
      tags$p("From changing the", strong(strong("state")), "on the left, users
          can interact with the bar plot to see the death distribution of each
          racial groups per state in the US. Through the bar plot, users would
          easily compare COVID death counts between every race in every
          state. Also, from different bart plots by different states, users
          could conclude the most the least impected race group by
          COVID-19."),
      plotlyOutput("bar_chart"),
      tags$h2("Insights"),
      tags$p("We found that the", strong(strong("Non Hispanic Native Hawaiian
         or Other Pacific Islander")), "are the least impacted among the racial
        groups, whereas", strong(strong("Non Hispanic White")), "are being
        impected the most by COVID-19. However, due to different cultures
        and social habits of each racial group, it is not rational to
        take small amount of variables to compare the data and have a
        solid conclusion, we might want to consider other contributions
        such as", em("the mean age of each racial group,"), em("the method
        of gethering data,"), em("different attitudes towards COVID-19
        of each racial group,"), em("etc."), "to have a more comprehensive
        summary.")
    ),
    sidebarPanel(
      h2("Select the State"),
      selectInput(
        inputId = "select_state",
        label = "Choose a state",
        choices = state_list
      )
    )
  )
)

interactive_three <- tabPanel(
  "Interactive Page Three",
  sidebarLayout(
    mainPanel(
      tags$h1("Weighted Distribution of COVID-19 Deaths"),
      tags$p("This visualization outlines the weighted distribution of", 
      strong(strong("state")), " deaths by the way of state. Each point on the 
      visualization represents the weighted percent of deaths by that ethnicity 
      for that state."),
      tags$h2("Insights"),
      tags$p("From this visualization we are identifying the weighted 
             distributions of different populations. This is important due to 
             the inherent bias that is produced by large populations. With this 
             visualization we are able to identify the populations that simply 
             wouldn’t appear on a bar graph or unweighted districted. It also 
             allows for minorities to be looked at on the same level as the 
             other population groups."),
      plotlyOutput("interactive_three"),
      
    ),
    sidebarPanel(
      selectInput(
        inputId = "race_3",
        label = "Ethnicity",
        choices = c("Non.Hispanic.White", "Non.Hispanic.Black.or.African.American",
                    "Non.Hispanic.American.Indian.or.Alaska.Native", "Non.Hispanic.Asian",
                    "Non.Hispanic.Native.Hawaiian.or.Other.Pacific.Islander", "Hispanic.or.Latino",
                    "Other"),
        selected = 1
      )
    )
  )
)

summary <- tabPanel(
  "Summary",
  fluidPage(
    includeMarkdown("./Takeaway_1.md"),
    img("New York COVID-19 Deaths",
      src = "./Screen Shot 2020-12-09 at 3.17.21 PM.png"),
    includeMarkdown("./Takeaway_2.md"),
    img("Disribution of COVID-19 Deaths",
      src = "./Screen Shot 2020-12-09 at 3.18.00 PM.png"),
    img("Weighted Distribution of COVID-19 Deaths",
        src = "./Screen Shot 2020-12-09 at 3.18.12 PM.png"),
    includeMarkdown("./Takeaway_3.md"),
    img("Disproportionate Impact of COVID-19 Deaths by Race",
        src = "./Screen Shot 2020-12-09 at 3.17.44 PM.png")
  )
)

ui <- fluidPage(
  tags$head(
    tags$link(rel = "preconnect", href = "https://fonts.gstatic.com"),
    tags$link(rel = "stylesheet",
          href = "https://fonts.googleapis.com/css2?family=Lora&display=swap")
  ),
  theme = shinytheme("cyborg"),
  includeCSS("styles.css"),
  navbarPage(
    "Final Deliverable",
    overview,
    interactive_one,
    interactive_two,
    interactive_three,
    summary
  )
)
