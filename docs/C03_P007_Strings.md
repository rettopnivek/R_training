## Working with Character Strings

Introduction

### Table of contents
1. Combine strings
2. Case conversion
3. Searching through strings

<a name="S01"></a>
#### 1. Displaying strings

R provides several functions for printing a string to the console output.

The __print__ command is a generic function that can be used to display a string or vectr of strings in the console window:

```R
ex <- c( 'Hello', 'world' )
print( ex ) # Includes numeric indicator for line

ex <- 'The "R" project'
print( ex ) # By default strings displayed in quoted form
print( ex, quote = F ) # Strings can be shown in unquoted form
noquote( ex )
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


