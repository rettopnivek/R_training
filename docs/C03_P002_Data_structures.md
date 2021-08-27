## Basic data structures in R

A simple way to think of R is that it consists of a workspace or environment that stores a variety of objects for you, and then it lets you work with and combine these objects in a variety of ways. However, the structure and type of these objects are diverse and complicated, and this is further complicated by extensions that add even more structures, and the fact that users can define their own custom structures and types.

In this section, we focus on on a set of 4 foundational objects in R, the 4 most commonly used __atomic vector__ types. See the [Data structures](http://adv-r.had.co.nz/Data-structures.html) chapter of Hadley Wickham's book for more in-depth details about these data types.

<a name="TOC"></a>
### Table of contents
  
1. <a href="#S01">Data types (Atomic vectors)</a>
2. <a href="#S02">Combining values into a vector</a>
3. <a href="#S03">Checking data types</a>
4. <a href="#S04">Converting between data types</a>
5. <a href="#S05">Advanced methods for creating vectors</a>

<a href="#END">&#129147;</a>

<a name="S01"></a>
#### 1. Data types (Atomic vectors)

The 4 most commonly used __atomic vector__ types are:
1. Integers (whole numbers, like -1 or 2);
2. Doubles (also called numerics, real or decimal valued numbers like 2.45);
3. Logicals (either `TRUE` or `FALSE`);
4. Characters (e.g., letters like 'A' or 'b', or strings of letters, like 'Hello');

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S02"></a>
#### 2. Combining values into a vector

A set of values of the same type can be combined (or concatenated) using the R function `c` and stored as a named multi-valued __atomic vector__:
```R
vec_of_int <- c( 1, 2, -3, 4 )
vec_of_dbl <- c( 0.5, -1.8 )
vec_of_lgc <- c( TRUE, FALSE, T, F )
# Note T and F are shorthand for TRUE and FALSE
vec_of_chr <- c( 'A', 'b', 'Hello' )
```

*Note: The function 'c' follows the standard procedure in R, in which you provide the function name followed by the list of values in parantheses to which you want to apply the function. The function 'c', however, provides a good example of how to pass multiple values to a function, by separating each value in the function by a comma.*

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S03"></a>
#### 3. Checking data types

It is useful to know how to check the type of vector stored in a workspace:
```R
vec <- c( 1.4, 2.1, 3.4 )
# Determine what the data type is
class( vec ) # More general
#> [1] "numeric"
typeof( vec ) # More specific
#> [1] "double"
# Details on type, dimensions, 
# and initial values
str( vec )
#> num [1:3] 1.4 2.1 3.4

# Tests whether a vector is of a particular type
is.numeric( vec )
#> [1] TRUE
is.double( vec )
#> [1] TRUE
is.integer( vec ) 
#> [1] FALSE
is.character( vec )
#> [1] FALSE
is.logical( vec )
#> [1] FALSE
is.integer( vec )
#> [1] FALSE
```

Note sometimes the data type can be non-intuitive:
```R
# Looks like vector of integers
vec <- c( 1, 2, 3 )
is.integer( vec )
#> [1] FALSE
# Actually stored as 'double'
typeof( vec )
#> [1] "double"
```

You can also easily determine how many elements are in a vector:
```R
vec <- seq( 1, 10, .33 )
length( vec )
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S04"></a>
#### 4. Converting between data types

A critical part of data processing will involve conversions between these data types. Furthermore, a common source of errors involves problems converting between data types. Users should especially be aware that sometimes R will do operations or conversions 'behind-the-scenes', returning results that are incorrect or not useful without providing an error message or warning.

When combining disparate data types, they are coerced to the most flexible type:
```R
# Converts all values to 'character'
vec <- c( 1, 2, 'Kitties!' )
typeof( vec )
#> [1] "character"
```

Just as the 'is.' functions can be used to test whether a vector is of a particular type, R also has another suite of functions, 'as.', that can coerce one data type to become another type:
```R
# Logicals can be coerced to be 0s and 1s
vec <- c( TRUE, FALSE, FALSE )
as.numeric( vec )
#> [1] 1 0 0

# Values can be converted to character strings
as.character( c( 1, 2, 3 ) )

# If the precision of a double (a value with decimal 
# places) is long, converting to a character will 
# retain all decimal places - here is an example 
# using the built-in mathematical constant pi
as.character( pi )
#> [1] "3.14159265358979"

# Values can be converted to logicals, but only 0s 
# will be converted to FALSE
as.logical( c( 0, 1, -1, 2.5, 0.01 ) )
#> [1] FALSE  TRUE  TRUE  TRUE  TRUE

# Certain types of character strings can be 
# converted to numbers
vec <- c( '1', '2', '3.4' )
as.numeric( vec )
#> [1] 1.0 2.0 3.4
```

Sometimes, R will not be able to coerce one data type to another:
```R
# A warning message is shown to indicate that 
# 'Kitties!' was not converted properly
as.numeric( c( '1', '2', 'Kitties!' ) )
#> [1]  1  2 NA
#> Warning message:
#> NAs introduced by coercion 
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S05"></a>
#### 5. Advanced methods for creating vectors

R has a large number of convenience functions to allow a user to quickly create vectors containing values with desired characteristics.

The `rep` function can be used to repeat a value a specified number of times:
```R
rep( 10, 5 )
# Specifically, creates a vector with the element 
# 'x' repeated 'n' times
x <- 'Kitties!'; n <- 2;
vec <- rep( x, n )
vec
#> [1] "Kitties!" "Kitties!"

# Can also create a larger vector by repeating 
3 elements in a smaller vector
vec <- c( 1, 2, 3 )
rep( vec, 3 )
#> [1] 1 2 3 1 2 3 1 2 3
rep( vec, each = 3 )
#> [1] 1 1 1 2 2 2 3 3 3
```

*Note: The above calls to the 'rep' function highlight another nuance to passing values into functions. Though 'rep( vec, 3 )' and 'rep( vec, each = 3 )' take the same input values, they produce different results because in the latter case, we have specified the exact name of the function argument for the value 3 to be assigned, which is different than the default argument to which the value 3 is assigned in the first example.*

We can also generate vectors consisting of sequences of values using the operator `:`, as shown below:
```R
# Sequence of integers in 1-unit increments
1:10
#> [1]  1  2  3  4  5  6  7  8  9 10
```

A more flexiable function is `seq`, which allows us to specify starting and ending values, and either the increment or number of desired elements in the vector:
```R
# Sequence starting from 2, ending at 10, in 2-unit increments
seq( 2, 10, 2 )
#> [1]  2  4  6  8 10
# Reverse sequence
seq( 10, 2, -2 )
#> [1] 10  8  6  4  2
# Non-integer based sequence
seq( -1.5, 1.5, .5 )
#> [1] -1.5 -1.0 -0.5  0.0  0.5  1.0  1.5

# Sequence from 0 to 1, with vector length of 5
seq( 0, 1, length = 5 )
#> [1] 0.00 0.25 0.50 0.75 1.00
```

<a href="#TOC">&#129145;</a>

<a name="END"></a>
Return to:
[Foundations](C03_P000_Foundations.md);
[Sections](C00_P002_Chapters.md);
[Home page](https://rettopnivek.github.io/R_training/)
