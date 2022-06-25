## Working with Character Strings

Character strings are an important data type. Many data sets will include character strings to represent information like dates, subject identifiers, labels for groups and conditions, notes regarding data quality, and other content. Base R provides several tools for displaying, indexing, and manipulating strings.

<a name="TOC"></a>
### Table of contents
1. <a href="#S01">Creating strings</a>
2. <a href="#S02">Displaying strings</a>
3. <a href="#S03">Number of characters in a string</a>
4. <a href="#S04">String indexing</a>
5. <a href="#S05">Case conversion</a>
6. <a href="#S06">Character replacement</a>
7. <a href="#S07">Abbreviations</a>
8. <a href="#S08">Combining strings</a>
9. <a href="#S09">Splitting strings</a>

<a href="#END">&#129147;</a>

<a name="S01"></a>
#### 1. Creating strings

A string is defined in R using single or double quotes:
```R
ex <- "This is a string"
ex <- 'This is also a string'
```

When defining a string, the type of closing quote must match the type of opening quote. Care must be taken when intermixing single and double quotes:
```R
# To display single quotes as part of the 
# string, define string using double quotes
ex <- "The 'R' project"

# To display double quotes as part of the 
# string, define string using single quotes
ex <- 'The "R" project'

# Alternatively, can use the backslash to 
# define a special character for double quotes
ex <- "The \"R\" project"
```

R has predefined constants for the Roman alphabet and for the months:
```R
letters # Lower-case
LETTERS # Upper-case
month.name # Full names for months
month.abb # 3-letter abbreviations for months
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S02"></a>
#### 2. Displaying strings

R provides several functions for displaying a string in the console window.

The __print__ command is a generic function that can be used to display a string or vector of strings in the console window:
```R
ex <- c( 'Hello', 'world' )
print( ex ) # Includes numeric indicator for line
#> [1] "Hello" "world"

# Example with internal double quotes
ex <- 'The "R" project'

# By default strings displayed in quoted form
# Note the use of backslashes to preserve 
# internal double quotes
print( ex )
#> [1] "The \"R\" project"

# Strings can be shown in unquoted form
print( ex, quote = F )
#> [1] The "R" project
noquote( ex ) # Wrapper for 'print' with quote set to FALSE
#> [1] The "R" project
```

*Note: A generic function is a function that adjusts what it outputs based on the type of input it recieves. For example, the 'print' command will generate different output based on whether the input is a simple string or data frame.*

The __cat__ command combines a set of inputs into a single string and outputs it with minimal processing:
```R
cat( 'Hello', 'world' ) # By default separates with space
#> Hello world
cat( 'Lower', '-', 'case', sep = '' ) # Remove space
#> Lower-case

# Does not display quoted form nor an indicator for line
ex <- c( 'The', '"R"', 'project' )
cat( ex )
#> The "R" project

# Note 'print' and 'cat' differ in how they 
# display special characters like new lines '\n'
# or tab spaces '\t'

# Define string with the special character 
# for a new line
ex <- 'Line 1\nLine 2\n\nLine 4'
print( ex ) # New line is represented by special character
#> [1] "Line 1\nLine 2\n\nLine 4"
cat( ex ) # New line is taken literally
#> Line 1
#> Line 2
#> 
#> Line 4
```

The __format__ command is a flexible function that provides several different options to produce organized, nice looking output. The __format__ command is especially useful for converting numbers into nicely formatted strings:
```R
# By default, equivalent output to 'print'
format( 'The "R" project' )
#> [1] "The \"R\" project"

# Can pad strings with blank 
# spaces so they have an equal 
# number of characters
vec <- c( 'A', 'BB', 'CCC' )
# Use 'cbind' to convert to 
# column matrix to better show 
# alignment and padding
cbind( format( vec ) )
#>      [,1] 
#> [1,] "A  "
#> [2,] "BB "
#> [3,] "CCC"

# Can control justification as well
cbind( format( vec, justify = 'right' ) )
#>      [,1] 
#> [1,] "  A"
#> [2,] " BB"
#> [3,] "CCC"

# Note use of British spelling
cbind( format( vec, justify = 'centre' ) )
#>      [,1] 
#> [1,] " A "
#> [2,] "BB "
#> [3,] "CCC"

# Can be used to round numbers to a 
# specified number of decimals
vec <- c( 0.123, 1.23, 100.2 )
# Numbers padded with 0 to have 
# same number of decimal places
cbind( format( vec, digits = 2 ) )
#>      [,1]    
#> [1,] "  0.12"
#> [2,] "  1.23"
#> [3,] "100.20"
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S03"></a>
#### 3. Number of characters in a string

One can determine the total number of characters in a string (including blank spaces), using the function __nchar()__:
```R
x <- 'abcde'
nchar( x )
#> [1] 5

# Counts blank spaces
x <- 'Hello world'
nchar( x )
#> [1] 11

# Works with vectors
x <- c( 'Hello', 'world' )
nchar( x )
#> [1] 5 5
``` 

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S04"></a>
#### 4. String indexing

