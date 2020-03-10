## Progress Bars in R

Here is an example of creating a simple text progress bar in R to track the progress of a loop:

```R
# Specify the maximum number of iterations
total <- 10

# Create a progress bar using a base R function
pb <- txtProgressBar( min = 1, max = total, style = 3 )

# Loop over cases
for (i in 1:total) {
    # Update the progress bar
    setTxtProgressBar(pb,i)
}
close(pb)
rm(pb)
```

The third style is nice because it also shows the percentage and indicates both the start and end of the progress bar.

[Return to sections](C00_P002_Chapters.md)
