library(tidyverse)
library(skimr)
library(janitor)
library(ggplot2)
library(dplyr)
#importind data from csv
ride_data_df <- read_csv("D:/googl_data_course/R_basic_exercises/case study/datasets/202006-divvy-tripdata/202004-divvy-tripdata.csv")

#exploring data structure
head(ride_data_df)
colnames(ride_data_df)


# exploring dataset
ggplot(data = ride_data_df, aes(x= member_casual)) + geom_bar() # member type breakdown

#ride data total count vs distinct count
summary_rideid_count <- ride_data_df %>% summarize(distinct_values = n_distinct(ride_id), total_count= sum(!is.na(ride_id)))
print(summary_rideid_count)

# break down by member type, start point, end point
group_counts <- ride_data_df %>%
  group_by(member_casual, start_station_name, end_station_name) %>%
  summarize(count = n())
print(group_counts)




