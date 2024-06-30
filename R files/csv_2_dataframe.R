library(tidyverse)
library(skimr)
library(janitor)
#importind data from csv
booking_df <- read_csv("D:/google data course/sample_dataset/Hotel_bookings.csv")

#exploring data structure
head(booking_df)
colnames(booking_df)
glimpse(booking_df)
skim_without_charts(booking_df)

#selecting certain columns
trim_df <- booking_df %>% select(hotel, is_canceled, lead_time)
example_df <- booking_df %>% 
  select(arrival_date_year, arrival_date_month) %>% 
  unite(arrival_date_month, c(arrival_date_month,), sep= "/ ") 

ex_df<-mutate(booking_df,test = paste(arrival_date_month, arrival_date_year)) # concatinating two columns

ex_df<- rename(ex_df, month_year="test") #renaming columns and reassigning updated value
ex_df %>% 
  distinct(month_year)

example_dataframe <- booking_df %>% 
  summarize(number_canceled = sum(is_canceled), average_lead_time = mean(lead_time)) #summary of mean and total cancellation

example_dataframe