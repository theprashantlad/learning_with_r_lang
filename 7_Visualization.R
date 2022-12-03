rm(list=ls())

##############################################################
### Barplot
##############################################################

data('mtcars')
View(mtcars)
?mtcars

barplot(mtcars$disp)

?table # it is a group by command

counts = table(mtcars$gear)
counts

barplot(counts)

# Horizontal Bar plot
dev.off()

barplot(counts, horiz = TRUE)

barplot(counts, main = "Bar Plot", xlab = "Gear",
        ylab = "Frequency", names=c("High","Medium","Low"),
        legends = rownames(counts), col = c("red","yellow","green"))

barplot(counts, main = "Bar Plot", xlab = "Frequency",
        ylab = "Gear", names=c("High","Medium","Low"),
        legends = rownames(counts), col = c("red","yellow","green"),horiz = TRUE)

##############################################################
### Stacked Barplot : Data has 2 categories
##############################################################

counts1=table(mtcars$vs,mtcars$gear)
counts1

barplot(counts1, main = "Car Distribution by Gears and VS",
        xlab = "Number of Gears",
        col = c("grey", "cornflowerblue"),
        legend = rownames(counts1))

# Bars besides
barplot(counts1,main="Car Distribution by Gears and VS", 
        xlab="Number of Gears",
        col=c("grey","cornflowerblue"),
        legend = rownames(counts1),beside = TRUE)

##############################################################
### Piechart
##############################################################

slices= c(10,8,7,6,5)
Lbls=c("India","Australia","US","UK","France")

pie(slices,labels=Lbls,main="Pie Chart")

# Pie with  %

pct=(slices/sum(slices)*100)
pct

Lbls1=paste(c("India","Australia","US","UK","France")," ",round(pct,2),"%",sep="")
Lbls1

pie(slices,labels=Lbls1 , col=rainbow(5),main = "Pie with %")

# 3 dimensional pie

# install.packages("plotrix")

library(plotrix)

slices <- c(10, 12,4, 16, 8)
pct=(slices/sum(slices)*100)
pct
dev.off()

lbls <- paste(c("US", "UK", "Australia", "Germany", "France"), " ", round(pct,2) , "%", sep ="")
pie3D(slices, labels=lbls, explode=0.1, main="3D Pie Chart", labelcex=1) 

##############################################################
### Histogram
##############################################################

data("mtcars")
View(mtcars)
hist(mtcars$mpg)
hist(mtcars$mpg,breaks = 5,col = "blue",border = "red")

##############################################################
### Kernel Density Plot
##############################################################

# Kernel Density Plot - This chart is a variation of a Histogram that uses kernel smoothing 
# to plot values,allowing for smoother distributions by smoothing out the noise.

density_data <- density(mtcars$mpg)
density_data
plot( density_data)

# add color to the plot
polygon(density_data, col = "skyblue", border = "red")

##############################################################
### Line Chart
##############################################################

## Baby MOM weight & Height after birth

weight<-c(2.5, 2.8, 3.2, 4.8, 5.1,5.9,6.8,7.1,7.8,8.1)
height<-c(1.6,1.8,2.0,2.1,2.2,2.4,2.5,2.7,2.8,2.9)
month<- c(0,1,2,3,4,5,6,7,8,9)

dev.off()

plot(weight, month, type = "b", main = "Baby Weight Chart", pch=10, col=22)

# what type of plot should be drawn. Possible types are
# "p" for points,
# "l" for lines,
# "b" for both,
# "c" for the lines part alone of "b",
# "o" for both ‘overplotted’,
# "h" for ‘histogram’ like (or ‘high-density’) vertical lines,
# "s" for stair steps,
# "S" for other steps, see ‘Details’ below,
# "n" for no plotting.

plot(weight, month, type = "c", main = "Baby Weight Chart", pch=15, col=20)

plot(height,month,type="c",pch=5, col=564)

##############################################################
### Boxplot
##############################################################

data("airquality")  
View(airquality)
?airquality

summary(airquality)

boxplot(airquality$Ozone, main = "Ozone at New York",
        xlab = 'parts per billion', ylab = "Ozone",
        horizontal = FALSE, col = 53)
bp = boxplot(airquality$Ozone, main = "Ozone at New York",
             xlab = 'parts per billion', ylab = "Ozone",
             horizontal = FALSE, col = 53)
bp$stats
bp$out

##############################################################
### Correlation Matrix & Correlation plot
##############################################################

# install.packages("MASS", dependencies = T)

library(MASS)

data('Boston')
?Boston

plot(Boston$lstat, Boston$medv)
plot(Boston$rm, Boston$medv)

cor(Boston$lstat, Boston$medv)
cor(Boston$rm, Boston$medv)

cor(Boston)

# install.packages("corrplot", dependencies = T)

library(corrplot)

corr = cor(Boston)

corrplot(corr)
corrplot(corr, type = 'lower')
corrplot(corr, type = 'lower', method = "number")

plot(Boston$tax, Boston$rad)