## The 'dplyr' R package

Over the years, a large number of data scientists have made significant extensions to R to help make it easier to use for applied researchers. At the forefront of this is a large suite of R packages developed primarily by Hadley Wickham, which now go by the name 'tidyverse'. Because Hadley Wickham now works for the company behind RStudio, this RStudio has very nice integration with these packages and vice versa.

In this section, I focus on the package 'dplyr', which provides powerful tools for manipulating data frames. Processing data frames to prep data for analyses can be a time-consuming and complicated process, resulting in dense code. The package 'dplyr' can make this code much more readible, via intuitive function names and a special operator, '%>%' (the pipe operator), which enables stringing together several function calls in an interptable way.

The 'dplyr' package provides tools to for common data manipulation operations, including selecting specific columns, filtering and arranging rows, and renaming variables, among others. There are many online resources for learning how to use 'dplyr', such as this  [vignette](https://cran.r-project.org/web/packages/dplyr/vignettes/dplyr.html).

### Table of contents
1. Prerequisites
2. The pipe operator
3. Basic functions for manipulating data frames
  3.1. Selecting columns via __select()__
  3.2. Filtering rows via __filter()__
  3.3. Reorder rows via __arrange()__
  3.4. Create new columns via __mutate()__

#### 1. Prerequisites

Below, I describe how to install and load 'dplyr', as well as how to get the data used as the running example in this section. 

```R
# Install the 'dplyr' package
install.packages( 'dplyr' )

# Load in the 'dplyr' package
library( dplyr )

# Example data

# URL for data (too long for single line)
url = paste0( 
  "https://raw.githubusercontent.com/genomicsclass/dagdata/",
  "master/inst/extdata/msleep_ggplot2.csv"
)
# Download data
df <- read.csv(
  file = url,
  header = T,
  stringsAsFactors = F
)
```

#### 2. The pipe operator

In R, to apply a function 'foo' to an object 'a', the command is `foo( a )`. The pipe operator allows you to re-arrange this command to be `a %>% foo`. For example:
```R
a <- c( 1, 2, 3 )
# Base R
sum( a )
# Via the pipe operator
a %>% sum
```
As seen above, the commands are equivalent.

Now suppose you need to string together a chain of commands operating on the same object, such as taking a character vector, converting it to a numeric vector, and then summing over the result:
```R
# Base R
a <- c( '1', '2', '3' )
step_1 <- as.numeric( a )
step_2 <- sum( step_1 )
print( step_2 )
```
In the above, I've broken the process into multiple steps, which while easily readable, involves the creation of several nuisance objects (the `step_1` and `step_2` variables). We can simplify this down to a single call:
```R
# Base R (Single call)
a <- c( '1', '2', '3' )
print( sum( as.numeric( a ) ) )
```
This is much more efficient, but less readable, as it can be confusing keeping track of what is being included in the different set of parantheses. This problem is only worse with more complex commands with more inputs.

The pipe operator, however, becomes especially useful when stringing a chain of commands together like above:
```R
# Via the pipe operator
a <- c( '1', '2', '3' )
a %>% as.numeric %>% sum %>% print
```
Rather then having to embed the object `a` in multiple sets of parantheses, we can use the pipe operator to pass the output of each step to the next step, maintaining the efficiency while ensuring the code is still easily readable. This can be quite helpful for processing data frames, as often you will want to run several commands on the same data set (e.g., first filtering out certain rows, then selecting a subset of columns, and finally renaming the columns for legibility).

#### 3. Basic functions for manipulating data frames

* __select()__: Select columns
* __filter()__: Filter rows
* __arrange()__: Re-order or arrange rows
* __mutate()__: Create new columns

*Note: Advanced content.*


