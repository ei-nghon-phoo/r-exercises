library(tidyverse)
data("diamonds")
as_tibble(diamonds)

#loading library
library(here)
library(skimr)
library(dplyr)
library(palmerpenguins)
library(dplyr)
library(janitor)
library(tidyverse)

skim_without_charts(penguins)
glimpse(penguins)
head(penguins)

#selecting a subset of columns
penguins %>% 
  select(-species)

#selecting distinct values
penguins %>% 
  distinct(year)

#renaming column 
penguins %>% 
  rename(island_new=island)

#to upper, to lower case for column names
rename_with(penguins, tolower)

clean_names(penguins) # from janitor function

#sorting and filtering the penguins
penguins %>% 
  arrange(-bill_length_mm)

penguins2 <- penguins %>%  arrange(-bill_length_mm)
View(penguins2)

#group by island, remove null, summarize by mean/max length
penguins %>% group_by(island,species,sex) %>% drop_na() %>% summarize(mean_bill_length=mean(bill_length_mm),max = max(bill_length_mm)) %>% arrange(-mean_bill_length)
penguins %>% group_by(sex) %>% drop_na() %>% summarize(max = max(bill_length_mm))

penguins %>% 
  filter(sex == "male") %>% 
  group_by(island, species) %>% 
  summarize(max_bill=max(bill_depth_mm))
  
