library(tidyverse)
library(skimr)
library(janitor)
library(ggplot2)
library(dplyr)
library(geosphere)
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
  #mutate(total_time_taken = difftime(ended_at, started_at, units = "mins")) %>% 
  mutate(total_min_as_num= as.numeric(total_time_taken)) %>% 
  arrange(total_time_taken)

#checking total tile taken 
ride_data_df <-  ride_data_df %>% 
  filter(total_time_taken > 0)
ride_data_df %>% 
  select(ride_id, ended_at, started_at, total_time_taken, total_min_as_num) %>% 
  arrange(-total_time_taken)

str(ride_data_df)
# dropping a column from dataframe
#ride_data_df <- subset(ride_data_df, select = -total_min_as_num)

#Pipe funtion control + shift + m for pipe operator [filter, group by and then summarized]
ride_data_df %>%
  group_by(member_casual) %>%
  summarize(
    min_value = min(total_min_as_num),
    max_value = max(total_min_as_num),
    total_value = sum(total_min_as_num),
    count = n()
  )

# Function to calculate distance using geodist
calculate_distance_km <- function(lat1, lon1, lat2, lon2) {
  coords1 <- cbind(lon1, lat1)
  coords2 <- cbind(lon2, lat2)
  dist_km <- geodist(coords1, coords2, measure = "geodesic") / 1000
  return(dist_km)
}

#adding distance column 
ride_data_df_distance<- ride_data_df %>% 
  mutate(distance = mapply(calculate_distance_km, start_lat, start_lng, end_lat, end_lng)) %>% 
  arrange(distance)

ride_data_df_distance %>% 
  arrange(-distance) %>% s
  select(ride_id,total_time_taken, distance, started_at,ended_at) 


#histogram for distance
library(ggplot2)
ggplot(ride_data_df_distance, aes(x = distance)) +
  geom_histogram(binwidth = 2, fill = "blue", color = "black") +
  labs(title = "Histogram of distance for each ride", x = "Distances", y = "Frequency") + facet_wrap(~ member_casual)
