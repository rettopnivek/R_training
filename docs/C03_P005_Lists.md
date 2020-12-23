## Lists

The basic data structures in R revolve around vectors for a single data type. In other words, a vector can consist of all numeric values, or all character strings, but not a combination of both. However, the data sets we are interested in analyzing will naturally consist of a diverse set of data types, from numbers to character strings to more complex types like dates and times. R provides a more complicated data structure to allow users to store tables with these diverse data types, known as a __data frame__. However, to understand __data frames__, first we neen to understand __lists__, because just as matrices can be thought of as a collection of vectors, a __data frame__ in turn can be thought of as a collection of __lists__. The __list__ is a structure that allows storing different elements of any form (vectors, matrices, even other __lists__) together as a single object.

<a name="TOC"></a>
### Table of contents
1. <a href="#S01">Lists</a>
2. <a href="#S02">Indexing lists</a>
3. <a href="#S03">Working with lists</a>

<a href="#END">&#129147;</a>

<a name="S01"></a>
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

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S02"></a>
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

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S03"></a>
#### 3. Working with lists

Just as it is more complicated indexing lists because of disparate data types, the tools for working with lists (e.g., checking dimensions, adding or removing elements, converting elements, etc.) are also more complicated.

You can easily determine the number of elements stored in a list, but more advanced methods are required to extract the dimensions of those internal elements.
```R
# List with elements of differing lengths
lst <- list( 1:3, 'Hello', c( TRUE, FALSE ) )
length( lst ) # Returns 3
# Advanced methods needed to determine 
# internal length
sapply( lst, length )

# Nested list with differing number of elements across 
# and within levels
lst <- list( Level_1 = list( 1:3, 1:2, 1 ), Level_2 = list( 1 ) )
length( lst ) # Only returns number of outermost elements
sapply( lst, length ) # Returns number of nested lists
```

R provides flexible means of adding or removing elements to a list:
```R
lst <- list( 1:3 )
# Add new element
lst[[2]] <- c( 'Dog', 'Cat' )
# Add a named element
lst$Lgc <- TRUE
lst

# Remove an element to a list
lst[[2]] <- NULL
lst$Lgc <- NULL
lst
```

Lists cannot be easily converted into simpler data types, such as a vector. R therefore provides a function `unlist` that will extract all internal elements of a list, and arrange them into a vector using the most flexible data type present internally:
```R
# Initialize list
vec_1 <- 1:3
vec_2 <- c( 'Dog', 'Cat', 'Mouse' )
mat_1 <- matrix( 1:9, 3, 3 )
lst <- list( vec_1, vec_2, mat_1 )

# as.numeric( lst ) # Will not work, produces an error
vec <- unlist( lst ) # Converts into a vector
vec
# Of class character, because one the of elements 
# was a vector of character strings
```

The `unlist` function is an important tool, because R often will store complex data structures internally as a list, making it easy to accidentally try to use a function meant for vectors or matrices on a list object, resulting in an error message.

<a href="#TOC">&#129145;</a>

<a name="END"></a>
Return to:
[Foundations](C03_P000_Foundations.md)
[Sections](C00_P002_Chapters.md);
[Home page](https://rettopnivek.github.io/R_training/)

