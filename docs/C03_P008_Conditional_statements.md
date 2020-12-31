## Conditional statements

Conditional statements allow you to run code segments based on whether certain conditions are true or false.

<a name="TOC"></a>
### Table of contents
1. <a href="#S01">Working with logical values</a>
2. <a href="#S02">More sections</a>

<a href="#END">&#129147;</a>

<a name="S01"></a>
#### 1. Working with logical values

To make use of conditional statements, we first need to indicate when conditions are met or not. We can do this using the logical values TRUE or FALSE. R provides a standard suite of tools to generate logical values and conduct boolean operations, both on univariate values and over vectors (and other data types). The following sections review the tools provided in base R.

* <a href="#S011">Logical operators</a>
* <a href="#S012">Boolean operations</a>
* <a href="#S013">any() and all()</a>
* <a href="#S014">match() or %in%</a>

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
#### any() and all()

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
#### match() or %in%

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S02"></a>
#### 2. The "if" statement

Content.

```R
# Example R code
```

*Note: Advanced content.*

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S02"></a>
#### 2. More sections

<a href="#TOC">&#129145;</a>

<a name="END"></a>
Return to:
[Foundations](C03_P000_Foundations.md);
[Sections](C00_P002_Chapters.md);
[Home page](https://rettopnivek.github.io/R_training/)
