## Matching/Replacing Strings

Introduction

<a name="TOC"></a>
### Table of contents
1. <a href="#S02">Base functions for pattern matching/replacement</a>
2. <a href="#S01">Regular expressions</a>

<a href="#END">&#129147;</a>


<a name="S01"></a>
#### 1. Base functions for pattern matching/replacement

Introduction.

* <a href="#S011">grep()</a>
* <a href="#S012">grepl()</a>
* <a href="#S013">sub()</a>
* <a href="#S014">gsub()</a>


<a name="S011"></a>
#### grep()

Introduction:
```R
# Example character vector
x <- c( "ABC", "abc", "CBA", "cba" )

# Match all strings with the 
# letter 'A' (Case-sensitive)

# Return position of 
# matches in vector
# (Case-sensitive)
grep( "A", x )
# [1] 1 3
grep( "CB", x )
# [1] 3

# Return values from 
# vector that match
grep( "b", x, value = TRUE )
# [1] "abc" "cba"
grep( "ba", x, value = TRUE )
# [1] "cba"

# Argument to make case-insensitive
grep( 'a', x, ignore.case = TRUE )
# [1] 1 2 3 4
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>


<a name="S012"></a>
#### grepl()

Introduction:
```R
# Example character vector
x <- c( "ABC", "abc", "CBA", "cba" )

# Logical vector matching in 
# length to 'x', equal to 
# TRUE for matches
# (Case-sensitive)
grepl( 'A', x )
# [1] TRUE FALSE TRUE FALSE
grepl( 'CB', x )
# [1] FALSE FALSE TRUE FALSE

# Argument to make case-insensitive
grepl( 'a', x, ignore.case = TRUE )
# [1] TRUE TRUE TRUE TRUE
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>


<a name="S013"></a>
#### sub()

Introduction:
```R
# Example
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>


<a name="S014"></a>
#### gsub()

Introduction:
```R
# Example
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>


<a name="S02"></a>
#### 2. Regular expressions

Content.

```R
# Example R code
```

*Note: Advanced content.*

<a href="#TOC">&#129145;</a>

<a name="END"></a>
Return to:
[Foundations](C03_P000_Foundations.md);
[Sections](C00_P002_Chapters.md);
[Home page](https://rettopnivek.github.io/R_training/)
