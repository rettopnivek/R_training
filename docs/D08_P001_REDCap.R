# TITLE
# Written by NAME
# email: EMAIL
# Please email me directly if you 
# have any questions or comments
# Last updated YYYY-MM-DD

# Table of contents
# 1) Initial setup
# 2) Download data from REDCap

###
### 1) Initial setup
###

# Set working directory to correct location 
# via file menu:
# Session -> Set Working Directory -> To Source File Location

# Package for downloading data from 
# REDCap projects
# install.packages( 'REDCapR' )
library( REDCapR )

###
### 2) Download data from REDCap
###

# Vector of file names
all_files <- dir()

# Check if .RData file does not exists
if ( !( "REDCap.RData" %in% all_files ) ) {
  # If not, download from REDCap
  
  # Read in API token
  token <- scan( file = "API_token.txt", what = character() )
  
  # Use the REDCapR package to download full data set as data frame
  dwnld <- redcap_read( 
    redcap_uri = "https://redcap.partners.org/redcap/api/", 
    token = token,
    raw_or_label = "label"
  )
  
  # Extract data
  raw_dat <- dwnld$data
  
  # Column names
  cn <- colnames( raw_dat )
  
  # Save results
  save( raw_dat, cn,
        file = "REDCap.RData"
  )
  
  # Clean up workspace
  rm( token, dwnld )
  
} else {
  # Read in previously downloaded data
  
  load( file = "REDCap.RData" )
}

# Clean up workspace
rm( all_files )
