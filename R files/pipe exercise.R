data("ToothGrowth")
View(ToothGrowth)

filtered_tg <- filter(ToothGrowth, dose == 0.5) #filter by dose == 0.5
arrange( filtered_tg, len) #sorting by len column in aesending order

#nested function for above 2 functions
arrange(filter(ToothGrowth, dose == 0.5),len)

#Pipe funtion control + shift + m for pipe operator [filter, group by and then summarized]
filtered_toothgrowth <- ToothGrowth %>%  
  filter(dose == 0.5) %>% 
  group_by(supp) %>% 
  summarize(mean_len = mean(len, na.rm = T), .group = "drop1")
#na.rm = TRUE: This tells R to remove (ignore) any missing values (NAs) in the vector before calculating the mean
print(filtered_toothgrowth)