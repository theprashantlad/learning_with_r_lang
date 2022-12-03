# Clear Workspace
rm(list=ls())

############################################################
## importing data from files ##
############################################################

#--------------------------------------------------------
# Importing .csv file 

getwd() # get the current working directory
# "C:/Users/ASUS/Documents/data_science_excelr_sonal"

#setwd("C:/Users/Sonal/Desktop/ExcelR/Content/Day 3")

RSC = read.csv('RetailScoreData.csv')

# Error in file(file, "rt") : cannot open the connection
# In addition: Warning message:
#   In file(file, "rt") :
#   cannot open file 'RetailScoreData.csv': No such file or directory

View(RSC)

RSC = read.csv('RetailScoreData.csv')
class(RSC)
View(RSC)

#--------------------------------------------------------
# Importing Text file

RSC <- read.table("RetailScoreData.txt")
View(RSC)

RSC <- read.table("RetailScoreData.txt", header = T)
View(RSC)

RSC <- read.table("RetailScoreData.txt", header = T, sep = ",")
View(RSC)

#--------------------------------------------------------
# Importing .excel file

RSC2 <- read_excel("RetailScoreData.xlsx")
View(RSC2)

# Error in read_excel("RetailScoreData.xlsx") : 
#   could not find function "read_excel"

# install.packages("readxl", dependencies = T)

library(readxl)

RSC2 <- read_excel("RetailScoreData.xlsx")
View(RSC2)

RSC3 <- read_excel("RetailScoreData.xlsx", sheet = 2)
View(RSC3)

class(RSC3)

############################################################
## Exporting data to files ##
############################################################

#--------------------------------------------------------

# Exporting .csv file 

write.csv(RSC3, file = 'mydata.csv')
write.csv(RSC3, file = 'mydata1.csv', row.names = F)