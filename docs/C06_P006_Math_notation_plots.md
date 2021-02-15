## Mathematical annotations in plots

Base R supports an array of mathematical expressions obeying TeX-like rules that can be added to a figure. Adding mathematical notation proceeds via two steps. First, a mathematical expression is defined via the **expression** or **substitute** command. The expression is then added to an existing figure via the **text**, **mtext**, **axis**, and **legend** commands. The command ```?plotmath``` provides a breakdown of the notation used for define various equations, relations, and symbols.

<a name="TOC"></a>
### Table of contents
1. <a href="#S01">Mathematical annotations via **text**</a>
2. <a href="#S02">Mathematical annotations via **mtext**, **axis**, or **legend**</a>
3. <a href="#S03">Greek letters</a>

<a href="#END">&#129147;</a>

<a name="S01"></a>
#### 1. Mathematical annotations via **text**

Content.

```R
# Define regression equation via 
# 'expression' and 'plotmath'
mtxt <- expression(
  y[i] == beta[0] + beta[1]*x[i] + beta[2]*x[i]^2 + epsilon[i]
)
# Add to figure
text( .05, .85, mtxt, pos = 4, cex = 1.75 )

# Combining regular text and equations
# via 'expression', 'paste', and 'plotmath'
mtxt <- expression(
  paste(
    "Log-odds: ",
    frac( theta, 1 - theta )
  )
)
# Add to figure
text( .05, .5, mtxt, pos = 4, cex = 1.75 )

# Sustituting values from a variable via 
# 'substitute' and 'plotmath'
vec <- c( 100, 1.5, 0.25 ) # Vector of coefficients
mtxt <- substitute(
  y[i] == b_0 + b_1*x[i] + b_2*x[i]^2 + epsilon[i],
  list( b_0 = vec[1], b_1 = vec[2], b_2 = vec[3] )
)
# Add to figure
text( .05, .15, mtxt, pos = 4, cex = 1.75 )
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S02"></a>
#### 2. Mathematical annotations via **mtext** or **axis**

Content.

```R
# Define summation and division via 
# 'expression' and 'plotmath'
mtxt <- expression(
  bar(x) == bgroup( "(", frac( 1, N ), ")" )*sum( x[i], i == 1, N )
)
# Add as figure's title
mtext( mtxt, side = 3, cex = 1.15 )

# Define vector of expressions
mtxt <- c(
  expression( x^1 ),
  expression( x^3 ),
  expression( x^5 )
)
# Add to figure axis
axis( 1, c( .25, .5, .75 ), mtxt, cex.axis = 1.5, tick = F )
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S03"></a>
#### 3. Greek letters

Content.

```R
# x-axis coordinate
xc <- .95
# y-axis coordinates
yc <- seq( 1, 0, length.out = 24 )
# Text size
sz <- 1.3

mtxt <- expression( list( Alpha, alpha ) )
text( xc, yc[1], mtxt, cex = sz )

mtxt <- expression( list( Beta, beta ) )
text( xc, yc[2], mtxt, cex = sz )

mtxt <- expression( list( Gamma, gamma ) )
text( xc, yc[3], mtxt, cex = sz )

mtxt <- expression( list( Delta, delta ) )
text( xc, yc[4], mtxt, cex = sz )

mtxt <- expression( list( Epsilon, epsilon ) )
text( xc, yc[5], mtxt, cex = sz )

mtxt <- expression( list( Zeta, zeta ) )
text( xc, yc[6], mtxt, cex = sz )

mtxt <- expression( list( Eta, eta ) )
text( xc, yc[7], mtxt, cex = sz )

mtxt <- expression( list( Theta, theta ) )
text( xc, yc[8], mtxt, cex = sz )

mtxt <- expression( list( Iota, iota ) )
text( xc, yc[9], mtxt, cex = sz )

mtxt <- expression( list( Lambda, lambda ) )
text( xc, yc[10], mtxt, cex = sz )

mtxt <- expression( list( Kappa, kappa ) )
text( xc, yc[11], mtxt, cex = sz )

mtxt <- expression( list( Mu, mu ) )
text( xc, yc[12], mtxt, cex = sz )

mtxt <- expression( list( Nu, nu ) )
text( xc, yc[13], mtxt, cex = sz )

mtxt <- expression( list( Xi, xi ) )
text( xc, yc[14], mtxt, cex = sz )

mtxt <- expression( list( Omicron, omicron ) )
text( xc, yc[15], mtxt, cex = sz )

mtxt <- expression( list( Pi, pi ) )
text( xc, yc[16], mtxt, cex = sz )

mtxt <- expression( list( Rho, rho ) )
text( xc, yc[17], mtxt, cex = sz )

mtxt <- expression( list( Sigma, sigma ) )
text( xc, yc[18], mtxt, cex = sz )

mtxt <- expression( list( Tau, tau ) )
text( xc, yc[19], mtxt, cex = sz )

mtxt <- expression( list( Upsilon, upsilon ) )
text( xc, yc[20], mtxt, cex = sz )

mtxt <- expression( list( Phi, phi ) )
text( xc, yc[21], mtxt, cex = sz )

mtxt <- expression( list( Chi, chi ) )
text( xc, yc[22], mtxt, cex = sz )

mtxt <- expression( list( Psi, psi ) )
text( xc, yc[23], mtxt, cex = sz )

mtxt <- expression( list( Omega, omega ) )
text( xc, yc[24], mtxt, cex = sz )
```

<a href="#TOC">&#129145;</a>

<a name="END"></a>
Return to:[FAQ](C06_P000_FAQ.md);
[Sections](C00_P002_Chapters.md);
[Home page](https://rettopnivek.github.io/R_training/)

