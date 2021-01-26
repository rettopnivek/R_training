## Creating a color gradient

Here is an example of creating a vector of colors that forms a gradient between color A and color B:

```R
# Specify the two colors
color_A = colors()[1]
color_B = colors()[122]

# Define a function that will create the gradient
color_gradient_function <- colorRampPalette( c( color_A, color_B ) )

# Generate a vector with a specified number of steps between the colors
color_vector <- color_gradient_function( 10 )

# Optional function to display results
display_colors <- function( color_vector ) {
  N = length( color_vector )
  plot( 1:N, 1:N, pch = 15, cex = 5, col = color_vector, 
    bty = 'n', xaxt = 'n', yaxt = 'n', xlab = '', ylab = '' )
}
display_colors( color_vector )
```

Return to:
[FAQ](C06_P000_FAQ.md);
[Sections](C00_P002_Chapters.md);
[Home page](https://rettopnivek.github.io/R_training/)

