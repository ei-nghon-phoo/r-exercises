library(Tmisc)
library(ggplot2)
library(datasauRus)
library(SimDesign)
head(quartet)

quartet %>% 
  group_by(set) %>% 
  summarize(min(x),sd(x),mean(y),sd(y), cor(x, y))

#plotting data
ggplot(quartet, aes(x,y))+ geom_point() + geom_smooth(method = lm, se= FALSE) + facet_wrap(~ set)

#plotting datasauRus data
ggplot(datasaurus_dozen, aes(x=x, y=y, colour = dataset)) + geom_point() + theme_void() + theme(legend.position = "none") + facet_wrap(~dataset)


actual_temp <- c(68.3, 70, 72.4, 71, 67, 70)
predicted_tem <- c (67.9, 69, 71.5, 70, 67,69)
bias(actual_temp, predicted_tem) 
# higher value means the dataset is biased, close to zero mean not so biased or close to actual value

actual_sale <- c(150, 203, 137, 247, 116, 287)
predicted_sale <- c(200, 300, 150, 205, 150, 300)
updated_df<- data.frame(actual_sale, predicted_sale)
updated_db <- mutate(updated_df, bias_column= actual_sale - predicted_sale)

updated_db %>% 
  summarize(mean(bias_column))
bias(actual_sale, predicted_sale) # -35 predicted outcomes are larger than actual outcome



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

data(ToothGrowth)

ToothGrowth %>% 
  select(-supp) %>% 
  filter(dose!=0.5)

data("penguins")

penguins %>% 
  drop_na() %>% 
  group_by(species) %>% 
  summarize(min_bill_depth= min(bill_depth_mm))