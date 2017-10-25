write.table(mtcars, "mtcars_new.txt")
cars = read.table("mtcars_new.txt", header = T)

# writing to the clipboard
# write.table(cars, "clipboard") # not working in mac environment

write.table(cars,pipe("pbcopy")) 

head(cars)
rownames(cars)
colnames(cars)

# print mpg property
cars$mpg

# reset the property
cars$model = rownames(cars)
rownames(cars) = NULL

cars$maker = word(cars$model, 1)
head(cars)

cars.small.narrow = 
  cars %>%
  filter(cyl ==4) %>%
  select(maker, model, mpg, cyl)
cars.small.narrow

makers = 
  cars %>%
  group_by(maker) %>%
  summarize(maker.mpg = mean(mpg))
head(makers)

# merging two tables based on the certain property
cars.makers = merge(cars, makers, by="maker")
head(cars.makers)

# showing the distribution of data
table(cars$cyl)

table(cars$gear, cars$cyl)


# distribution of data
hist(cars$mpg)

# scatter plot - showing the relation between wt, mpg
plot(cars$wt, cars$mpg)

# scatter plot - 3가지 속성
qplot(wt, mpg, data=cars, shape=factor(cyl))

# 
