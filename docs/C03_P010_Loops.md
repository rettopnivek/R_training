## Loops

As with any programming language, R provides several ways automate repeated calls or operations, a process typically known as a **loop**.

<a name="TOC"></a>
### Table of contents
1. <a href="#S01">Control-flow constructs</a>
2. <a href="#S02">More sections</a>

<a href="#END">&#129147;</a>

<a name="S01"></a>
#### 1. Control-flow constructs

As part of what R labels 'basic control-flow constructs', three ways to implement loops in R are:

* <a href="#S011">while</a>
* <a href="#S012">repeat</a>
* <a href="#S013">for</a>

*Note: The most common loop you will see used in R is the for loop; the while or repeat loops are far less common.*

As a running example, we will show how all three loop methods can be used to print the numbers 1 to 10 to the console.

<a name="S011"></a>
#### while

A **while** loop, as indicated in the name, repeats an operation or set of operations while a user-specified condition is met. Once the condition tests FALSE instead of TRUE, the loop terminates.

*Note: If the condition for continuing the loop never tests FALSE, you will have an infinite loop that never stops!*

```
# Template for a while loop:
<Specify external variables needed for loop>
while (<Condition for continuing>) {
  <Operations to repeat>
}
```

Running example:
```R
# Specify external variables needed for loop
i <- 1 # Counter
while ( i <= 3 ) { # Condition for continuing
  # Operation to repeat
  print( i )
  i <- i + 1 # Increment counter
}
#> [1] 1
#> [1] 2
#> [1] 3
```

<a name="S012"></a>
#### repeat

A **repeat** loop, as indicated in the name, repeats an operation or set of operations. Unlike the while loop, which requires a user to specify the condition to be met for the loop to continue, a repeat loop does not require any initial specification of condition. Instead, the user can specify the condition to stop the loop as part of the set of operations to run per iteration, using the command **break** to stop the loop once the condition tests TRUE.

*Note: If you forget to include a condition to stop a repeat loop, or if the condition for stopping never tests TRUE, you will have an infinite loop that never stops!*

```
# Template for a repeat loop:
<Declare external variables needed for loop>
repeat {
  <Operations to repeat>
  if ( <Condition for stopping> ) break
}
```

Running example:
```R
# Declare external variables needed for loop
i <- 1 # Counter
repeat {
  # operations to repeat
  print( i )
  i <- i + 1 # Increment counter
  if ( i > 3 ) break # Condition for stopping
}
#> [1] 1
#> [1] 2
#> [1] 3
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S012"></a>
#### for

A **for** loop repeats operations over a specified number of increments. A user specifies a counter variable and the number of values the counter can take, and then for each increment the desired set of operations are run.

```
# Template for a repeat loop:
<Declare external variables needed for loop>
for (<counter variable> in <increment values>) {
  <Operations to repeat>
}
```

Running example:
```R
for ( i in 1:3 ) {
  # Operations to repeat
  print( i )
}
#> [1] 1
#> [1] 2
#> [1] 3
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

```R
# Example R code
```

*Note: Advanced content.*

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S02"></a>
#### 2. More sections

<a href="#TOC">&#129145;</a>

#### To do

* Add section detailing speed issues with loops
* Add section detailing vectorization
* Add section for 'apply' based functions

<a name="END"></a>
Return to:
[Foundations](C03_P000_Foundations.md);
[Sections](C00_P002_Chapters.md);
[Home page](https://rettopnivek.github.io/R_training/)


