## R packages

R packages allow users to extend the base functionality of R for their own purposes or for others in the community. An R package is a collection of code, data, documentation, and tests that can be easily shared with others. The __Comprehensive R Archive Network__, or 'CRAN', provides an official [repository](https://cran.r-project.org/) for these packages. There are other repositories for specific fields (e.g., [bioconductor](https://www.bioconductor.org/)), and today users can also easily share their packages via [Github](https://github.com/).

Installing and using an R package is very straightforward, and some R packages (e.g., 'dplyr' and 'ggplot2') have become a standard part of the regular R user's toolset.

### Table of contents
1. Installing an R package
2. Managing installed packages
3. Using packages
4. Additional resources

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
devtools::install_github("github_username/name_of_repository")
```

#### 2. Managing installed packages

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

#### 3. Using packages

Forthcoming

#### 4. Additional resources

Forthcoming

[Return to sections](C00_P002_Chapters.md)
