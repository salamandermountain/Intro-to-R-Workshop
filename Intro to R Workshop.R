#### Introduction to R, Github, and Reproducible Science ####
#### Ecology Center Workshops Spring 2022 ####

# I'm hoping to spend ~1 hr on R, ~1 hr on git. I'd like to help you guys through 
# the git installation, because it can be annoying. But if we run out of time, I 
# will walk you through the git basics on my machine and work on installation at the end.
# It's pretty intuitive. I will also be sharing all the materials I work through today
# after the workshop. And you have my email, if you ever need help down the road,
# feel free to reach out. 

# How many people have used R before? ----

# Most people have heard of it because it is a really useful tool 
# for statistical analysis. And, consequently, we usually learn it 
# in the context of doing statistics. But this can be a bit of an 
# information overload, and is completely backwards from how programming 
# is usually taught. We wind up learning how to run whatever analyses we 
# need to run, but missing out on basic fundamentals. And this can hinder 
# solving new problems. 90% of the time when an analysis won't run, it isn't 
# a statistics problem, but a programming problem (i.e. the data isn't 
# assigned the right data type, the data is being indexed wrong, etc.) 
# And knowing how to program can also help you design your database structure 
# properly on the front end so that it will be easy to work with later. 
# So the goal of this course is to help you guys develop some basic 
# programming skills, separate from any kind of analyses.

### What is R? ----

# R is both the name of the language and the software used for data storage and manipulation.
# RStudio is the interface. 

### When you first open RStudio, you will be greeted by three panels:

# - The interactive R console (entire left)
# - Environment/History (tabbed in upper right)
# - Files/Plots/Packages/Help/Viewer (tabbed in lower right)
      # - "Files" shows all the files in the folder/directory you are working in
      #      You can set a working directory with the setwd() function. Or, you can navigate to 
      #      the appropriate folder in the Files tab, then go to the "More" option in the files tab,
      #      and select "set as working directory." A "working directory" is essentially the folder
      #      that R is reading data from/putting output into.
      # - "Plots" displays plots you generate
      # - "Packages" displays any packages you have downloaded and installed in R. 
      #     If there is a checkmark next to a package, it means you've loaded it into your current R session
      # - "Help" will show you the description of functions. To get a function description, 
      #     simply run ?<insert function>. for example: 
              ?setwd() 
      #     will show me the documentation for the setwd() function
# - Once you open files, such as R scripts, an editor panel will also open in the top left.

### We’re going to create a new project in RStudio:

# 1. Click the “File” menu button, then “New Project”.
# 2. Click “New Directory”.
# 3. Click “Empty Project”.
# 4. Type in “r-intro” as the name of the directory.
# 5. Click the “Create Project” button.

# Every time you open this project our working directory will always be set to the 
# folder `r-intro`! Projects are useful because you won't have to setwd() every time, 
# as long as you are working in the project.

### Use R as a calculator ---- 

# SWITCH TO LAPTOP NOW

# Remember, order of operations matters--the order is the same as you 
# would have learned back in school:
  
#  From highest to lowest precedence:
  
# - Parentheses: `(`, `)`
# - Exponents: `^` or `**`
# - Divide: `/`
# - Multiply: `*`
# - Add: `+`
# - Subtract: `-`

1 + 100
3 + 5 * 2
(3 + 5) * 2 # text after each code line is called a "comment"; R ignores anything that follows the # mark
2/10000 
2^3

### Use R to compare things ----

1 == 9  # equality (note two equals signs, read as "is equal to")
1 != 1  # inequality (read as "is not equal to")
1 < 2  # less than
1 <= 1  # less than or equal to

### Use R to assign objects ----

# R is an object-based language. And object is just data with attributes 
# associated with it. The data can be pretty much anything, while the attributes
# tell R how to read the data.

x <- 1/40
x
x <- 24 # variables can easily be re-assigned/over-written
y <- x * 2

rm(y) # you can remove objects from the environment

# Variable names can contain letters, numbers, underscores and periods. 
# They CANNOT start with a number OR contain spaces (**at all**). 
# A few different conventions for longer variable names:

# - periods.between.words
# - underscores_between_words
# - camelCaseToSeparateWords

# Your choice of convention is up to , *JUST BE CONSISTENT*.

