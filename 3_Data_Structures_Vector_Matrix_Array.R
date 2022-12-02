# Clear Workspace
rm(list=ls())

#############################################################################################
# Vectors: are one-dimension arrays that can hold numeric data, character data, or logical data. 
#############################################################################################

p <- 1,2,3,4 # Error: unexpected ',' in "p <- 1,"

# combine function c()

p <- c(1,2,3,4)
p

my_number3 <- c(2,4,6,8,10,210,95,37) # combine function c()
my_number3
class(my_number3)

my_number2 <- 1:50 # Use of colon operator
my_number2

# Character vector

my_character <- c("universe","sun","moon")
my_character
class(my_character)

# logical vector

my_logical <- c(TRUE,FALSE)
my_logical
class(my_logical)

# vector of diff data types

z = c(0,1,2,3,4,5L,6,-1,"st",TRUE, 2+0i)
z

#=========================================================================

# To Do:: Check the class of z, remove the element one by one and check again 
# do this till you exhaust all data types

# Hierarchy of the Data Types in R

class(z) # "character"

z = c(0,1,2,3,4,5L,6,-1,TRUE, 2+0i)
z
class(z) # "complex"

z = c(0,1,2,3,4,5L,6,-1,TRUE)
z
class(z) # "numeric"

z = c(5L,TRUE)
z
class(z) # "integer"

z = c(TRUE)
z
class(z) # "logical"

# "character" > "complex" > "numeric" > "integer" > "logical"

#=========================================================================

vec <- c(1,3,4,5,6,7,11,13,56,34,25)
vec

# vectorname[index_of_the_element]  === synatx

# In R, indices start from 1

vec[1]

vec[2,4] # Error in vec[2, 4] : incorrect number of dimensions

c(2,4)

vec[c(2,4)]

2:5 # sequence - the o/p is vector

vec[2:5] # 2nd ele to 5th ele

vec <- c(1,3,4,5,6,7,11,13,56,34,25)
vec

# 1  3  4  5  6  7 11 13 56 34 25  -- data
# 1  2  3  4  5  6  7  8  9 10 11  -- index

vec[-1]

vec = vec[-1] # dropping the first element
vec

vec[-c(2,4)]

vec[-(2:5)]



#############################################################################################
## Matrix : Two Dimensional array ##
#############################################################################################

v <- c(1,2,3,4)
v

foo <- matrix(v, ncol = 2, nrow = 2) # bycol is deflaut
foo

foo <- matrix(v, ncol = 2, nrow = 2, byrow = T)
foo

foo <- matrix(v, ncol = 4, nrow = 5) # repeats the vector to create the matrix
foo

foo <- matrix(v, ncol = 2, nrow = 5, byrow = T)
# Warning message:
#   In matrix(v, ncol = 2, nrow = 5, byrow = T) :
#   data length [4] is not a sub-multiple or multiple of the number of rows [5]
foo

## Creating matrix using cbind() & rbind() function

1:3
4:6

rbind(1:3, 4:6)

cbind(1:3, 4:6)

# Accessing matrix elements

mat <- matrix(c(1:4), nrow = 2, ncol = 2)
mat

# matrix_name[row_index, col_index]

mat[1,1] # element in 1st row and 1st col
mat[2,1] # element in 2nd row and 1st col
mat[1,2] # element in 1st row and 2nd col
mat[2,2] # element in 2nd row and 2nd col

mat[,1] # 1st col
mat[,2] # 2nd col
mat[1,] # 1st row
mat[2,] # 2nd row

x <- matrix(1:9, nrow = 3, byrow = T)
x

x[1:2,]# 1st and 2nd row
x[,2:3] # 2nd and 3rd col

x[1:2 , 2:3] # intersection of elements in 1st and 2nd row and 2nd and 3rd col

mat2 <- matrix(1:12, nrow = 3, ncol = 4)
mat2

mat2[1:2, c(2, 4)]

mat2[c(1,3), c(1, 4)]

mat2[,-1]

dim(mat2)

#############################################################################################
## Array : Similar to matrices but can have more than two dimensions ##
#############################################################################################

# Data Structure supports more than one matrix

arr2 <- array(1:8, dim = c(2,4,2)) # no. of row, no. of col, no. of matrix
arr2

arr4 <- array(2:15, dim = c(2,4,3)) # no. of row, no. of col, no. of martix
arr4

# Accessing elements from the array

# array_name[row_index, col_index, matrix_index]