You can use the function __substring__ (or the similar function __substr__) to extract a subset of a character string based on a user-specified start and end position:
```R
# Example string
x <- 'ABCD'

# First letter of string
substring( x, first = 1, last = 1 )
#> [1] "A"
# Middle 2 letters of string
substring( x, 2, 3 )
#> [1] "BC"

# Replace middle 2 letters of string
substring( x, 2, 3 ) <- '23'
print( x )
#> [1] "A23D"

# 'substr' is a similar function 
# with slightly different argument names
substr( x, start = 2, stop = 3 )
#> [1] "23"
print( x )
#> [1] "A23D"

# Indexing outside number of characters 
# does not return an error, instead 
# returns an empty character value
substr( x, start = 5, stop = 5 )
#> [1] ""
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S05"></a>
#### 5. Case conversion

We can convert upper-case letters to lower-case:
```R
tolower( 'ABC' )
#> [1] "abc"
# Function is vectorized
tolower( c( 'A', 'B', 'C' ) )
#> [1] "a" "b" "c"
```

We can also convert lower-case letters to upper-case:
```R
toupper( 'abc' )
#> [1] "ABC"
# Function is vectorized
toupper( c( 'a', 'b', 'c' ) )
#> [1] "A" "B" "C"
```

There is a single wrapper to both functions:
```R
# Converts to lower-case
casefold( 'ABC' )
#> [1] "abc"
# Converts to upper-case
casefold( 'abc', upper = T )
#> [1] "ABC"
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S06"></a>
#### 6. Character replacement

The function __chartr__ can be used to replace individual characters with a new character:
```R
# Example string
x <- "Bats, cats, and hats; All end with 'at'"

# Replace the letter "a"
chartr( old = "a", new = "-", x )
#> [1] "B-ts, c-ts, -nd h-ts; All end with '-t'"

# Function is case-sensitive
chartr( old = "A", new = "-", x )
#> "Bats, cats, and hats; -ll end with 'at'"

# Function can replace multiple characters independently
chartr( old = "at", new = "--", x )
#> [1] "B--s, c--s, -nd h--s; All end wi-h '--'"
# Any instance of 'a' or 't' is replaced with '-'
```

*Note: Only use the chartr function when you want all instances of an individual character to be replaced!*

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S07"></a>
#### 7. Abbreviations

R provides a function that will take a vector of strings and abbreviate them in a manner that ensures each individual string remains unique (This can be helpful, for example, when plotting or labeling anything with long strings):
```R
# Example string
x <- 'Psychology'

# Abbreviate to 4 letters by default
abbreviate( x )
#> Psychology 
#>     "Psyc" 
# Output is a named vector with original words as label

# Abbreviate to 5 letters
abbreviate( x, minlength = 5 )
#> Psychology 
#>    "Psych" 

# Vector of strings
x <- c( 'Psychology', 'Psychiatry', 'Sociology' )

# Creates unique truncation of each string  
abbreviate( x )
#> Psychology Psychiatry  Sociology 
#>   "Psychl"   "Psycht"     "Sclg" 
  
# By default, proceeds iteratively from 
# beginning to end, but can specify 
# alternative method
abbreviate( x, method = 'both.sides' )
#> Psychology Psychiatry  Sociology 
#>     "Psyc"     "Ptry"     "Sclg" 
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S08"></a>
#### 8. Combining strings

Base R uses the command 'paste' to combine character strings.
```R
# By default adds a space between strings
paste( 'Hello', 'World' )
#> [1] "Hello World"

# Can define custom separator between strings
paste( 'Long', 'legged', sep = '-' )
#> [1] "Long-legged"

# To combine with no space
paste0( 'cat', 'nip' )
#> [1] "catnip"

# Functions are vectorized
paste( 'Part', c( '1', '2', '3' ) )
#> [1] "Part 1" "Part 2" "Part 3"
paste0( c( 'A','B', 'C' ), ')' )
#> [1] "A)" "B)" "C)"

# Can also convert a vector of 
# strings into a single string
paste( c( 'The', 'quick', 'brown', 'fox' ), collapse = ' ' )
#> [1] "The quick brown fox"
``` 

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S09"></a>
#### 9. Splitting strings

We can split a character string into parts that precede and/or follow a specified character or phrase using the function __strsplit__:
```R
x <- 'Hyphenated-word'
y <- strsplit( x, split = '-' )
# Returns list with new character vector
y
#> [[1]]
#> [1] "Hyphenated" "word"

# Vectorized
x <- c( 'A-B', 'C-D-E' )
y <- strsplit( x, split = '-' )
#> [[1]]
#> [1] "A" "B"
#> 
#> [[2]]
#> [1] "C" "D" "E"

# Can split into individual letters
strsplit( 'ABCD', split = '' )[[1]]
#> [1] "A" "B" "C" "D"

# Can split by phrase
x <- 'cathatbat'
strsplit( x, split = 'hat' )[[1]]
#> [1] "cat" "bat"

# Case-sensitive
strsplit( 'AaAa', split = 'a' )[[1]]
#> [1] "A" "A"
strsplit( 'AaAa', split = 'A' )[[1]]
#> [1] ""  "a" "a"
# Note function returns empty character 
# if split is at beginning or end of string

# Care must be used with special characters
# Does not work as expected
strsplit( 'ABC.abc', split = '.' )[[1]]
#> [1] "" "" "" "" "" "" ""
# Use argument 'fixed' for special character
strsplit( 'ABC.abc', split = '.', fixed = T )[[1]]
#> [1] "ABC" "abc"
```

<a href="#TOC">&#129145;</a>

<a name="END"></a>
Return to:
[Foundations](C03_P000_Foundations.md);
[Sections](C00_P002_Chapters.md);
[Home page](https://rettopnivek.github.io/R_training/)

