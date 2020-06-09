## Working with Character Strings

Introduction

### Table of contents
1. Case conversion
2. 

### 1. Combine strings

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
``` 

#### 2. Case conversion

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


```R
# Example R code
```

*Note: Advanced content.*

[Return to sections](C00_P002_Chapters.md)


