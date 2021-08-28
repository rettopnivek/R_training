## Matrices

Just as a vector is a set of multiple values, a matrix is a set of multiple vectors. Matrices consist of rows and columns of a single data type. Because of this, they are most useful for underlying mathematical operations rather than storing raw data. When creating new data or expanding an existing set of data, matrices can also be a useful starting point thanks to convenient functions for initializing a new matrix. Furthermore, R's approach for indexing, summarizing, and manipulating matrices can be extended to the more complex data structures better suited for storing raw data.

<a name="TOC"></a>
### Table of contents
1. <a href="#S01">Creating matrices</a>
2. <a href="#S02">Matrix dimensions</a>
3. <a href="#S03">Indexing matrices</a>

<a href="#END">&#129147;</a>

<a name="S01"></a>
#### 1. Creating matrices

```R
# Creating a matrix of zeros with J rows and I columns
J <- 3; I <- 3
M <- matrix( 0, J, I )
M
#>      [,1] [,2] [,3]
#> [1,]    0    0    0
#> [2,]    0    0    0
#> [3,]    0    0    0

# Matrices can be initialized with a vector of values
M <- matrix( 1:9, 3, 3 )
M
#>      [,1] [,2] [,3]
#> [1,]    1    4    7
#> [2,]    2    5    8
#> [3,]    3    6    9

# A vector with fewer values than available in 
# the matrix is copied multiple times
M <- matrix( 1:3, 3, 3 )
M # Note matrix is filled COLUMNS first
#>      [,1] [,2] [,3]
#> [1,]    1    1    1
#> [2,]    2    2    2
#> [3,]    3    3    3

# Can specify to fill ROWS first as well
M <- matrix( 1:3, 3, 3, byrow = TRUE )
M
#>      [,1] [,2] [,3]
#> [1,]    1    2    3
#> [2,]    1    2    3
#> [3,]    1    2    3

# Matrices can consist of characters or 
# logical values as well
M <- matrix( 'Hello', 2, 2 )
M
#>      [,1]    [,2]   
#> [1,] "Hello" "Hello"
#> [2,] "Hello" "Hello"
M <- matrix( FALSE, 2, 2 )
M
#>       [,1]  [,2]
#> [1,] FALSE FALSE
#> [2,] FALSE FALSE
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S02"></a>
#### 2. Matrix dimensions

R provides a number of convenience functions for determining the dimensions of matrices:
```R
M <- matrix( 1:4, 4, 2 )
nrow( M ) # Number of rows
#> [1] 4
ncol( M ) # Number of columns
#> [1] 2
dim( M ) # Number of rows and columns
#> [1] 4 2
```

R also provides functions to add new rows or columns to an existing matrix:
```R
# Adding columns
M <- matrix( 4:6, 3, 1 )
# Add new column on right
M <- cbind( M, 7:9 )
# Add new column on left
M <- cbind( 1:3, M )
M
#>      [,1] [,2] [,3]
#> [1,]    1    4    7
#> [2,]    2    5    8
#> [3,]    3    6    9

# Adding rows
M <- matrix( 5:8, 1, 4 )
# Add new rows to bottom
M <- rbind( M, 9:12 )
# Add new rows to top
M <- rbind( 1:4, M )
M
#>      [,1] [,2] [,3] [,4]
#> [1,]    1    2    3    4
#> [2,]    5    6    7    8
#> [3,]    9   10   11   12

# Multiple columns or rows can be added at once
M <- matrix( 4:6, 3, 1 )
M <- cbind( 1:3, M, 7:9 )
M
#>      [,1] [,2] [,3]
#> [1,]    1    4    7
#> [2,]    2    5    8
#> [3,]    3    6    9
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S03"></a>
#### 3. Indexing matrices

Extracting values from a matrix is similar to extracting values from a vector, but is complicated by the two-dimensional nature of matrices. Like vectors, the standard operator for indexing a matrix is `[`, but additional consideration is needed for R to know both the rows and columns from which to subset data. The general format to index a matrix involves telling R the row followed by the column, separated by a comma:
```R
# Example matrix
M <- matrix( 1:9, 3, 3 )
# Access element in first row and first column
M[1, 1]
#> [1] 1
# Access element in third row and second column
M[3, 2]
#> [1] 6
```

Note that if you do not include the comma, R internally converts the matrix to a vector, and will still return a value. However, it can be unintuitive to determine which value R will return. By default, R stacks the columns on top of each other:
```R
M <- matrix( 1:8, 4, 2 )
M[1] # Works, returns element in [1,1]
#> [1] 1
# Works, returns element in [1,2]
# the fifth value after stacking 
# first column on top of second column
M[5]
#> [1] 5
# If fill by rows, position [1,2] 
# now has a different value
M <- matrix( 1:8, 4, 2, byrow = T )
M[5]
#> [1] 2
```

To get R to return an entire row or column, you can not include a row or column number, respectively:
```R
M <- matrix( 1:9, 3, 3 )
# Returns third column
M[, 3]
#> [1] 7 8 9
# Returns second row
M[2, ]
#> [1] 2 5 8
# White space does not matter
M[1, ]
#> [1] 1 4 7
M[2, ]
#> [1] 2 5 8
M[, 3]
#> [1] 7 8 9
```

Like vectors, you can index matrices using a sequence of integers:
```R
M <- matrix( 1:4, 4, 2 )
# First two rows
M[1:2, ]
#>      [,1] [,2]
#> [1,]    1    1
#> [2,]    2    2
# First and last row
M[ c( 1, 4 ), ]
#>      [,1] [,2]
#> [1,]    1    1
#> [2,]    4    4
```

As before, you can also index matrices using conditional statements, though you need to carefully consider over what dimensions you are applying a conditional statement:
```R
M <- matrix( 1:10, 2, 5, byrow = T )
# Show only columns in which first row
# is greater than 3
sel <- M[1, ] > 3
M[, sel]
#>      [,1] [,2]
#> [1,]    4    5
#> [2,]    9   10
# However, M[sel, ] does not work, returns an error
M[sel, ]
#> Error in M[sel, ] : (subscript) logical subscript 
#> too long
```

<a href="#TOC">&#129145;</a>

<a name="END"></a>
Return to:
[Foundations](C03_P000_Foundations.md);
[Sections](C00_P002_Chapters.md);
[Home page](https://rettopnivek.github.io/R_training/)