arr4[, , 1] # 1st matrix
arr4[, , 2] # 2nd matrix
arr4[, , 3] # 3rd matrix

# how to access 15?

arr4[, , 2]
arr4[2, 3, 2]

#===========================================================
# homogenous data structures
#===========================================================

z = c(0,1,2,3,4,5L,6,-1,"st",TRUE, 2+0i)
z
class(z) # "character"

foo <- matrix(z, ncol = 3)
foo
class(foo)  # "matrix"
mode (foo) # "character"

arr4.1 <- array(z, dim = c(2,4,3))
arr4.1 
class(arr4.1) # "array"
mode(arr4.1) # "character"

###############################################
# class - data type/ data structure
# mode - the storage mode of an object 
###############################################

######################################################################################################
## Lists : It may contain a combinaton of vectors, matrices, data frames and even other list ## 
######################################################################################################

vec1 <- c(rep(1,11), rep(2,17))
vec1

vec2 <- c(23, 45, 67, 76, -8, 3.5, 2.19, 4)
vec2

lists = list(vec1, vec2, "an example") # 2 vectors and one character element
lists

lists1 <- list(arr4, z, mat2)
lists1

lists <- list(vec1, mat2, arr4) # vector, matrix and arr
lists

# Accessing elements and values from the lists

lists[[1]] # vec
lists[[2]] # matrix
lists[[3]] # array

lists[[1]][6] # accessing elements from a vec
lists[[2]][1,2] # accessing elements from a matrix
lists[[3]][2,3,2] # accessing elements from a array

#############################################################################################
# DATAFRAME: Similar to general matrics but its columns can contain 
# different modes of data types such as numeric and character
#############################################################################################

emp_id <- 1:5
emp_name <-  c("Rick", "Dan", "Mike", "Ryan", "Gary")
salary = c(623, 515, 729, 843, 450)

mat3 <- cbind(emp_id, emp_name, salary)
mat3

class(mat3) # "matrix"
mode(mat3) # "character"

# all element are converted to character if a character element is present

###############################################
# class - data type/ data structure
# mode  - the storage mode of an object

# in what form the data is stored in the data structure
###############################################

emp_id <- 1:5
emp_name <-  c("Rick", "Dan", "Mike", "Ryan", "Gary")
salary = c(623, 515, 729, 843, 450)

class(emp_id)
class(emp_name)
class(salary)

emp.data <- data.frame(emp_id, emp_name, salary)
emp.data

class(emp.data) # "data.frame"
mode(emp.data) # "list"

#########################################################################

emp_id <- 1:5
emp_name <-  c("Rick", "Dan", "Mike", "Ryan", "Gary")
salary = c(623, 515, 729, 843, 450)

class(emp_id)
class(emp_name)
class(salary)

list_ = list(emp_id, emp_name, salary)
list_

df = as.data.frame(list_) 
# converting a list to a dataframe = typecasting hence as.data.frame
df

colnames(df) # get the colnames
colnames(df) <- c("emp_id", "emp_name", 'salary') # set the colnames
colnames(df)

df

# Accessing elements from the Dataframe

# dataframe_name[row_no, col_no]

emp.data[,1] # 1st Col
emp.data[,2] # 2nd Col
emp.data[2:3, 2:3]
emp.data[1,] # 1st row
emp.data[2,] # 2nd row
emp.data[,c(1,3)]

# dataframe_name[row_no, col names in qoutes]

emp.data[,'salary']
emp.data[,c('emp_id','salary')]

# dataframe_name$col_name

emp.data$salary

# once we type in $ the column names are visible, scroll using arrows, once selected pick using tab

colnames(emp.data)
rownames(emp.data)

############################################################
## Factor ## 
############################################################

# Qualitative - Nominal and Ordinal

# Factors are the data objects which are used to categorize the data and store it as levels. 
# They can store both strings and integers. They are useful in the columns which have a 
# limited number of unique values. Like "Male, "Female". 
# They are useful in data analysis for statistical modeling

gender <- c('Male', "Female", "Female", "Male")
gender
class(gender)

factor_gender <- factor(gender)
factor_gender
class(factor_gender)

data_ranks <- c("Good","Bad","Good","Excellent","Excellent","Good","Bad", 'Outstanding', "Bad","Bad","Good",
                "Excellent")
data_ranks
data_ranks_factor = factor(data_ranks)
data_ranks_factor

data_ranks_factor = factor(data_ranks, labels = c("Bad", "Good", "Excellent", "Outstanding"))
data_ranks_factor