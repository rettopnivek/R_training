## Lists and Data Frames

The basic data structures in R revolve around vectors for a single data type. In other words, a vector can consist of all numeric values, or all character strings, but not a combination of both. However, the data sets we are interested in analyzing will naturally consist of a diverse set of data types, from numbers to character strings to more complex types like dates and times. R provides a more complicated data structure to allow users to store tables with these diverse data types, known as a __data frame__. Just as matrices can be thought of as a collection of vectors, a __data frame__ in turn can be thought of as a collection of __lists__. The __list__ is a structure that allows storing different elements of any form (vectors, matrices, even other __lists__) together as a single object. A __data frame__ is a specific combination of __lists__ that results in a structure like a matrix, but one that is much more flexible about data types.

### Table of contents
  
1. Lists
2. Indexing lists
3. Working with lists
4. Data frames
5. Indexing data frames

#### 1. Lists

Lists are a flexible structure in R that allow combining disparate data types and structures into a single object:
```R
# Store a character string and a number
lst <- list( 'Hello', 1 )
```

Lists can include more complicated data structures:
```R
vec_1 <- 1:3
vec_2 <- c( 'Dog', 'Cat', 'Mouse' )
mat_1 <- matrix( 1:9, 3, 3 )
lst <- list( vec_1, vec_2, mat_1 )
```

Lists can also store other lists, allowing for the creation of nested or hierarchical structures:
```R
lst_1 = list( 1:3 )
lst_2 = list( c( 'Dog', 'Cat', 'Mouse' ) )
lst <- list( Numbers = lst_1, Strings = lst_2 )
```

*Note: In the example above, we have created a 'named' list, by providing a label for each of the sub-lists. These labels can be used for indexing purposes.*

#### 2. Indexing lists

Extracting elements from a list can be more complicated than a vector or matrix, because of the internal separation of different data types. The most basic operator for indexing a list is the `[[` (double brackets) operator:
```R
lst <- list( 1, 'Cat', TRUE )
lst[[1]] # First element
lst[[3]] # Last element
```

A useful technique with lists is to label the elements being stored, to create the aforementioned 'named' list. By labeling the elements of the list, R provides more flexible indexing options. In particular, you can use a new type of indexing operator, the `$` (dollar sign), to extract named elements:
```
# Create named list
lst <- list( Nmb = 1:3, Str = c( 'Dog', 'Cat', 'Mouse' ), Lgc = TRUE )
lst[[ 'Str' ]] # Using '[[' operator
lst$Str # Using '$' operator
```

If you have stored a vector or matrix (As an example) in a list, once you access that element in the list, you can further index the vector or matrix in question:
```R
lst <- list( V = 1:4, M = matrix( 1:4, 2, 2 ) )

# Index vector
lst[[1]]; lst[['V']]; lst$V
# Index 2nd element in vector stored in list
lst[[1]][2]
lst[['V']][2]
lst$V[2]

# Index matrix
lst[[2]]; lst[['M']]; lst$M
# Index first row and second column
lst[[2]][1,2]
lst[['M']][1,2]
lst$M[1,2]
```

For nested lists, indexing can be strung together to access elements lower in the hierarchy:
```R
lst <- list( Level_1 = list( Level_2 = 1:3 ) )
# Access level 2 elements
lst[[1]][[1]]
lst$Level_1$Level_2
# Or a combination
lst$Level_1[[1]]
```

#### 3. Working with lists

#### 4. Data frames

Data frames are the standard structure in which you will see most data for analytic purposes (e.g., data loaded from an Excel spreadsheet). A spreadsheet is a special type of nested list structure. Specifically, a data frame is a list of vectors of matching length. Because it is a list, the vectors can be of different data types (e.g., numbers, characters, or logical values). However, because the vectors are of matching length, in many ways the data frame can be treated like a matrix, allowing more flexible indexing options compared to a standard list.

#### 5. Indexing data frames




