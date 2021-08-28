## Working with vectors

The __atomic vector__ class in R allows for storing multiple values in a single variable. Users then have a variety of options for what they can do with this vector, from extracting a subset of values from the vector, performing mathematical operations on the vector, or summarizing the contents of the vector in different ways. I provide a variety of examples of operations a user can perform on a simple atomic vector in R in this section.

Note that indexing in R is very flexible, but sometimes unintuitive, and can produce unintended results without any error messages or warnings.

<a name="TOC"></a>
### Table of contents
  
1. <a href="#S01">Extracting a subset of values</a>
2. <a href="#S02">Conditional indexing</a>
3. <a href="#S03">Incorrect indexing</a>

<a href="#END">&#129147;</a>

<a name="S01"></a>
#### 1. Extracting a subset of values

R provides a special operator function `[` (i.e., square brackets) to extract specific elements from a vector. This is also known as 'indexing' a vector:
```R
# Define example vector
vec <- c( 1, 2, 5, 100 )
# Extract 1st element in the vector
vec[1]
#> [1] 1
# Extract 2nd element in the vector
vec[2]
#> [1] 2
```

The `[` function can be combined with the `c` function and `:` operator to extract a range of values:
```R
# Define example vector
vec <- c( 1, 2, 5, 10, 100 )
# Extract first 3 elements
vec[1:3]
#> [1] 1 2 5
# Extract 4th and 5th elements
vec[4:5]
#> [1]  10 100
# Extract 1st, 3rd, and 5th elements
vec[ c( 1, 3, 5 ) ]
#> [1]   1   5 100
# Define vector for indexing purposes
index <- c( 1, 3, 5 )
vec[ index ]
#> [1]   1   5 100
```

In a more complicated example, one can label each element in a vector, and then use the labels to extract specific elements:
```R
# Create a vector with named/labeled elements
number_of_pets <- c( 
  'Dogs' = 2, 'Ferrets' = 1, 'Fish' = 2
)
number_of_pets['Dogs']
#> Dogs 
#>    2 
number_of_pets[ c( 'Dogs', 'Fish' ) ]
#> Dogs Fish 
#>    2    2
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S02"></a>
#### 2. Conditional indexing

Users can use conditional logic to isolate a subset of a vector that match desired conditions:
```R
# Range of values
vec <- -2:2
# Only values above 0
vec[ vec > 0 ]
#> [1] 1 2
# Only values less than or equal to 0
vec[ vec <= 0 ]
#> [1] -2 -1  0
# Values greater than 1 OR less than 1
vec[ ( vec > 1 ) | ( vec < -1 ) ]
#> [1] -2  2
# For complex conditional statements, 
# it can help to define a logical 
# vector for indexing purposes
sel <- 
  vec > 1 |
  vec < -1
vec[sel]
#> [1] -2  2
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S03"></a>
#### 3. Incorrect indexing

Incorrectly indexing a vector will not necessarily result in an error message:
```R
vec <- c( 'Dogs' = 2, 'Cats' = 2, 'Fish' = 0 )
# Does not produce an error, returns a 
# missing value symbol instead
vec[4]
#> <NA> 
#>   NA 
vec['Ducks']
#> <NA> 
#>   NA 
# Similar result for non-labeled vector
vec <- 1:3
vec[4]
#> [1] NA
vec['Ducks']
#> [1] NA
# Passing a missing value as an index 
# results in strange behavior
vec[NA]
#> [1] NA NA NA
```

<a href="#TOC">&#129145;</a>

<a name="END"></a>
Return to:
[Foundations](C03_P000_Foundations.md);
[Sections](C00_P002_Chapters.md);
[Home page](https://rettopnivek.github.io/R_training/)


