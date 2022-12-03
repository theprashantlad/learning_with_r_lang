rm(list=ls())

###########################################
###         DATA MANIPULATION         ###
###########################################  

# LOADING FILE
RSC <- read.csv("RetailScoreData.csv")
head(RSC)

# hygiene check to see if data is loaded correctly and also when I am making certain changes, 
# we want to check if the changes are implemented correctly

head(RSC, 10)

tail(RSC)
tail(RSC,10)

### Data Dictionary of "RSC.csv" ### 

# branch:   branch code
# ncust:    number of customers
# age:      age of the borrower
# ed:       educational qualification based on degrees
# employ:   number of years in the job
# address:  number of years in the current address
# income:   income in '000$
# debtinc:  debt to income ratio (or burden) in %
# creddebt: credit card debt in '000$
# othdebt:  other debt in $mn
# default:  dummy for default incidents

str(RSC) # info data type and shows a few data points in each column

################################################################
# CHANGING THE DATA TYPE OF THE COLUMN
################################################################
# branch:   branch code is Nominal Data

str(RSC$branch) # is being read as integer value

# branch would be a nominal data type. So, in R it should be a factor variable. 
# Factor variables have levels

RSC$branch <- as.factor(RSC$branch)
levels(RSC$branch)
class(RSC$branch)

str(RSC$branch) # is being read as factor value

################################################################
# CHANGING THE COLUMN NAMES
################################################################

colnames(RSC) # vector
colnames(RSC)[c(3,5)]
colnames(RSC)[c(3,5)] <- c("customer_id", "education")
colnames(RSC)

################################################################
# ADDING VARIABLES
################################################################

colnames(RSC)
RSC$totaldebt <- RSC$creddebt + RSC$othdebt
colnames(RSC)

################################################################
# ADDING VARIABLES AT A SPECIFIC INDEX
################################################################

dataset <- data.frame(a = 1:5, b = 2:6, c = 3:7)
dataset

# install.packages('tibble', dependencies = T)
library(tibble)

add_column(dataset, d = 4:8, .after = 2) # index

add_column(dataset, e = 10:14, .after = "c") # col name

add_column(dataset, g = 10:14, .before = "a") # col name