### Data Types (Modes) ----

# There are 6 main types: `numeric`, `integer`, `complex`, `logical`, `character`, and `factor`.

class(3.14) # numeric: any real number
class(1L) # integer: any integer. The L suffix forces the number to be an integer
class(1+1i) # complex: stores numbers with an imaginary component (imaginary numbers have 'i' in them)
class(TRUE) # logical: binary TRUE or FALSE 
class('1') # character: words; "" denote words
class(factor("1a")) # factor: denotes categorical variables, they can be words or numbers

# You can coerce to a desired data type, as long as they follow the rules
# using the functions as.<desired data type>()

a <- 45
class(a)
a <- as.integer(a)
class(a)

b <- "banana"
class(b)
b <- as.numeric(b)

# 80% of the time when something isn't running, it's because the data isn't the right type.
# All columns in a data frame have to be the same type

### Vectors, Lists and Dataframes - (Data Storage Classes) ----

# Remember earlier when we talked about objects as data with attributes? 
# Well there are many different ways to store data. 

# A vector in R is essentially an ordered set of things, of the same basic 
# data type. Each 'thing' in the vector is called an element. If you don’t 
# choose the data type, it’ll default to logical; or, you can declare an 
# empty vector of whatever type you like. You can also make vectors with 
# explicit contents using the combine function `c()`.

my_vector <- vector(length = 3)
my_vector
another_vector <- vector(mode = 'character', length = 3)
another_vector
combine_vector <- c(2, "banana", TRUE)
combine_vector

# The combine function `c()` will also append an existing vector...

ab <- c('a', 'b')
ab
c <- c(ab, 'DC', "EF")
c

# Or we can make a series of numbers...

my_series <- 1:10 # just inegers
my_series
my_seq <- seq(1,10, by = 0.1) #more specific values
my_seq

# So now that we’ve created a dummy vector to play with, how do we get at 
# its contents?
# To extract elements of a vector we can give their corresponding index
# (square brackets are used for indexing)

# starting from one:
ab[1]
my_series[4]
my_seq[c(2:4)]

# We can extract elements by using their name, instead of extracting by index:
  # names are another attribute that you can give to data
  # they are often useful so that you don't have to type out a lot of numbers
  # and because they are 
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c("a", "b", "c", "d", "e")
x <- c(a = 5.4, b = 6.2, c = 7.1, d = 4.8, e = 7.5) # we can also name a vector 'on the fly'
x[c("a", "c")]

# Since comparison operators (e.g. >, <, ==) evaluate to logical vectors, 
# we can also use them to succinctly subset vectors: the following statement 
# gives the same result as the previous one.

x[x > 7] # this statement first evaluates x>7, generating a logical vector 
# c(FALSE, FALSE, TRUE, FALSE, TRUE), and then selects the elements of x 
# corresponding to the TRUE values.

# We can use == to mimic the previous method of indexing by name 
# (remember you have to use == rather than = for comparisons):
x[names(x) == "a"]

# If we use a negative number as the index of a vector, R will return every element except for the one specified:
x[-2]
# we can skip multiple elements
x[c(-1, -5)]  # or 
x[-c(1,5)]
# a common mistake would be to ask R
 x[-1:3] # But remember the order of operations. 
# : is really a function. It takes its first argument as -1, 
# and its second as 3, so generates the sequence of 
# numbers: c(-1, 0, 1, 2, 3).
x[-(1:3)]
# To remove elements from a vector, we need to assign the result 
# back into the variable:
x <- x[-4]
x

# A list in R is essentially an object with data that can be in
# different data types/modes.

my_list <- list(1, "banana", TRUE)
my_list
big_list <- list(ab, my_seq)
big_list

# The '$' is called the operator, and it is used for indexing named 
# elements in a list.

names(my_list) <- c("x", "y", "z")
my_list$x

# If you wanted to index a specific element in the list, you could also 
# use brackets
big_list[[2]][2]

# A data.frame in R is a ~like~ a list but with the constraints that:

# (1) all list elements are vectors (i.e. they have 1 mode), 
# (2) all vectors have the same length
# (3) all columns (the list elements) have names

