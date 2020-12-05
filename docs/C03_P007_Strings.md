## Working with Character Strings

Base R provides several tools for displaying, indexing, and manipulating strings.

### Table of contents
1. <a href="#S01">Displaying strings</a>
2. <a href="#S02">Special characters and symbols</a>

<a href="#END">&#129147;</a>

<a name="S01"></a>
#### 1. Displaying strings

R provides several functions for displaying a string in the console window.

The __print__ command is a generic function that can be used to display a string or vector of strings in the console window:

```R
ex <- c( 'Hello', 'world' )
print( ex ) # Includes numeric indicator for line

# Example with internal double quotes
ex <- 'The "R" project'

# By default strings displayed in quoted form
# Note the use of backslashes to preserve 
# internal double quotes
print( ex )

# Strings can be shown in unquoted form
print( ex, quote = F )
noquote( ex ) # Wrapper for 'print' with quote set to FALSE
```

*Note: A generic function is a function that adjusts what it outputs based on the type of input it recieves. For example, the 'print' command will generate different output based on whether the input is a simple string or data frame.*

The __cat__ command combines a set of inputs into a single string and outputs it with minimal processing:

```R
cat( 'Hello', 'world' ) # By default separates with space
cat( 'Lower', '-', 'case', sep = '' ) # Remove space

# Does not display quoted form nor an indicator for line
ex <- c( 'The', '"R"', 'project' )
cat( ex )
```

The __format__ command is a flexible function that provides several different options to produce organized, nice looking output. The __format__ command is especially useful for converting numbers into nicely formatted strings:

```R
# By default, equivalent output to 'print'
format( 'The "R" project' )

# Can pad strings with blank 
# spaces so they have an equal 
# number of characters
vec <- c( 'A', 'BB', 'CCC' )
cbind( format( vec ) )
# Can control justification as well
cbind( format( vec, justify = 'right' ) )
cbind( format( vec, justify = 'centre' ) ) # Note use of British spelling

# Can be used to round numbers to a 
# specified number of decimals
vec <- c( 0.123, 1.23, 100.2 )
# Numbers padded with 0 to have 
# same number of decimal places
cbind( format( vec, digits = 2 ) )
```

<a name="S02"></a>
#### 2. Special characters and symbols

```R
# New lines
string <- 'Line 1\nLine 2\n\nLine 4\n'
cat( string )

# Tab
string <- 'A\tB\t\tC'
cat( string )
```


<a name="S02"></a>
#### 2. Combine strings

Base R uses the command 'paste' to combine character strings.

```R
# By default adds a space between strings
paste( 'Hello', 'World' )
# Can define custom separator between strings
paste( 'Long', 'legged', sep = '-' )
# To combine with no space
paste0( 'cat', 'nip' )

# Functions are vectorized
paste( 'Part', c( '1', '2', '3' ) )
paste0( c( 'A','B', 'C' ), ')' )

# Can also convert a vector of 
# strings into a single string
paste( c( 'The', 'quick', 'brown', 'fox' ), collapse = ' ' )
``` 

<a name="S03"></a>
#### 3. Case conversion

We can convert upper-case letters to lower-case:
```R
tolower( 'ABC' )
# Function is vectorized
tolower( c( 'A', 'B', 'C' ) )
```

We can also convert lower-case letters to upper-case:
```R
toupper( 'abc' )
# Function is vectorized
toupper( c( 'a', 'b', 'c' ) )
```

There is also a single wrapper to both functions:
```R
# Converts to lower-case
casefold( 'ABC' )
# Converts to upper-case
casefold( 'abc', upper = T )
```

### 3. Searching through strings

```R
# Example R code
```

*Note: Advanced content.*

[Return to sections](C00_P002_Chapters.md)


