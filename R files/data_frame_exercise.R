library(ggplot2)
library(tidyverse)
data(diamonds)
#viewing full dataframe
#View(diamonds)

# viewing subset of dataframe
head(diamonds)

#checking structure and column
str(diamonds)
colnames(diamonds)
glimpse(diamonds)

#updating the dataframe
mutate(diamonds, carat_2= carat*18) #adding new column

names<- c ("aa","bb","cc","dd" )
age<-c (12, 23, 42, 23)
people<- data.frame(names, age)
head(people)
colnames(people)
print(names)

#adding new column
people<-mutate(people, age_in_5_years = age+5)
filter(people, age<40)
people

fruits<- c("lemon","strawberry","durian","mango",'bluebarry')
rank<-c(4,2,5,3,1)
fruit_rank<- data.frame(fruits, rank)
arrange(fruit_rank, rank)
glimpse((fruit_rank))

