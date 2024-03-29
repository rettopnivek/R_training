## R packages

R packages allow users to extend the base functionality of R for their own purposes or for others in the community. An R package is a collection of code, data, documentation, and tests that can be easily shared with others. The __Comprehensive R Archive Network__, or 'CRAN', provides an official [repository](https://cran.r-project.org/) for these packages. There are other repositories for specific fields (e.g., [bioconductor](https://www.bioconductor.org/)), and today users can also easily share their packages via [Github](https://github.com/).

Installing and using an R package is very straightforward, and some R packages (e.g., 'dplyr' and 'ggplot2') have become a standard part of the regular R user's toolset.

<a name="TOC"></a>
### Table of contents
1. <a href="#S01">Installing an R package</a>
2. <a href="#S02">Using packages</a>
3. <a href="#S03">Managing installed packages</a>
4. <a href="#S04">Additional resources</a>

<a href="#END">&#129147;</a>

<a name="S01"></a>
#### 1. Installing R packages

To install a package available in R's primary repository, __CRAN__, you can use a base R function:
```R
# Install R package "package_name"
install.packages("package_name")
```
R will then determine if the specified package is available in the repository and for your version of R, and if so, will install the package along with any additional dependencies (i.e., other R packages). If you run this command using base R, you will be prompted to select a __CRAN Mirror__, which refers to a specific server that is part of the CRAN network. You will be shown a list of locations - simply select the location nearest to you. Note that RStudio automates this step for you!

*Note: some R packages will require additional software outside the scope of R, such as a C++ compiler, that will require separate installation.*

Multiple packages can be installed at the same time:
```R
install.packages("first_package", "second_package")
```

For more flexibility in installing packages (e.g., installing packages available in other repositories, such as Github), you can use the [devtools](https://cran.r-project.org/web/packages/devtools/index.html) package:
```R
# First install the 'devtools' package
install.packages("devtools")
# Install a package available on Github
devtools::install_github(
  "github_username/name_of_repository"
)
```

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S02"></a>
#### 2. Using packages

By default, even after installing an R package, the data and functions included in this package will not be available for use when you start an R session. You must first load the package into memory, typically via the __library__ command.

*Note: the 'library' command is so named to allude to how packages are stored in a library that you can access.*

```R
# Load a package in for use
library( 'package_name' )
# Quotations are not necessary
library( package_name ) # Will also work
```

There are some additional commands that can be helpful:
```R
# Get location on computer where packages are installed
.libPaths()
# See all packages installed
library()
# See packages currently loaded
search()
```

*Note: it is possible to access a function from a package without loading the package first, via the '::' notation. If you have the function 'foo' which is part of an already installed package 'pck', the command 'pck::foo()' will allow you to run the function.*

Furthermore, RStudio provides a pane that allows you see what packages you have installed, and allows you load/unload these packages by clicking a check box.

<a href="#TOC">&#129145;</a> <a href="#END">&#129147;</a>

<a name="S03"></a>
#### 3. Managing installed packages

R provides a range of commands to manage your installed packages, including commands to list, uninstall, and update packages.
```R
# List of all packages that have been installed
installed.packages()
# Remove an installed package
remove.packages("package_to_remove")
# List packages that are out-of-date
old.packages()
# Update all installed packages
update.packages()
# Update a specific package
install.packages("package_to_update")
```

<a name="S04"></a>
#### 4. Additional resources

* The R manual's [entry](https://cran.r-project.org/doc/manuals/r-release/R-intro.html#Packages) on packages.
* Hadley Wickham's [introduction](http://r-pkgs.had.co.nz/intro.html) to R packages.

<a href="#TOC">&#129145;</a>

<a name="END"></a>
Return to:
[Prerequisites](C01_P000_Prerequisites.md);
[Sections](C00_P002_Chapters.md);
[Home page](https://rettopnivek.github.io/R_training/)



