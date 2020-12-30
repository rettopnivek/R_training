## Data Frames

__Data frames__ are the standard structure in which you will see most data stored for analytic purposes (e.g., data loaded from an Excel spreadsheet). A __data frame__ is a special type of nested list structure. Specifically, a __data frame__ is a list of vectors of matching length. Because it is a list, the vectors can be of different data types (e.g., numbers, characters, or logical values). However, because the vectors are of matching length, in many ways the data frame can be treated like a matrix, allowing more flexible indexing options compared to a standard list.

<a name="TOC"></a>
### Table of contents
1. <a href="#S01">Creating data frames</a>
2. <a href="#S02">Factors</a>
3. <a href="#S03">Indexing data frames</a>

<a href="#END">&#129147;</a>

<a name="S01"></a>
#### 1. Creating data frames

Creating a data frames typically requires a little more thought. When creating a data frame, rather then specifying the number of rows and columns you want (and some default values to initially fill out those rows and columns), you instead have to specify each column separately, providing a column name and an initial value:
```R
# Want a data frame with 
# 3 columns, one for numbers,
# one for character strings, 
# one for logical values
df <- data.frame(
  NMB = rep( 1:3, each = 3 ),
  CHR = rep( c( 'Cat', 'Dog', 'Mouse' ), 3 ),
  LGC = TRUE
)
```

*Note: Notice that for the final column with logical values, rather then specifying 9 values (as we did with the other two columns), here we specified a single value. Fortunately, R will automatically repeat this value to match the lengths of the other columns.*

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S02"></a>
#### 2. Factors

Unfortunately, there is a nuance in creating data frames with character strings. By default, R will actually convert a column with character strings into a different data type, a unique R data type known as a __factor__. A __factor__ can be thought of a hybrid between character strings and integer data types. Specifically, R determines the unique number of character strings (or 'levels'), and then assigns an integer value to each unique string. Therefore, internally, a __factor__ consists of a vector of integers, but R knows that each integer value is linked to a specific string.

Care is needed when working with factors, because they work differently compared to both integers (the internal representation closest to a factor) and character strings (what a factor presents as). For example, here is an example of a potential pitfall when representing elements as a factor, rather than a character vector:
```R
# Create a character vector of numbers
num_as_str <- c( '100', '10', '1' )
# R can correctly convert these strings to numbers
as.numeric( num_as_str )
# Convert character vector to factor
num_as_fac <- as.factor( num_as_str )
# Conversion no longer works as expected
as.numeric( num_as_fac )
# Must first convert to character, then to number
as.numeric( as.character( num_as_fac ) )
```

Factors also only want users to replace values in the factor that correspond to one of the levels defined in the factor:
```R
# Character vector
vec <- c( 'Cats', 'Kittens', 'Felines' )
# Can easily replace one element with 
# a different character string
vec[3] <- 'Dog'
# Create factor
vec <- as.factor( c( 'Dog', 'Puppy', 'Canine' ) )
# Attempting to add new character string 
# results in strange behavior
vec[3] <- 'Cat' # Produces a warning and leads to missing data
```

Because R by default converts character vectors to factors when creating data frames, users must be careful and understand how factors are representing the raw data. Some common issues you might come across are:
* Dates intended to be represented as strings instead are converted to factors;
* A typo in a column converts a numeric column into a factor, with subsequent conversions resulting in incorrect numeric values.
* Trying to add new data to a column can produce errors or missing data due to factors only considering currently defined levels.

While factors have their uses, in general I recommend avoiding this data type and using character vectors instead. Fortunately, 
there is an argument that will override R's default behavior when creating data frames:

Creating a data frames typically requires a little more thought. When creating a data frame, rather then specifying the number of rows and columns you want (and some default values to initially fill out those rows and columns), you instead have to specify each column separately, providing a column name and an initial value:
```R
# Want a data frame with 
# 3 columns, one for numbers,
# one for character strings, 
# one for logical values
df <- data.frame(
  NMB = rep( 1:3, each = 3 ),
  CHR = rep( c( 'Cat', 'Dog', 'Mouse' ), 3 ),
  LGC = TRUE,
  # Override conversion of strings to factors
  stringsAsFactors = F
)
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S03"></a>
#### 3. Indexing data frames

There is a great deal of flexibility in accessing elements from data frames, along with some important nuances to consider.

First, you can access individual elements in a data frame in the same way you access elements in a matrix, and also in the same way you access internal elements from a list:
```R
# Example data frame
df <- data.frame(
  Col1 = 1:3,
  Col2 = 4:6
)
# Access element in row 1, column 2
# using method for indexing matrices
df[ 1, 2 ]
# Access element in row 1, column 2
# using method for indexing values within a list
df[[2]][ 1 ]
df$Col2[ 1 ] # Named list approach
```

Similar logic applies to accessing columns:
```R
# Example data frame
df <- data.frame(
  Col1 = 1:3,
  Col2 = 4:6
)
# Access column 1
# using method for indexing matrices
df[ , 1 ]
# Access column 1
# using method for indexing list
df[[1]]
df$Col1 # Named list approach
```

Again, one can index a data frame with a sequence of integers as well:
```R
# Example data frame
df <- data.frame(
  Col1 = 1:3,
  Col2 = 4:6
)
# Access first two rows of column 1
# using method for indexing matrices
df[ 1:2 , 1 ]
# Access first two rows of column 1
# using method for indexing list
df[[1]][ 1:2 ]
df$Col1[ 1:2 ] # Named list approach
```

Because a data frame is a list of vectors, different data types are preserved across columns:
```R
# Example data frame
df <- data.frame(
  Col1 = 1:3,
  Col2 = TRUE
)
# Extract column 1
vec <- df$Col1
# Vector is of class 'numeric'
is.numeric( vec ) # TRUE
# Extract column 2
vec <- df$Col2
# Vector is of class 'logical'
is.logical( vec ) # TRUE
```

However, things are more complicated when accessing rows. Pulling out a single row does not return a vector (in contrast to a matrix). Instead, even though it is a single row, R still treats it as a list, specifically a data frame. One must convert the row using the `unlist` command.
```R
# Example data frame 
# with two numeric columns
df <- data.frame(
  Col1 = 1:3,
  Col2 = 4:6
)
# Access first row
df[1,]
# Save row
vec <- df[1,]
is.vector( vec ) # FALSE
is.list( vec ) # TRUE
# Convert to vector
is.vector( unlist( vec ) ) # TRUE
```

<a href="#TOC">&#129145;</a>

<a name="END"></a>
Return to:
[Foundations](C03_P000_Foundations.md);
[Sections](C00_P002_Chapters.md);
[Home page](https://rettopnivek.github.io/R_training/)


