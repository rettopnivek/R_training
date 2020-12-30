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

* A) <a href="#S011">Logical operators</a>
* B) <a href="#S012">Boolean operations</a>
* C) <a href="#S013">any() and all()</a>
* D) <a href="#S014">match() or %in%</a>

<a name="S011"></a>
##### A) Logical operators

```r
# Define variables for examples

# Univariate variables
x <- 1
y <- 1
z <- 2
# Vectors
vec1 <- c( 1, 2, 3 )
vec2 <- c( 1, 3, 5 )

### The "==" operator ###

# Tests if a equals b
x == y # TRUE
x == z # FALSE
# Each element in vectors of matching 
# length are compared to each other
vec1 == vec2 # TRUE FALSE FALSE

### The "!=" operator ###

# Tests if a does not equal b
x != z # TRUE
x != y # FALSE
# Each element in vectors of matching 
# length are compared to each other
vec1 != vec2 # FALSE TRUE TRUE

### The ">" operator ###

# Tests if a is greater than b
z > x # TRUE
x > y # FALSE
# Each element in vectors of matching 
# length are compared to each other
vec2 > vec1 # FALSE TRUE TRUE

### The ">=" operator ###

# Tests if a is greater than or equal to b
x >= z # TRUE
x >= y # TRUE
z >= x # FALSE
# Each element in vectors of matching 
# length are compared to each other
vec2 >= vec1 # TRUE TRUE TRUE

### The "<" operator ###

# Tests if a is less than b
x < y # TRUE
x < y # FALSE
# Each element in vectors of matching 
# length are compared to each other
vec1 < vec2 # FALSE TRUE TRUE

### The "<=" operator ###

# Tests if a is less than or equal to b
x <= z # TRUE
x <= y # TRUE
z <= x # FALSE
# Each element in vectors of matching 
# length are compared to each other
vec2 <= vec1 # TRUE FALSE FALSE
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S012"></a>
##### B) Boolean operations

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S013"></a>
##### C) any() and all()

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S014"></a>
##### D) match() or %in%

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
