## Basic R Commands in the Console Window

In this section, I provide some simple examples of inputting commands to the R console window. In the following, examples can be run by copying the code segment, pasting it into the R console window, and hitting 'return' or 'enter'. Note that as a programming language, R needs commands to be in specific formats without typos - if a typo is present, or if a command is called in the incorrect way, the console window will instead display an error message.

*Note: Even for regular users of R, error messages are frequent, as programming is hard and programming languages are extremely strict regarding inputs. Do not feel bad about errors in your code or error messages, these are useful learning opportunities!*

### Table of contents
1. Annotations
2. Examples of basic math
3. Examples of mathematical functions
4. Order of operations and parantheses
5. Saving values as a variable

#### 1. Annotations

Preceding any input with the `#` symbol will prevent R from running the input. This provides a simple way to add notes and comments to code, and I use this freqeuntly in the following examples.

```R
# R will not run this line of text because it is preceded by '#'
```

#### 2. Examples of basic math

```R
1 + 1     # Addition
3 - 2     # Subtraction
2 * 3     # Multiplication
8 / 2     # Division
2 ^ 3     # Exponents
4 %% 3    # Modulo (returns the remainder after division)
```

#### 3. Examples of mathematical functions

```R
sqrt( 4 ) # Square root
log( 2 )  # Natural log
sin( 1 )  # Trig functions (in radians)
asin( 0.841471 )
```

*Note: Note here how when calling a mathematical function, we use the name of the function (e.g., 'sqrt'), followed by the value we want to apply the function to (e.g., '4' ) in parantheses. This is an example of the standard way to apply almost any function in R to a value or variable.*

#### 4. Order of operations and parantheses

```R
10 + 8 * 4^2    # This is equivalent to...
10 + ( 8 * (4^2) )
# But does not equal
(10 + 8) * (4^2)
# or
10 + ( 8 * 4 )^2
```

If you aren't sure how the order of operations will work when writing out math, as shown in the examples above, you can use parantheses to clearly indicate to users (and to R) the order for which math should be performed.

#### 5. Saving values as a variable

You can assign values to a variable, and can use arbitrary variable names when doing so, as long as these names confirm to a certain set of rules.
1. Variable names can be a combination of letters, digits, single periods (.) and underscores (_);
2. Variable names must start with a letter or a period. If a name starts with a period, it cannot be followed by a digit.
3. Reserved words in R cannot be used as variable names.

These variables names will work:
* `total`
* `Sum`
* `.fine.with.dot`
* `this_is_acceptable`
* `Number5`

These variable names will NOT work:
* `tot@l`
* `5um`
* `_fine`
* `TRUE` (This is an example of a reserved word in R)
* `.0ne`

*Notes: When naming variables, it is best to a) use meaningful labels that will allow you (at a later point) or a new user to easily identify what the variable is for, or b) include easy to find and understand notes/annotations describing what variables names refer to, thereby avoiding confusion at later time points and improving the readability of your code.

Assigning a value to a variable:
```R
a <- 2  # Best practice approach
a = 2   # Equivalent, but can be easily confused with another R command '=='
a       # Displays value assigned to variable
```

Assigning values to variables allows for basic algebra:
```R
a <- 4; b <- 2; x <- 0.5; # Semi-colon separates multiple commands
y <- a + b*x # Save output
y
# Output y must be updated if one of inputs is changed
a <- 10
y # Output is unchanged
y <- a + b*x # Update output
y # Now holds updated output
```

*Note: The above code provides an example of calling multiple commands in the same line. As shown, we can separate different commands using the semi-colon symbol ';' without having to hit 'enter' and start a new line.*
