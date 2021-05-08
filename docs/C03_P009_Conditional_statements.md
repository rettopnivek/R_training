## Conditional statements

Conditional statements allow you to run code segments based on whether certain conditions are true or false. They allow you to choose what code you want (or need) to run at a given point, and are part of what R calls 'basic control-flow constructs'. Conditional statements involve the evaluation of logical values, so it is useful to also review operations with logical values.

<a name="TOC"></a>
### Table of contents
1. <a href="#S01">Working with logical values</a>
2. <a href="#S02">Control-flow constructs</a>

<a href="#END">&#129147;</a>

<a name="S01"></a>
#### 1. Working with logical values

To make use of conditional statements, we first need to indicate when conditions are met or not. We can do this using the logical values TRUE or FALSE. R provides a standard suite of tools to generate logical values and conduct boolean operations, both on univariate values and over vectors (and other data types). The following sections review the tools provided in base R.

* <a href="#S011">Logical operators</a>
* <a href="#S012">Boolean operations</a>
* <a href="#S013">Functions any() and all()</a>
* <a href="#S014">The %in% operator</a>

<a name="S011"></a>
#### Logical operators

The __"=="__ operator tests whether the value on the left equals the value on the right:
```r
X <- 1; Y <- 1; Z <- 2
X == Y # TRUE
X == Z # FALSE

# Each element in vectors of matching 
# length are compared to each other
v1 <- 1:3; v2 <- c( 1, 3, 5 )
v1 == v2 # TRUE FALSE FALSE
```

The __"!="__ operator tests whether the value on the left does not equal the value on the right:
```r
X <- 1; Y <- 1; Z <- 2
X != Z # TRUE
X != Y # FALSE

# Each element in vectors of matching 
# length are compared to each other
v1 <- 1:3; v2 <- c( 1, 3, 5 )
v1 != v2 # FALSE TRUE TRUE
```

The __">"__ operator tests whether whether the value on the left is greater than the value on the right:
```r
X <- 1; Y <- 1; Z <- 2
Z > X # TRUE
X > Y # FALSE

# Each element in vectors of matching 
# length are compared to each other
v1 <- 1:3; v2 <- c( 1, 3, 5 )
v2 > v1 # FALSE TRUE TRUE
```

The __">="__ operator tests whether whether the value on the left is greater than or equal to the value on the right:
```r
X <- 1; Y <- 1; Z <- 2
Z >= X # TRUE
X >= Y # TRUE

# Each element in vectors of matching 
# length are compared to each other
v1 <- 1:3; v2 <- c( 1, 3, 5 )
v2 >= v1 # TRUE TRUE TRUE
```

The __"<"__ operator tests whether whether the value on the left is less than the value on the right:
```r
X <- 1; Y <- 1; Z <- 2
X < Z # TRUE
X < Y # FALSE

# Each element in vectors of matching 
# length are compared to each other
v1 <- 1:3; v2 <- c( 1, 3, 5 )
v1 < v2 # FALSE TRUE TRUE
```

The __"<="__ operator tests whether whether the value on the left is less than or equal to the value on the right:
```r
X <- 1; Y <- 1; Z <- 2
X < Z # TRUE
X < Y # FALSE

# Each element in vectors of matching 
# length are compared to each other
v1 <- 1:3; v2 <- c( 1, 3, 5 )
v1 <= v2 # TRUE TRUE TRUE
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S012"></a>
#### Boolean operations

The __"&"__ operator identifies all cases that are true for x AND y:
```r
# Define logical vectors
x <- c( T, T, F )
y <- c( F, T, F )
x & y # FALSE TRUE FALSE
```

The __"|"__ operator identifies all cases that are true for x OR y:
```r
# Define logical vectors
x <- c( T, T, F )
y <- c( F, T, F )
x | y # TRUE TRUE FALSE
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S013"></a>
#### Functions any() and all()

The functions __any__ and __all__ allow a user to collapse a logical vector down to a single TRUE or FALSE value.