# Essentially, imagine each column in the dataframe as a vector, and the dataframe
# is just a big list of all those vectors. Unlike actual lists however, in dataframes
# all of the columns/vectors MUST be the same length and have names.

# Let's download some data and look at a dataframe

download.file("https://raw.githubusercontent.com/datacarpentry/r-intro-geospatial/master/_episodes_rmd/data/gapminder_data.csv",
              destfile = "/Users/courtney/Desktop/Intro to R Workshop/gapminder_data.csv")

gapminder <- read.csv("/Users/courtney/Desktop/Classes/EC Workshops/Intro to R Workshop/gapminder_data.csv")

# If we look at the data, we can see that each column is a specific data type,
# and we can index it with the operator.

gapminder$country
gapminder$country[1]

# Similarly, [[ will act to extract a single column:
gapminder[["lifeExp"]][1]

# We could also use brackets to index specific elements of the dataframe
gapminder[1,2] # [rows, columns]
gapminder[1,1:6]
gapminder[1:6,5]
gapminder[1:6,1:6]
gapminder[,1:3]

# You can coerce lists to data.frames, assuming they follow the dataframe rules
test.list <- list(1, "banana", TRUE)
class(test.list)
my_seq <- as.data.frame(test.list)
class(my_seq)

# R is a natively vectorized language. Meaning it automatically performs 
# vector operations. All of this starts to make sense if you're having trouble 
# subsetting with $ or even [] or [[]].

### Exploring Data Frames ----

# Let's check out the data! Data exploration is one of the most important 
# parts of working in R--and it's the first thing you should always do when 
# looking at new data!

str(gapminder) # str() shows us the structure of the data, 
                # including the data mode, the dimensions of the dataframe, 
                # and a few observations

length(gapminder) # gives the number of columns
nrow(gapminder) # to get the number of rows
ncol(gapminder) # number of columns
dim(gapminder) # or both at once, dim()
colnames(gapminder) # names of the columns

head(gapminder) # gives first 6 rows of data

# It's a good time to ask ourselves when the 
# structure R is reporting matches our intuitions: 
# does the data type for each column make sense? 
# If not, we need to sort out those issues now so we 
# don't run into issues down the road. Once we're happy 
# with our data types, we can really start digging into 
# our data!

# we can also examine individual columns 

class(gapminder$year) 
class(gapminder$country)
str(gapminder$country)

### Data Frame Manipulation ---

# Let's create a new column to hold information on whether 
# life expectancy is below the world average (70.5), or above:

below_average <- gapminder$lifeExp < 70.5
head(gapminder)

# we've simply created a vector with TRUE/FALSE values; but we can add 
# this to our dataframe using

gapminder <- cbind(gapminder, below_average)
head(cbind(gapminder, below_average))
head(gapminder)

# note that if we try to add a vector of below_average with a 
# different number of entries than the number of rows in our dataframe, 
# it would fail:

below_average <- c(TRUE, TRUE, TRUE, TRUE, TRUE)
head(cbind(gapminder, below_average))

# The sequence TRUE,TRUE,FALSE is repeated over all the gapminder rows.
# Let’s overwite the content of gapminder with our new data frame.

below_average <-  as.logical(gapminder$lifeExp<70.5)
gapminder <- cbind(gapminder, below_average)

# how about adding rows?
new_row <- list('Norway', 2016, 5000000, 'Nordic', 80.3, 49400.0, FALSE) 
# note that we have to make the row a list, since each column has a different data type
gapminder_norway <- rbind(gapminder, new_row)
tail(gapminder_norway) # lets you look at the last 6 lines of data

### Installing Packages ---

# Sometimes you will need/want to use tools that are not built into
# the baseR code. You can download these tools from R repositories as 
# 'packages'

install.packages("tidyverse") # install a new package
library(tidyverse) # call a package you previously downloaded

# If there are functions with the same name in 2 different packages, R will 
# arbitrarily mask one of them. To get around this, simply specify which package
# you intend to use the function from. For example, the 'filter' function exists in
# both tidyverse and dplyr. If I specifically want to use the tidyverse version, 
# I could run
dplyr::filter()
# Most packages have a documentation page that you can google if you don't understand 
# how it works.

# Never be afraid to google if you run into trouble! The website 'stackoverflow' is your friend.
