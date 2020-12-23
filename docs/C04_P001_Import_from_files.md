## Importing/exporting files in R

The first step with data processing is to load the data into R's workspace. R provides a large set of options to do so, and extensions exist that allow R to read in data files from other programs, including Excel, SPSS, SAS, and Matlab.

<a name="TOC"></a>
### Table of contents
1. <a href="#S01">Working with .RData files</a>
2. <a href="#S02">Working with .txt files</a>
3. <a href="#S03">Working with .csv files</a>
4. <a href="#S04">Read in .xlsx files</a>

<a href="#END">&#129147;</a>

<a name="S01"></a>
#### 1. Working with .RData files

R allows you to save the user-defined objects present in your current workspace as an '.RData' file, and to easily re-load these files at a later point:
```R
# Example user-defined objects
vec <- 1:3
string <- c( 'Cats', 'are', 'cute' )
df <- data.frame( A = vec, B = string, stringAsFactors = F )

# Save everything in workspace in current working directory
save.image( file = 'Filename.RData' )
# Save specified objects to a desired sub-folder
save( df, file = 'Sub_folder/Filename.RData' )

# Load in previous data
load( file = 'Filename.RData' )
load( file = 'Sub_folder/Filename.RData' )
```

*Note: A useful approach is to write a script to read the raw data in from its original format, process and clean the data, and then save the processed data (e.g., the resulting data frame) as a .RData file. In this way, you preserve the original raw data, but have a cleaned set of data that is particularly easy to read in via R.*

<a name="S02"></a>
#### 2. Working with .txt files

One can create simple text files using R via the 'write' function. A whole new text file can be created (or an old one overwritten), or lines can be added to an existing file. This provides a simple tool to, for example, log the results of a script for debugging purposes.
```R
# Create a vector of text
string = c( 'Hello world!', 'Here is a new line', 'Ad infinitum' )
# Save a text file in the current working directory
# (each string in the character vector is added as a new line)
write( string, file = 'Example.txt' )
# Add another line of text to the existing file
write( 'Post-hoc line', file = 'Example.txt', append = T )
```

Text files can be read into R as a character vector via the 'scan' command:
```R
# Create a text file
write( 'Hello world\nThis is a new line', file = 'Example.txt' )
# Read the text file back into R
chr_vec <- scan( file = 'Example.txt', what = 'character' )
# Each word read in as an element
print( chr_vec )
# Instead read in each line as an element
chr_vec_2 <- scan( file = 'Example.txt', what = 'character', sep = '\n' )
```

*Note: It is important to indicate to R that you will be reading in character strings. By default, 'scan' expects only numbers, and will throw an error if it encounters otherwise.*

There will cases in which you have data that is not formatted as a spreadsheet; 'scan' provides a flexible, robust way to still read in such data for subsequent processing.

However, it is easier to create and load data in spreadsheet form, via the commands 'write.table' and 'read.table':
```R
# Create data frame
df <- data.frame(
  Animal = c( 'Cat', 'Dog', 'Monkfish' ),
  Ranking = 1:3,
  stringsAsFactors = F
)
# Save as a '.txt' spreadsheet
write.table(
  df, # Data frame or matrix
  file = 'Example.txt', # File name
  sep = ' ', # Delimiter separating columns
  row.names = F, # Don't include row labels
  quote = F # Don't place quotations around entries
)
# Read text file back in as a data frame
df_2 <- read.table(
  file = 'Example.txt', # File name
  sep = ' ', # Delimiter separating columns
  header = T, # First line used for column names
  stringsAsFactors = F
)
```

The 'write.table' and 'read.table' commands provide general-purpose functions to read in spreadsheets, and allow the user a high degree of control over aspects such as the delimiter separating columns. R has even more specialized functions for common file types, in particular comma-delimited files.

<a name="S03"></a>
#### 3. Working with .csv files

Comma-delimited files (.csv) provide a very easy data format to read in or create, and are especially useful when you need to save data in a format that can be processed by a wide variety of programs. R provides the 'write.csv' and 'read.csv' functions specifically for these type of files. These functions work similarly to 'write.table' and 'read.table', but assume the delimiter is a comma:
```R
# Create data frame
df <- data.frame(
  Food = c( 'Cake', 'Ice cream', 'Vegetables' ),
  Ranking = 1:3,
  stringsAsFactors = F
)
# Save as a '.csv' file
# No longer necessary to indicator column delimiter
write.csv(
  df, 
  file = 'Example.csv', 
  row.names = F, # Don't include row labels
  quote = F # Don't place quotations around entries
)
# Read text file back in as a data frame
df_2 <- read.csv(
  file = 'Example.csv', 
  header = T, # First line used for column names
  stringsAsFactors = F
)
```

<a name="S04"></a>
#### 4. Read in .xlsx files

Excel spreadsheets (i.e., .xls and .xlsx) are a proprietary format, and R can't by default read in these types of files. Fortunately, several R packages exist that resolve this issue. For example, Hadley Wickham's 'readxl' package provides straightforward tools to read in Excel files without requiring any external dependencies:
```R
# Install package
install.packages("readxl")
# Load in package
library( readxl )

# When an Excel file file has multiple sheets, 
# indicate which sheet to read in via the 
# sheet name or by its index number

# Specify sheet by its name
df <- read_excel( 
  path = "Example.xlsx", 
  sheet = "Name",
  na = "" # Allows customizing of what to treat as missing data
)
  
# Specify sheet by its index
df <- read_excel( 
  path = "Example.xlsx", 
  sheet = 2
)

```

<a href="#TOC">&#129145;</a>

<a name="END"></a>
Return to:
[Data processing](C04_P000_Data_processing.md);
[Sections](C00_P002_Chapters.md);
[Home page](https://rettopnivek.github.io/R_training/)

