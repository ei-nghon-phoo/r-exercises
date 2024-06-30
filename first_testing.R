View(penguins)
ggplot(data=penguins)
# this is a comment
first_var <- "This is my variable"
second_var <- 12.5

#our first calculation
sale_quarter_1 <- 23432.23
sale_quarter_2<-234324

mid_year_sale <- (sale_quarter_2+sale_quarter_1)*0.02
print(mid_year_sale)
#using if else
if (mid_year_sale>50000){
  print('it exceeds the target amount')
} else if(mid_year_sale>30000 & mid_year_sale<50000)
{ print ('middle condition')
}else {
  print ('it did not reach the target amount')
}


