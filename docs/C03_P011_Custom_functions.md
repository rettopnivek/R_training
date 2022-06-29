## Title

Introduction

<a name="TOC"></a>
### Table of contents
1. <a href="#S01">Sections</a>
2. <a href="#S02">More sections</a>

<a href="#END">&#129147;</a>

<a name="S01"></a>
#### 1. Sections

Content.

```R
# Example R code
```

*Note: Advanced content.*

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S02"></a>
#### 2. Basics of defining custom functions

The basic template for defining your own function in R is:
```
function_name <- function( <1st argument>, <2nd argument>, <etc.> ) {
  
  <Do something>
  
  return( <output> )
}
```

Once you have defined your function, you can make a call to it like any of R's base functions:
```R
# Example taking the arguments 'x' 
# and 'y' and returning their sum
sum_x_and_y <- function( x, y ) {
  z <- x + y
  return( z )
}

sum_x_and_y( 1, 2 )
#> [1] 3
```

Note that you can define a function that takes no arguments:
```R
no_arguments <- function() {
  return( "Hello world" )
}
no_arguments()
#> [1] Hello world
```

```R
# A function can only return a single output
broken_sum <- function( x, y, z ) {
  sum_1 <- x + y
  sum_2 <- x + z
  
  # Doesn't work
  return( sum_1, sum_2 )
}

broken_sum( 1, 2, 3 )
#> Error in return(sum_1, sum_2) : multi-argument returns are not permitted

# Therefore, multiple outputs should be combined 
using data types like vectors or lists
fixed_sum <- function( x, y, z ) {
  sum_1 <- x + y
  sum_2 <- x + z
  
  # Store outputs in list
  out <- list(
    sum_1 = sum_1,
    sum_2 = sum_2
  )
  
  return( out )
}

fixed_sum( 1, 2, 3 )
#> $sum_1
#> [1] 3
#> 
#> $sum_2
#> [1] 4
```

```R
# A function that does not have 
# any explicit output returns 
# NULL by default
pointless <- function( x ) {
  # Does nothing
}
pointless( 10 )
#> NULL
```

<a href="#TOC">&#129145;</a>

<a name="END"></a>
Return to:
Chapter
[Sections](C00_P002_Chapters.md);
[Home page](https://rettopnivek.github.io/R_training/)


