## Working with vectors

The __atomic vector__ class in R allows for storing multiple values in a single variable. Users then have a variety of options for what they can do with this vector, from extracting a subset of values from the vector, performing mathematical operations on the vector, or summarizing the contents of the vector in different ways. I provide a variety of examples of operations a user can perform on a simple atomic vector in R in this section.

Note that indexing in R is very flexible, but sometimes unintuitive, and can produce unintended results without any error messages or warnings.

### Table of contents
  
1. Extracting a subset of values
2. Conditional indexing
3. Incorrect indexing

#### 1. Extracting a subset of values

R provides a special operator function `[` (i.e., square brackets) to extract specific elements from a vector. This is also known as 'indexing' a vector:
```R
# Define example vector
vec <- c( 1, 2, 5, 100 )
# Extract 1st element in the vector
vec[1]
# Extract 2nd element in the vector
vec[2]
```

The `[` function can be combined with the `c` function and `:` operator to extract a range of values:
```R
# Define example vector
vec <- c( 1, 2, 5, 100 )
# Extract first 3 elements
vec[1:3]
# Extract 4th and 5th elements
vec[4:5]
# Extract 1st, 3rd, and 5th elements
vec[ c( 1, 3, 5 ) ]
# Define vector for indexing purposes
index <- c( 1, 3, 5 )
vec[ index ]
```

In a more complicated example, one can label each element in a vector, and then use the labels to extract specific elements:
```R
# Create a vector with named/labeled elements
number_of_pets = c( 'Dogs' = 2, 'Ferrets' = 1, 'Fish' = 2 )
number_of_pets['Dogs']
number_of_pets[ c( 'Dogs', 'Fish' ) ]
```

#### 2. Conditional indexing

Users can use conditional logic to isolate a subset of a vector that match desired conditions:
```R
vec <- -2:2 # Range of values
vec[ vec > 0 ] # Only values above 0
vec[ vec <= 0 ] # Only values less than or equal to 0
vec[ ( vec > 1 ) | ( vec < -1 ) ] # Values greater than 1 OR less than 1
# For complex conditional statements, it can help to define a logical 
# vector for indexing purposes
sel = 
  vec > 1 |
  vec < -1
vec[sel]
```

#### 3. Incorrect indexing

Incorrectly indexing a vector will not necessarily result in an error message:
```R
vec <- c( 'Dogs' = 2, 'Cats' = 2, 'Fish' = 0 )
vec[4]       # Does not produce an error, returns a missing value symbol instead
vec['Ducks']
vec = 1:3    # Similar result for non-labeled vector
vec[4]
vec['Ducks']
# Passing a missing value as an index results in strange behavior
vec[NA]
```
[Return to sections](C00_P002_Chapters.md)

