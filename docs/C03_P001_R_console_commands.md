## Basic R Commands in the Console Window

In this section, I provide some simple examples of inputting commands to the R console window. In the following, examples can be run by copying the code segment, pasting it into the R console window, and hitting 'return' or 'enter'. Note that as a programming language, R needs commands to be in specific formats without typos - if a typo is present, or if a command is called in the incorrect way, the console window will instead display an error message.

*Note: Even for regular users of R, error messages are frequent, as programming is hard and programming languages are extremely strict regarding inputs. Do not feel bad about errors in your code or error messages, these are useful learning opportunities!*

<a name="TOC"></a>
### Table of contents
1. <a href="#S01">Annotations</a>
2. <a href="#S02">Examples of basic math</a>
3. <a href="#S03">Examples of conditional statements</a>
4. <a href="#S04">Examples of mathematical functions</a>
5. <a href="#S06">Order of operations and parantheses</a>
6. <a href="#S06">Saving values as a variable</a>

<a href="#END">&#8628;</a>

<a name="S01"></a>
#### 1. Annotations

Preceding any input with the `#` symbol will prevent R from running the input. This provides a simple way to add notes and comments to code, and I use this freqeuntly in the following examples.

```R
# R will not run this line of text because it is preceded by '#'
```

<a href="#TOC">&#10548;</a> <a href="#END">&#8628;</a>

<a name="S02"></a>
#### 2. Examples of basic math

```R
1 + 1     # Addition
3 - 2     # Subtraction
2 * 3     # Multiplication
8 / 2     # Division
2 ^ 3     # Exponents
4 %% 3    # Modulo (returns the remainder after division)
```

*Note: These are examples of a special type of function known as an 'operator'.*

<a href="#TOC">&#10548;</a> <a href="#END">&#8628;</a>

<a name="S03"></a>
#### 3. Examples of conditional statements

R has special operator functions (binary relational operators) that can check whether conditions are `TRUE` or `FALSE` - these are known as conditional statements:
```R
1 == 1 # Check if equal
1 == 2
1 != 2 # Check if not equal
1 != 1
4 > 1 # Check if greater than
1 > 4
4 <= 5 # Check if less than or equal to
4 <= 4
4 <= 3
```

<a href="#TOC">&#10548;</a> <a href="#END">&#8628;</a>

<a name="S04"></a>
#### 4. Examples of mathematical functions

```R
sqrt( 4 ) # Square root
log( 2 )  # Natural log
sin( 1 )  # Trig functions (in radians)
asin( 0.841471 )
```

*Note: See here how when calling a mathematical function, we use the name of the function (e.g., 'sqrt'), followed by the value we want to apply the function to (e.g., '4' ) in parantheses. This is an example of the standard way to apply almost any function in R to a value or variable.*

<a name="S05"></a>
#### 5. Order of operations and parantheses

```R
10 + 8 * 4^2    # This is equivalent to...
10 + ( 8 * (4^2) )
# But does not equal
(10 + 8) * (4^2)
# or
10 + ( 8 * 4 )^2
```

If you aren't sure how the order of operations will work when writing out math, as shown in the examples above, you can use parantheses to clearly indicate to users (and to R) the order for which math should be performed.

<a href="#TOC">&#10548;</a> <a href="#END">&#8628;</a>

<a name="S06"></a>
#### 6. Saving values as a variable

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

*Note: When naming variables, it is best to a) use meaningful labels that will allow you (at a later point) or a new user to easily identify what the variable is for, or b) include easy to find and understand notes/annotations describing what variables names refer to, thereby avoiding confusion at later time points and improving the readability of your code.

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

*Note: The above code provides an example of calling multiple commands in the same line. As shown, we can separate different commands using the semi-colon symbol without having to hit 'enter' and start a new line.*

<a name="END"></a>
Return to:
[Foundations](C03_P000_Foundations.md);
[Sections](C00_P002_Chapters.md);
[Home page](https://rettopnivek.github.io/R_training/)
