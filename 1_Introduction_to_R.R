############################################
######## SCRIPT PANE #######################
############################################

# shortcut to run Ctrl+enter
3 + 4
a = 3 + 4
a
print (a)

# variable will take the latest assignment
# console will have output of the code in the script

################################################################################
################################################################################

# This is how to write comments
# hash to comment out a single line, no multiple line commenting, however
# you can select multiple lines and use the shortcut to comment out
# shortcut for commenting : ctrl + shift + c

################################################################################

############################################################
## Assignment ##
############################################################

b = 10
b

# left-hand side to assignment
a <- 6 # less than sign and minus sign -- shortcut for 'alt' plus '-' = <-
a

# Note :: variable is on the left hand

# right-hand side to assignment

9 -> c
c
# Note :: variable is on the right hand

9 = c
c
# Error in 9 = c : invalid (do_set) left-hand side to assignment
## ------------------------------------------------------------------------
## naming rules

x = 10
X  # Error: object 'X' not found
## ------------------------------------------------------------------------
## R is case sensitive

Z = "ExcelR"
Z

Y = 'Data Science'
Y

# When working with strings quotes can be either single or double

# clear console shortcut --> ctrl + l

credit_card_score = 4.89
credit_card_score

credit.card.score = 4.89
credit.card.score

creditcardscore = 4.89
creditcardscore

# credit card score = 4.89 # space not allowed in variable
# Error: unexpected symbol in "credit card"

1 = 'credit' # Error in 1 = "credit" : invalid (do_set) left-hand side to assignment

1 <- 'credit' # Error in 1 = "credit" : invalid (do_set) left-hand side to assignment

# 1.more = 3.67 # Error: unexpected symbol in "1.more"
# 1_more = 3.67 # Error: unexpected input in "1_"
# 1more = 3.67 # Error: unexpected symbol in "1more"

more1 = 3.9
more_1 = 3.9
more.1 = 3.9

# _x = 1 # Error: unexpected input in "_"

# @ = 8 # Error: unexpected '@' in "@"

x_ = 1
x_

# you can use dots(.) and underscore ( _ ), BUT not at the beginning
# you cannot start with a special characters in the name
# you can use numbers also in object/ variable names, BUT not at the beginning

## ------------------------------------------------------------------------
# Deleting variables

rm(x)# deleting x

x # Error: object 'x' not found

rm(Y, x_, creditcardscore)

rm(Y, x_, creditcardscore)

# Warning messages:
# 1: In rm(Y, x_, creditcardscore) : object 'Y' not found
# 2: In rm(Y, x_, creditcardscore) : object 'x_' not found
# 3: In rm(Y, x_, creditcardscore) : object 'creditcardscore' not found

######################################################
# Error - code is NOT run
# Warning -  Code is run
######################################################

ls() # print out all the variables in the environment

# rm(list = ls()) # deletes all the variables in the environment

