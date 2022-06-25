## Matching/Replacing Strings

R provides several tools to (1) identify character strings that match each other (completely or partially), and (2) replace character strings (or parts of character strings) with a different character string. This is referred to as **pattern** matching and replacement.

<a name="TOC"></a>
### Table of contents
1. <a href="#S02">Base functions for pattern matching/replacement</a>
2. <a href="#S01">Regular expressions</a>

<a href="#END">&#129147;</a>


<a name="S01"></a>
#### 1. Base functions for pattern matching/replacement

R provides 2 core functions to match patterns to character strings and 2 core functions to replace patterns within character strings.

* <a href="#S011">grep()</a>
* <a href="#S012">grepl()</a>
* <a href="#S013">sub()</a>
* <a href="#S014">gsub()</a>


<a name="S011"></a>
#### grep()

The function **grep()** takes a pattern, attempts to match it against a vector of character strings, and then returns the position(s) in the vector of character strings that contain the pattern:
```R
# Create example character vector
x <- c( "ABC", "abc", "CBA", "cba" )

# Match all strings with the 
# letter 'A' (Case-sensitive)

# Return position of 
# matches in vector
# (Case-sensitive)
grep( "A", x )
#> [1] 1 3
grep( "CB", x )
#> [1] 3

# Return values from 
# vector that match
grep( "b", x, value = TRUE )
#> [1] "abc" "cba"
grep( "ba", x, value = TRUE )
#> [1] "cba"

# To make case-insensitive
grep( "a", x, ignore.case = TRUE )
#> [1] 1 2 3 4
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>


<a name="S012"></a>
#### grepl()

The function **grepl()**  takes a pattern, attempts to match it against a vector of character strings, and then returns a logical vector indicating which character strings in the vector contain the pattern:
```R
# Example character vector
x <- c( "ABC", "abc", "CBA", "cba" )

# Logical vector matching in 
# length to 'x', equal to 
# TRUE for matches
# (Case-sensitive)
grepl( "A", x )
#> [1] TRUE FALSE TRUE FALSE
grepl( "CB", x )
#> [1] FALSE FALSE TRUE FALSE

# Argument to make case-insensitive
grepl( "a", x, ignore.case = TRUE )
#> [1] TRUE TRUE TRUE TRUE
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>


<a name="S013"></a>
#### sub()

The function **sub()** takes a pattern and a replacement string, and replaces the *first* occurence within a character string containing the pattern, doing so for each element in a vector:
```R
# Create example character vector
x <- c( "abc", "ABC", "aabb", "AABB" )

# Replaces 'a' with '1' for 
# first match (case-sensitive)
sub( "a", "1", x )
#> [1] "1bc"  "ABC"  "1abb" "AABB"

# To make case-insensitive
sub( "a", "1", x, ignore.case = TRUE )
#> [1] "1bc"  "1BC"  "1abb" "1ABB"
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>


<a name="S014"></a>
#### gsub()

The function **gsub()** takes a pattern and a replacement string, and replaces *all* occurences within a character string containing the pattern, doing so for each element in a vector:
```R
# Create example character vector
x <- c( "abc", "ABC", "aabb", "AABB" )

# Replaces 'a' with '1' for 
# all matches (case-sensitive)
gsub( "a", "1", x )
#> [1] "1bc"  "ABC"  "11bb" "AABB"

# To make case-insensitive
gsub( "a", "1", x, ignore.case = TRUE )
#> [1] "1bc"  "1BC"  "11bb" "11BB"
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>


<a name="S02"></a>
#### 2. Regular expressions

* <a href="#S021">Motivating example</a>
* <a href="#S022">Forthcoming</a>

Regular expressions provide syntax to allow a user to search for various combinations of letters, digits, and special characters. The syntax is flexible, and allows much more complicated groupings and combinations then shown in previous examples. Regular expressions work with a variety of R functions, including __grep__, __grepl__, __sub___, __gsub__, and __strsplit__.


<a name="S021"></a>
#### Motivating example

Here is an example highlighting how regular expressions provide a user with a more concise, simple way to find complicated patterns of strings:
```R
# Goal: Extract all elements of a 
# character vector with the digits
# 1, 2, or 3, irrespective of order

x <- c( 
  # Different orders of 1, 2, and 3
  "123", "321", "231", 
  # 1, 2, and 3 combined with other digits
  "152536", 
  # Missing some cases and also combined 
  # with other digits
  "14", "25", "36"
)

# Doesn't work
grep( '123', x, value = TRUE )
# [1] "123"

# Works, but requires extended code 
# with multiple calls
entries <- 
  grepl( '1', x ) | 
  grepl( '2', x ) | 
  grepl( '3', x )
x[ entries ]
# [1] "123" "321" "231" "152536" "14" "25" "36"

# Regular expressions allow 
# concise, simple call
grep( '[:1-3:]', x, value = TRUE )
# [1] "123" "321" "231" "152536" "14" "25" "36"
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S022"></a>
#### Forthcoming

Introduction.
```R
# Example
```

*Note: Advance content.*

<a href="#TOC">&#129145;</a>

<a name="END"></a>
Return to:
[Foundations](C03_P000_Foundations.md);
[Sections](C00_P002_Chapters.md);
[Home page](https://rettopnivek.github.io/R_training/)
