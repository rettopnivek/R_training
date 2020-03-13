## Descriptive Statistics

One of R's primary purposes is for statistical computing. An important first step for statistical analyses is putting together descriptive statistics that summarize your data. R provides a variety of tools to carry this out, and furthermore, there are several R packages that add and/or modify tools.

### Table of contents
1. Summary statistics
2. Computing summary statistics over multiple variables
3. Computing summary statistics over grouping factors

#### 1. Summary statistics

The most common summary statistics used to summarize data are:

* The range (the minimum and maximum values)
* The arithmetic mean
* The standard deviation and/or variance
* The median
* The quartiles

All of these statistics have dedicated functions in R:
```R
# Generate some data
x <- rnorm( 100 )

# Compute the minimum and maximum values
min( x )
max( x )
# Compute the range
range( x )
# Compute the mean
mean( x )
# Compute the standard deviation
sd( x )
# Compute the variance
var( x )
# Compute the median
median( x )
```

The median is a subset of the quartiles (i.e., the cut-offs below which 0%, 25%, 50%, 75%, and 100% of the data lie below, respectively). The 25% and 75% cut-offs can be used to compute the inter-quartile range (a robust alternative to the standard deviation). R has a general-purpose function that by default computes these quartiles. This function is flexible, however, and can compute other cut-offs as specified (such as the cut-offs below which 5% and 95% of the data fall), which can be used to compute custom ranges or to trim the data of potential outliers.

```R
# Default is quartiles
quantile( x )
# Can specify percentage for cut-off, such as 5% and 95%
quantile( x, prob = c( .05, .95 ) ) # Note specified as proportion, not percentage

# Inter-quartile range
iqr <- diff( quantile( x, prob = c( .25, .75 ) ) )

# Trim 5% of trailing data
cut_offs <- quantile( x, prob = c( .025, .975 ) ) # 5% divided by 2
trimmed_x <- x[ x > cut_offs[1] & x < cut_offs[2] ]
```

R has a convenience function that will compute the range, mean, standard deviation, and the 25%, 50%, and 75% quartiles:
```R
summary( x )
```

Finally, users can define their own function to compute a summary statistic:
```R
# Create custom function to compute the harmonic mean
harmonic_mean <- function( x ) 1/mean( 1/x ) )
harmonic_mean( x )
```

#### 2. Computing summary statistics over multiple variables

Typically, researchers will have multiple variables that they want to compute summary statistics over, such as age, height, and weight, or gender and racial categories. There are several ways to have R compute statistics over a range of variable, though choices need to be made based on

* Whether you need to isolate a subset of variables in the data frame /matrix
* How you choose to isolate this subset of variables
* What statistics need to be computed
* Whether multiple statistics need to be computed

In base R, there are some built-in functions to quickly compute common calculations over columns (and rows), like `colSums` and `colMeans`. R also has a flexible function, `apply` that 'applies' a given function over the rows or columns of a data frame or matrix.

```
# Simulate fake continuous data
n <- 100
df <- data.frame( Age = rnorm( n, 25, 4 ), Height = rnorm( n, 1.78, .08 ), Weight = rnorm( n, 170, 15 ) )

# R has built-in function to compute mean over columns
colMeans( df )

# Otherwise, one can use the 'apply' function
apply( df, 
       2, # 1 refers to rows, 2 refers to columns; Specifying 2 gives equivalent results to 'colMeans'
       mean )
# The 'apply' function makes it easy to compute any univariate statistic over columns
apply( df, 2, sd ) # Standard deviation
apply( df, 2, median )

# The 'apply' function can also handle more complex statistics and custom functions
apply( df, 2, quantile, prob = c( .25, .75) ) # Inter-quartile range
# Mean, median, and standard deviation rounded to two decimal places
apply( df, 2, function(x) round( c( mean(x), median(x), sd(x), 2 ) ) )
```

#### 3. Computing summary statistics over grouping factors

Forthcoming

*Note: Advanced content.*

[Return to sections](C00_P002_Chapters.md)
