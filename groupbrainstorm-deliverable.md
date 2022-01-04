# Brainstorm Rubric

This rubric is intended to help guide expectations and increase transparency. However, it is not necessarily fully exhaustive. Make sure to read the detailed explanation on Canvas.

## Project set up
 *We have added everyone to Thomas Kanenaga's GitHub final project repository*

## Domain of Interest

### Why are you interested in this field/domain?
*We are interested in the racial disparities in healthcare, especially during the COVID-19 pandemic. We all come from culturally different backgrounds and are curious on how our ethnicity plays into the healthcare one receives with the United States.*
### Examples of other data driven projects related to this domain
1. [COVID-19 Hospitalization and Death by Race/Ethnicity](https://www.cdc.gov/coronavirus/2019-ncov/covid-data/investigations-discovery/hospitalization-death-by-race-ethnicity.html)  This data driven project by the CDC outlines a comparison between minority groups in the U.S. and the caucasian majority when it comes to  hospitalizations and deaths between the different racial groups.
2. [Coronavirus Data By Race: Understanding The Disparities](https://www.npr.org/sections/health-shots/2020/09/23/914427907/as-pandemic-deaths-add-up-racial-disparities-persist-and-in-some-cases-worsen) by NPR looks into the relationship between race and covid cases / deaths per state.
3. [2019 Edition — Health Disparities by Race and Ethnicity](https://www.chcf.org/publication/2019-edition-health-disparities-by-race/) is also talking about health disparities by race and ethnicity based on California Landscape.
4. [Racial, Ethnic, and Gender Disparities in Health Care in Medicare Advantage](https://www.cms.gov/files/document/2020-national-level-results-race-ethnicity-and-gender-pdf.pdf)  This report is from CMS(centers for medicare & medicaid services) and it’s around racial, ethnic and gender disparities in Health Care in Medicare Advantage.



### What data-driven questions do you hope to answer about this domain

1. How does the death rate from COVID-19 compare between people of different race/ethnicities?
  - One example to investigate the question is using the “Provisional_Death_Counts_for_Coronavirus_DiseaseCOVID-19_Distribution_of_Deaths_by_Race_and_Hispanic_Origin.csv”
        dataset and compare various columns representing rates of death by race. Comparing by race via the various indicators affords many avenues for analysis.
2. Which time zones (least biased way we found to sort states) affected people of color the most adversely as far as COVID-19 deaths go?
  - One possible method could be using the group by function on state columns, group states by time zone, and compare rates of COVID-19 deaths from various groups of color by
        timezone. (Ex: cases_black / cases_total = rate)  
3. Geographically, with the lockdown and non-lockdown states, what are the racial/ethnicities different from each other?
  - We can answer this question could be using the race data entry to group states and finding the proportions of each race in each state.

## Finding Data
1. [COVID-19 Deaths by Race/Ethnicity](https://www.kff.org/other/state-indicator/covid-19-deaths-by-race-ethnicity/?currentTimeframe=0&sortModel=%7B%22colId%22:%22Location%22,%22sort%22:%22asc%22%7D)
  - The data is extracted from state websites on November 8, 2020. We can use this along with information about healthcare in each state to see if there is a correlation.
  - It has 20 columns and 50 rows in the data.
  - This dataset shows the percentage of deaths per each race. We can use this along with information about healthcare in each state to see if there is a correlation.
2. [COVID-19 Tracking by Race](https://covidtracking.com/race)
  - 41 columns
  - 3473 rows
  - Collected by Center for antiracist research and COVID-19 tracking project team
  - This data shows the racial disparities and death rates among each states in the US, and the infection rate among each racial and ethnic group.
3.  [Health_disparities](https://www.cdc.gov/nchs/nvss/vsrr/covid19/health_disparities.htm)
  - This dataset has 13 columns and 200 rows.
  - It was collected by the national center for health statistics. (A division of the CDC)
  - This dataset collected by the CDC is available as either a CSV or API, and will give us up to date data about the total deaths for each racial group from COVID-19, helping us answer our core questions regarding if there is a disproportionate amount of deaths
  for PoC.
