library(tidyverse)

head(diamonds)

str(diamonds)

glimpse(diamonds)

colnames(diamonds)

#renaming column name
rename(diamonds, carat_new = carat, cut_new = cut)

# stat summarization 
summarize(diamonds, max_carat = max(carat))

#plotting the data with scatter plot
ggplot(data = diamonds, aes(x = carat , y = price, color = cut)) + geom_point()

#creating plot for each category

ggplot(data = diamonds, aes( x = carat, y = price, color = cut)) + geom_point() + facet_wrap(~cut)
