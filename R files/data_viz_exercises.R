data("penguins")
library(tidyverse)
library(ggplot2)
head(penguins)
ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g, shape= species, color= species, siz= species))+ geom_jitter()+ labs(title = "penguin data plotting")

ggplot(data=penguins, aes(x=bill_length_mm, y=bill_depth_mm, linetype = species))+ geom_smooth(color="purple")+ geom_point()+ labs(title = "penguin data plotting")

library(tidyverse)
library(skimr)
library(janitor)
#importind data from csv
booking_df <- read_csv("D:/google data course/sample_dataset/Hotel_bookings.csv")

ggplot(data= booking_df, aes(x= stays_in_weekend_nights, y= children)) + geom_point()

#bar chart + facet wrap
ggplot(data=diamonds, aes(x= color, , fill =cut)) + geom_bar(color="blue") + facet_wrap(~cut) # show the count of x

#facet grid
ggplot(data=penguins, aes(x=flipper_length_mm, y = body_mass_g, size = year)) + geom_point()  +facet_grid(sex ~ species)

#exercise
ggplot(data=booking_df, aes(x=lead_time, y= children)) + geom_point() 
ggplot(data= booking_df, aes(x=hotel))+ geom_bar()+facet_wrap(~market_segment)

#filtering and plotting
onlineta_city_hotels <- filter(booking_df, hotel=="" & booking_df$market_segment =="")
View(onlineta_city_hotels)