The function __any(x)__ returns TRUE if any element of the logical vector x is TRUE:
```r
x <- c( T, F, F )
any( x ) # TRUE

x <- c( F, F, F )
any( x ) # FALSE
```

The function __all(x)__ returns TRUE only when all elements of the logical vector x are TRUE:
```r
x <- c( T, T, T )
all( x ) # TRUE

x <- c( T, F, F )
all( x ) # FALSE
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S014"></a>
#### The operator %in%

The operator __%in%__ allow a user to compare vectors of non-equal length and identify elements present in both vectors.

```r
# Define vectors of unequal length
v1 <- c( 'A', 'B', 'C' )
v2 <- c( 'A', 'A', 'D', 'E', 'C' )

# Identify elements in v1 that are also in v2, 
# even though length(v1) != length(v2)
v1 %in% v2 # TRUE FALSE TRUE

# Identify elements in v2 that are also in v1
v2 %in% v1 # TRUE TRUE FALSE FALSE TRUE
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S02"></a>
#### 2. Control-flow constructs

Conditional statements are one of two primary types of control-flow constructs. A conditional statement checks if a condition is met, and if it evaluates to TRUE, runs a code segment. There are four methods of implementing a conditional statement:

* <a href="#S021">if ...</a>
* <a href="#S022">if ... else ...</a>
* <a href="#S023">ifelse()</a>
* <a href="#S024">switch()</a>

<a name="S021"></a>
#### if ...

The general template for the simplest conditional statement 'if' is:
```
if (<condition is TRUE>) {
  <Do something>
}
```

Specific examples:
```R
# If condition is true, outputs text to console
cond <- TRUE
if (cond) {
  print( 'Hello' )
  print( 'World' )
}

# For a single call, brackets can be excluded
if (cond)
  print( 'Hello world' )

# If evaluates to FALSE, no output
if (!cond)
  print( 'Hello world' )

# Only first value in logical value 
# is evaluated
vec <- c( T, F, F ) # Returns warning
if (vec)
  print( 'Hello world' )

# Use 'any' or 'all' for vectors
if ( any( vec ) ) # TRUE
  print( 'Hello world' )
if ( all( vec ) ) # FALSE
  print( 'Hello world' )
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S022"></a>
#### if ... else ...

The general template for extending an __if__ statement with an additional __else__ statement is:
```
if (<condition is TRUE>) {
  <Do something>
} else {
  <Do something else>
}
```

Specific examples:
```R
# If condition is TRUE, outputs first statement
cond <- TRUE
if (cond) {
  print('1st')
  print('  statement')
} else {
  print('2nd')
  print('  statement')
}

# If condition is FALES, outputs second statement
if (!cond) {
  print('1st')
  print('  statement')
} else {
  print('2nd')
  print('  statement')
}
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S023"></a>
#### ifelse()

The __ifelse__ function adapts the __if__ and __else__ combination to vectors. The general template for the function call is:
```
ifelse( <logical vector>, <output if TRUE>, <output if FALSE> )
```

Specific examples:
```R
# Define logical vector
vec <- c( TRUE, FALSE, FALSE )
# Return a character vector with elements equal to:
# 'A' when 'vec' is TRUE and
# 'B' when 'vec' is FALSE
ifelse( vec, 'A', 'B' )
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S024"></a>
#### switch

Introduction:
```
# Using numbers to index positions
switch(
  <number from 1 onwards>,
  <output when number == 1>,
  <output when number == 2>,
  <etc.>
)

# Using character strings as labels
switch(
  <Character string that matches labels exactly>,
  <Label 1> = <output>,
  <Label 2> = <other output>,
  <etc.>
)
```

Specific examples:
```R
# Examples
input <- 1
switch(
  input,
  'A',
  'B',
  'C'
)
```

*Note: Advanced content.*

<a href="#TOC">&#129145;</a>

<a name="END"></a>
Return to:
[Foundations](C03_P000_Foundations.md);
[Sections](C00_P002_Chapters.md);
[Home page](https://rettopnivek.github.io/R_training/)
