library(tidyverse)
library(skimr)
library(janitor)
library(ggplot2)
library(dplyr)
#importind data from csv
ride_data_df <- read_csv("D:/google_data_course/R_basic_exercises/case study/datasets/202006-divvy-tripdata/202004-divvy-tripdata.csv")

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

#adding time taken column
ride_data_df<- ride_data_df %>% 
  mutate(total_time_taken = difftime(ended_at, started_at, units = "mins")) %>% 
  arrange(total_time_taken)

#checking total tile taken 
ride_data_df <-  ride_data_df %>% 
  filter(total_time_taken > 0)
ride_data_df


#Pipe funtion control + shift + m for pipe operator [filter, group by and then summarized]
ride_data_df_summary <- ride_data_df %>%  
  group_by(member_casual) %>% 
  summarize(ride_count = n(),mean_time_taken = mean(total_time_taken, na.rm = T), total_time_taken = sum(total_time_taken, na.rm = T), max_time_taken = max(total_time_taken, na.rm = T),min_time_taken = min(total_time_taken, na.rm = T) )
#na.rm = TRUE: This tells R to remove (ignore) any missing values (NAs) in the vector before calculating the mean
print(ride_data_df_summary)
