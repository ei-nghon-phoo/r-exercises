#manually creating a new dataframe
id <- c(1:10)
id
name <- c("John Mendes", "Rob Stewart", "Rachel Abrahamson", "Christy Hickman", "Johnson Harper", "Candace Miller", "Carlson Landy", "Pansy Jordan", "Darius Berry", "Claudia Garcia")

job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")

employee <- data.frame(id, name, job_title)
print(employee)

#separating one column into two columns by separtor space
column_separated <-separate(employee, name,  into= c ('first_name', 'last_name'), sep =" ")
unite(column_separated, "name", first_name, last_name, sep= ' ' )

library(palmerpenguins)
#adding a new column with data data manipulation
penguins %>% 
  mutate(body_mass_kg =body_mass_g/100, fipper_length_m = flipper_length_mm/1000) %>% 
  arrange(bill_length_mm)