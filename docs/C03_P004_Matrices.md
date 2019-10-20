## Matrices

Just as a vector is a set of multiple values, a matrix is a set of multiple vectors. Matrices consist of rows and columns of a single data type. Because of this, they are most useful for underlying mathematical operations rather than storing raw data. When creating new data or expanding an existing set of data, matrices can also be a useful starting point thanks to convenient functions for initializing a new matrix. Furthermore, R's approach for indexing, summarizing, and manipulating matrices can be extended to the more complex data structures better suited for storing raw data.

### Table of contents
  
1. Creating matrices
2. Matrix dimensions
3. Indexing matrices

#### 1. Creating matrices

```R
# Creating a matrix of zeros with J rows and I columns
J <- 3; I <- 3
M <- matrix( 0, J, I )
M

# Matrices can be initialized with a vector of values
M <- matrix( 1:9, 3, 3 )
M

# A vector with fewer values than available in 
# the matrix is copied multiple times
M <- matrix( 1:3, 3, 3 )
M # Note matrix is filled COLUMNS first

# Can specify to fill ROWS first as well
M <- matrix( 1:3, 3, 3, byrow = TRUE )
M

# Matrices can consist of characters or logical values as well
M <- matrix( 'Hello', 2, 2 )
M
M <- matrix( FALSE, 2, 2 )
M
```

#### 2. Matrix dimensions

R provides a number of convenience functions for determining the dimensions of matrices:
```R
M <- matrix( 1:4, 4, 2 )
nrow( M ) # Number of rows
ncol( M ) # Number of columns
dim( M ) # Number of rows and columns
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

# Adding rows
M <- matrix( 5:8, 4, 1 )
# Add new rows to bottom
M <- rbind( M, 9:12 )
# Add new rows to top
M <- rbind( M, 1:4 )

# Multiple columns or rows can be added at once
M <- matrix( 4:6, 3, 1 )
M <- cbind( 1:3, M, 7:9 )
M
```

#### 3. Indexing matrices

Extracting values from a matrix is similar to extracting values from a vector, but is complicated by the two-dimensional nature of matrices. Like vectors, the standard operator for indexing a matrix is `[`, but additional consideration is needed for R to know both the rows and columns from which to subset data. The general format to index a matrix involves telling R the row followed by the column, separated by a comma:
```R
# Example matrix
M <- matrix( 1:9, 3, 3 )
# Access element in first row and first column
M[ 1, 1 ]
# Access element in third row and second column
M[ 3, 2 ]
```

Note that if you do not include the comma, R internally converts the matrix to a vector, and will still return a value. However, it can be unintuitive to determine which value R will return. By default, R stacks the columns on top of each other:
```R
M <- matrix( 1:8, 4, 2 )
M[1] # Works, returns element in [1,1]
# Works, returns element in [1,2]
# the fifth value after stacking 
# first column on top of second column
M[5]
# If fill by rows, position [1,2] 
# now has a different value
M <- matrix( 1:8, 4, 2, byrow = T )
M[5]
```

To get R to return an entire row or column, you can not include a row or column number, respectively:
```R
M <- matrix( 1:9, 3, 3 )
# Returns third column
M[, 3 ]
# Returns second row
M[ 2,  ]
# White space does not matter
M[1,]
M[2, ]
M[  ,  3 ]
```

Like vectors, you can index matrices using a sequence of integers:
```R
M <- matrix( 1:4, 4, 2 )
# First two rows
M[ 1:2, ]
# First and last row
M[ c( 1, 4 ), ]
```

As before, you can also index matrices using conditional statements, though you need to carefully consider over what dimensions you are applying a conditional statement:
```R
M <- matrix( 1:10, 2, 5, byrow = T )
# Show only columns in which first row
# is greater than 3
sel <- M[1,] > 3
M[,sel]
# However, M[sel,] does not work, returns an error
```


