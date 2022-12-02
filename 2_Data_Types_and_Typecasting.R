rm(list = ls())

# shortcut for cleaning console - click on console and ctrl + l

############################################################
## Data Types in R ##
############################################################

# Numeric - real and decimals

num1 = 1
num1
class(num1)

num2 = 1.8
num2
class(num2)

# the default will be numeric

# Integers

num = 1L # for defining integer value use L- Longform of the number
num
class(num)

# Character

ch1 <- "RProgramming"
class(ch1)

# Logical

x = 3
class(x)

x > 2
y = x > 2
class(y)

# Complex

a <- -20
sqrt(a)

# Warning message:
# In sqrt(a) : NaNs produced

# Imaginary Number :: i = sqrt(-1)

a = -20 + i # Error: object 'i' not found

a = -20 + 0i
sqrt(a)
class(a)

##################################################################
## Typecasting
##################################################################

# as.datatype ------- is the syntax

num1 = 1.9
class(num1)# "numeric"

as.integer(num1)
class(num1)# "numeric"

num1 = as.integer(num1)
class(num1)

ch1 <- "RProgramming"
ch1
class(ch1)

as.integer(ch1)
as.numeric(ch1)
as.logical(ch1)
as.complex(ch1)

# a character value cannot be typecasted to other data types

#===============================================================

ch1 <- "1000"
ch1
class(ch1)

as.integer(ch1)
as.numeric(ch1)
as.logical(ch1) 
as.complex(ch1)

as.logical(as.numeric(ch1)) 
as.logical(0)
as.logical(10)
as.logical(-10)
as.logical(0.5)

