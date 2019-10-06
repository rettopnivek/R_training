## Basic data structures in R

A simple way to think of R is that it consists of a workspace or environment that stores a variety of objects for you, and then it lets you work with and combine these objects in a variety of ways. However, the structure and type of these objects are diverse and complicated, and this is further complicated by extensions that add even more structures, and the fact that users can define their own custom structures and types.

In this section, we focus on on a set of 4 foundational objects in R, the 4 most commonly used __atomic vector__ types. See the [Data structures](http://adv-r.had.co.nz/Data-structures.html) chapter of Hadley Wickham's book for more in-depth details about these data types.

### Table of contents
  
1. Data types (Atomic vectors)
2. Combining values into a vector
3. Checking data types
4. Converting between data types
5. Advanced methods for creating vectors

#### 1. Data types (Atomic vectors)

The 4 most commonly used __atomic vector__ types are:
1. Integers (whole numbers, like -1 or 2);
2. Doubles (also called numerics, real or decimal valued numbers like 2.45);
3. Logicals (either `TRUE` or `FALSE`);
4. Characters (e.g., letters like 'A' or 'b', or strings of letters, like 'Hello');

#### 2. Combining values into a vector

A set of values of the same type can be combined (or concatenated) using the R function `c` and stored as a named multi-valued __atomic vector__:
```R
vec_of_int <- c( 1, 2, -3, 4 )
vec_of_dbl <- c( 0.5, -1.8 )
vec_of_lgc <- c( TRUE, FALSE, T, F ) # T and F are shorthand
vec_of_chr <- c( 'A', 'b', 'Hello' )
```

*Note: The function 'c' follows the standard procedure in R, in which you provide the function name followed by the list of values in parantheses to which you want to apply the function. The function 'c', however, provides a good example of how to pass multiple values to a function, by separating each value in the function by a comma.*

#### 3. Checking data types

It is useful to know how to check the type of vector stored in a workspace:
```R
vec <- c( 1.4, 2.1, 3.4 )
# Determine what the data type is
class( vec ) # Returns 'numeric' (more general)
typeof( vec ) # Returns 'double' (more specific)
str( vec ) # Details on type, dimensions, and initial values
# Tests whether is a vector is of a particular type
is.double( vec ) # Returns TRUE
is.character( vec ) # Returns FALSE
is.logical( vec )
is.integer( vec )

is.numeric( vec ) # Checks if a vector is is double or an integer
vec <- c( 'A', 'B', 'C' )
is.numeric( vec ) # Now returns FALSE
```

Note sometimes the data type can be non-intuitive:
```R
vec <- c( 1, 2, 3 ) # Looks like vector of integers
is.integer( vec ) # Returns FALSE
typeof( vec ) # Actually stored as 'double'
```

You can also easily determine how many elements are in a vector:
```R
vec <- seq( 1, 10, .33 )
length( vec )
```

#### 4. Converting between data types

A critical part of data processing will involve conversions between these data types. Furthermore, a common source of errors involves problems converting between data types. Users should especially be aware that sometimes R will do operations or conversions 'behind-the-scenes', returning results that are incorrect or not useful without providing an error message or warning.

When combining disparate data types, they are coerced to the most flexible type:
```R
vec <- c( 1, 2, 'Kitties!' )
typeof( vec ) # Converts all values to 'character'
```

Just as the 'is.' functions can be used to test whether a vector is of a particular type, R also has another suite of functions, 'as.', that can coerce one data type to become another type:
```R
# Logicals can be coerced to be 0s and 1s
vec <- c( TRUE, FALSE, FALSE )
as.numeric( vec )

# Values can be converted to character strings
as.character( c( 1, 2, 3 ) )
# If the precision of a double (a value with decimal places) 
# is long, converting to a character will retain all decimal 
# places - here is an example using the built-in 
# mathematical constant pi
as.character( pi )

# Values can be converted to logicals, but only 0s will be 
# converted to FALSE
as.logical( c( 0, 1, -1, 2.5, 0.01 ) )

# Certain types of character strings can be converted to numbers
vec <- c( '1', '2', '3.4' )
as.numeric( vec )
```

Sometimes, R will not be able to coerce one data type to another:
```R
# A warning message is shown to indicate that 'Kitties!' was not converted properly
as.numeric( c( '1', '2', 'Kitties!' ) )
```

#### 6. Advanced methods for creating vectors

R has a large number of convenience functions to allow a user to quickly create vectors containing values with desired characteristics.

The `rep` function can be used to repeat a value a specified number of times:
```R
rep( 10, 5 )
# Specifically, creates a vector with the element 'x' repeated 'n' times
x <- 'Kitties!'; n <- 2;
vec <- rep( x, n )
vec

# Can also create a larger vector by repeating elements in a smaller vector
vec <- c( 1, 2, 3 )
rep( vec, 3 )
rep( vec, each = 3 )
```

*Note: The above calls to the 'rep' function highlight another nuance to passing values into functions. Though 'rep( vec, 3 )' and 'rep( vec, each = 3 )' take the same input values, they produce different results because in the latter case, we have specified the exact name of the function argument for the value 3 to be assigned, which is different than the default argument to which the value 3 is assigned in the first example.*

We can also generate vectors consisting of sequences of values using the operator `:`, as shown below:
```R
1:10 # Sequence of integers in 1-unit increments
```

A more flexiable function is `seq`, which allows us to specify starting and ending values, and either the increment or number of desired elements in the vector:
```R
# Sequence starting from 2, ending at 10, in 2-unit increments
seq( 2, 10, 2 )
# Reverse sequence
seq( 10, 2, -2 )
# Non-integer based sequence
seq( -1.5, 1.5, .5 )

# Sequence from 0 to 1, with vector length of 4
seq( 0, 1, length = 4 )
```

