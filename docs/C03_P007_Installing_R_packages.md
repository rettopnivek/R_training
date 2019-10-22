## Installing R packages

A major selling point of R is the fact that it has streamlined tools to allow advanced users to add their own code (e.g., new functions and features) to R, and easily make these extensions available to other R users. These extensions are known as __R packages__, and a core part of the R user experience is downloading __R packages__ to help solve specific problems.

### Table of contents
  
1. Installing a package
2. Using a package

#### 1. Installing a package

Fortunately, installing a R package is a fairly easy process. For example, suppose you want to download the R package 'dplyr', a package with useful functions and features to improve code readability and working with data frames. To install the latest version of this package:
```R
# Notice package name is in quotation marks
install.packages( "dplyr" )
```

R then handles the rest of the installation process for you! Sometimes, you will need to complete a prompt in which R asks whether you want to install a package based the 'source' version rather than the 'binary' versions - you can press the 'y' key to continue.

#### 2. Using a package

After installing an R package, using the code and features provided by the package involves some additional steps. By default, even after installing the package, the functions and features will not be made directly avaiable when you start R. You must first attach a package via the `library` command. Doing so tells R to add the functions and features of the package to the working environment.
```R
# Trying to call a function from 'dplyr' will 
# produce an error
# filter

# Load in package
library( dplyr )
# Now can safely call function from package
filter
```

[Return to sections](C00_P002_Chapters.md)

