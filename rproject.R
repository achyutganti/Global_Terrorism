library(tidyr)
library(stringr)
library(readr)
library(dplyr)
library(forcats)
poverty <- read_csv("~/R-class-518/poverty.csv")


population <- read_csv("~/R-class-518/population.csv")

GTD <- read_csv("~/R-class-518/GTD.csv")

county_city <- read_csv("~/R-class-518/county_city.csv")

population2 <- population%>%
  gather('POPESTIMATE2013','POPESTIMATE2014','POPESTIMATE2015','POPESTIMATE2016',key='year',value='cases')%>%
  mutate(year=fct_collapse(year,
                           '2013'='POPESTIMATE2013',
                           '2014'='POPESTIMATE2014',
                           '2015'='POPESTIMATE2015',
                           '2016'='POPESTIMATE2016'))

colnames(pop)[6] <- 'provstate'
colnames(pop)[7] <- 'iyear'


poverty$Area_Name<-str_replace_all(poverty$Area_Name,'(c|C)ounty$','')
poverty$Area_Name<-str_replace_all(poverty$Area_Name,'(B|b)orough$','')
poverty$Area_Name<-str_replace_all(poverty$Area_Name,'(C|c)ity$','')
poverty$Area_Name<-str_replace_all(poverty$Area_Name,'(P|p)arish$','')
poverty$Area_Name<-str_replace_all(poverty$Area_Name,'^St\\.','Saint')
poverty$Area_Name<-str_replace_all(poverty$Area_Name,'(C|c)ensus Area$','')
poverty$Area_Name<-str_replace_all(poverty$Area_Name,'District of Columbia','District Of Columbia')
poverty$Area_Name<-str_replace_all(poverty$Area_Name,'Wrangell City and','Wrangell Petersburg')
poverty$Area_Name<-str_replace_all(poverty$Area_Name,"Prince George's",'Prince Georges')
poverty$Area_Name<-str_replace_all(poverty$Area_Name,"Queen Anne's",'Queen Annes')
poverty$Area_Name<-str_replace_all(poverty$Area_Name,"Saint Mary's",'Saint Marys')
poverty$Area_Name<-str_replace_all(poverty$Area_Name,"Fond du Lac",'Fond Du Lac')





