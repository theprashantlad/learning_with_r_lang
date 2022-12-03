#clearlist
rm(list=ls())

###################################
## In Built Datasets  ##
###################################

# load the datasets

library(datasets)
data()

View(iris)
?iris

?mtcars
View(mtcars)

###################################
## Dplyr Package  ##
###################################

# install.packages("dplyr", dependencies = TRUE)

library(dplyr)

#========================================================
# select - returns a subset of the columns
#========================================================

head(mtcars)
dim(mtcars)

select(mtcars, mpg)
select(mtcars, mpg, disp)
select(mtcars, 1,3)

select(mtcars, mpg:wt)
select(mtcars, 1:6)

select(mtcars, mpg:wt, -hp)
select(mtcars, 1:6, -4)

head(iris)
dim(iris)

select(iris, Sepal.Length, Petal.Length)
head(select(iris, Sepal.Length, Petal.Length))

### Tibble Data Frame ### 

mtcars <- tibble::as_tibble(mtcars) # tibble df
mtcars

select(mtcars, mpg, disp)
select(mtcars, mpg : wt)

select(mtcars, mpg:wt, -hp)

iris <- tibble::as_tibble(iris) #tibble df
iris

select(iris, Sepal.Length, Petal.Length)

#============================================================================
# filter() enables easy filtering, zoom in, and zoom out of relevant data. 
#============================================================================

unique(mtcars$cyl)

filter(mtcars, cyl == 8)

# = is an assignment operator and == is logical operator

filter(mtcars, cyl < 8)

select(filter(mtcars, cyl < 8), cyl, vs, mpg, wt)

#============================================================================
# mutate() helps add new variables to an existing data set
#============================================================================

# syntax is mutate(data, new_column)

dim(mtcars) # 32 11

new_mtcars <- mutate(mtcars, my_custom_disp = disp/2)
new_mtcars

dim(new_mtcars) # 32 12

#============================================================================
# arrange function helps arrange the data in a specific order
#============================================================================

# syntax is arrange(data, ordering column)

arrange(mtcars, disp) # default is ascending order
arrange(mtcars, desc(disp))

arrange(mtcars, cyl, disp)
arrange(mtcars, cyl, desc(disp))

#============================================================================
# summarize() function summarizes multiple value into a single value in a dataset. 
#============================================================================

unique(mtcars$cyl)

summarise(mtcars, mean(wt))

# wt of the car across different number of cyl

summarise(group_by(mtcars, cyl), mean(wt))

summarise(group_by(mtcars, cyl), mean_wt = mean(wt), max_wt = max(wt), 
          min_wt = min(wt), sd_wt = sd(wt))

###############################################################################
## Piping Operator
###############################################################################

# %>% - ctrl + shift + m

mtcars %>% group_by(cyl) %>% summarise(mean_wt = mean(wt), max_wt = max(wt), 
                                     min_wt = min(wt), sd_wt = sd(wt))

###############################################################################
## Hflights
###############################################################################

# install.packages('hflights', dependencies = T)

library(hflights)

?hflights

head(hflights)

hflights

hflights <- tibble::as_tibble(hflights) #tibble df
hflights

# Atomic vectors
# The atomic vectors are the atomic vectors of R, the simple building blocks upon which all else is built. There are four types of atomic vector that are important for data analysis:
#
# logical vectors <lgl>   contain TRUE or FALSE.
# integer vectors <int>   contain integers.
# double vectors <dbl>    contain real numbers
# character vector <chr>  contain strings made with "".

colnames(hflights)

# summarising distance wrt uniquecarriers

hflights %>% group_by(UniqueCarrier) %>% summarise(Mean_Dist = mean(Distance),
                                                   Median_Dist = median(Distance))

#-----------------------------------------------------------------
# Q:: Rank each of the uniquecarriers acc to increasing order of arrival delay
#-----------------------------------------------------------------

summary(hflights$ArrDelay)
#    Min.  1st Qu.  Median  Mean  3rd Qu.    Max.    NA's 
# -70.000  -8.000    0.000  7.094  11.000 978.000    3622 

hflights %>% group_by(UniqueCarrier) %>% filter(ArrDelay>0)
View(hflights)

# hflights %>% group_by(UniqueCarrier) %>% filter(ArrDelay>0) %>% arrange(ArrDelay)

hflights %>% group_by(UniqueCarrier) %>% filter(ArrDelay > 0) %>% 
  summarise(Mean_ArrDelay = mean(ArrDelay))

hflights %>% group_by(UniqueCarrier) %>% filter(ArrDelay > 0) %>% 
  summarise(Mean_ArrDelay = mean(ArrDelay)) %>% arrange(Mean_ArrDelay)

hflights %>% group_by(UniqueCarrier) %>% filter(ArrDelay > 0) %>% 
  summarise(Mean_ArrDelay = mean(ArrDelay)) %>% arrange(Mean_ArrDelay) %>% 
  mutate(Rank = rank(Mean_ArrDelay))

