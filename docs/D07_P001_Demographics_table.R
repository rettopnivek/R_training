```R
# Demographics table example
# Written by Kevin Potter
# email: kevin.w.potter@gmail.com
# Please email me directly if you 
# have any questions or comments
# Last updated 2019-10-22

# Table of contents
# 1) Initial setup
# 2) Define functions
#   2.1) process_find_unique_val
#   2.2) process_race
#   2.3) data_ids
#   2.4) data_univariate
#   2.5) result_summary
# 3) Download data from REDCap
# 4) Data processing
#   4.1) Extract columns of interest
#   4.2) Define/adjust columns
#     4.2.1) Label those who withdrew
#     4.2.2) Visit modality
#     4.2.3) Phase
#     4.2.4) Propogate values
#     4.2.5) Additional processing
#   4.3) Filter data
# 5) Descriptive statistics
#   5.1) Extract subject-level summaries
#   5.2) Table of summary statistics by group
#     5.2.1) Example - Age of patients
#     5.2.2) Example - Percentage of patients who were male
#     5.2.3) Example - Multiple outcomes
# 6) Statistical analyses
#   6.1.1) t-test
#   6.1.2) Linear regression
#   6.1.3) One-way ANOVA

###
### 1) Initial setup
###

# Set working directory to correct location 
# via file menu:
# Session -> Set Working Directory -> To Source File Location

# Save pathway for current working directory
cur_dir <- getwd()

# Install/load in packages

# Package for manipulating data frames
# install.packages( 'dplyr' )
library( dplyr )

# Package for working with character 
# strings
# install.packages( 'stringr' )
library( stringr )

# Package for downloading data from 
# REDCap projects
# install.packages( 'REDCapR' )
library( REDCapR )

###
### 2) Define functions
###

# 2.1) 
process_find_unique_val <- function( variable, 
                                     entries, 
                                     variable_2 = NULL,
                                     default = NA ) {
  # Purpose:
  # Extracts the unique value to propogate over all 
  # entries for a variable (or pair of variables)
  # Arguments:
  # variable   - The column variable to process
  # entries    - A logical vector equal to TRUE for 
  #              the entries belonging to a specific 
  #              subject
  # variable_2 - An optional secondary column variable 
  #              for which entries may have been provided
  # default    - The default output to return in the case 
  #              of missing values
  # Returns:
  # A unitary value.
  
  # Initialize output
  out <- default
  
  # Check for missing data over range of entries for subject
  no_missing <- 
    entries & 
    !is.na( variable ) & 
    variable != ""
  
  # If entry provided, set output to unique value
  if ( any( no_missing ) ) {
    out <- unique( variable[no_missing] )[1]
  } else {
    # If entries were potentially provided in an additional 
    # variable
    if ( !is.null( variable_2 ) ) {
      
      # Check for missing data with second variable
      no_missing <- 
        entries & 
        !is.na( variable_2 ) & 
        variable_2 != ""
      
      # If entry provided, set output to unique value
      if ( any( no_missing ) ) {
        out <- unique( variable[no_missing] )[1]
      }
      
    }
  }
  
  # Return output
  return( out )
}

# 2.2) 
process_race <- function( race_vrb, multi_race, entries ) {
  # Purpose:
  # Function to convert set of checkboxes for racial categories 
  # into a single racial category for a given subject
  # Arguments:
  # race_vrb   - A data frame with columns per each checkbox
  # multi_race - A vector with the number of checkboxes that were 
  #              selected (will be > 1 for multi-racial identification)
  # entries    - A logical vector equal to TRUE for 
  #              the entries belonging to a specific 
  #              subject
  # Returns:
  # A character string
  
  # Initialize output
  out <- ""
  
  # First, check if any racial category was provided
  any_race_entries <- any( multi_race[entries] > 0 )
  
  if ( any_race_entries ) {
    
    # Next, check if individual identified as 
    # multi-racial
    yes_multi_racial <- any( multi_race[entries] > 1 )
    
    if ( yes_multi_racial ) {
      out <- "Multi-racial"
    } else {
      
      # Determine which racial category was selected
      
      # Extract row with any completed checkboxes and 
      # convert to vector
      val <- as.vector( race_vrb[entries,][any_race_entries,][1,] )
      # Determine racial category that was selected
      out <- names( val )[ which( val == "Checked" ) ]
      # Process character string
      out <- str_replace(
        out,
        fixed( "DMG.Race." ),
        "" # Remove tagline
      )
      out <- str_replace(
        out,
        fixed( "Multi_racial" ),
        "Multi-racial" # Replace underscore with hyphen
      )
      out <- str_replace(
        out,
        fixed( "_" ),
        " " # Replace other underscores
      )
      
    }
    
  }
  
  return( out )
}

# 2.3)
data_ids = function( df, sel = NULL ) {
  # Purpose:
  # Lists subject IDs over the specified 
  # subset
  # Arguments:
  # df  - Output from the 'data_prep' function
  # sel - A logical vector matching in length 
  #       to the number of rows of 'df'
  # Returns:
  # A vector of subject IDs.
  
  if ( is.null( sel ) ) {
    sel = rep( T, nrow( dat ) )
  }
  
  out = dat %>% 
    filter( sel ) %>% 
    select( ID ) %>% 
    unlist() %>% 
    unique() %>% 
    as.vector
  
  return( out )
}

# 2.4) 
data_univariate = function( x,
                            f = length,
                            sel = NULL, 
                            excl = NA,
                            init = NA ) {
  # Purpose:
  # Function to compute a specified 
  # function with a univariate output 
  # over the chosen subset of data, 
  # with a default value in case 
  # of missing values.
  # Arguments:
  # x    - The outcome of interest
  # f    - The univariate statistic
  # sel  - Logical vector to subset the data
  # excl - Values to exclude
  # init - Default value to return
  # Returns:
  # A univariate output, or the defaut value.
  
  # Initialize output
  out = init
  
  # If there is any data
  if ( length( x ) > 0 ) {
    
    # If no logical vector is provided
    if ( is.null( sel ) ) {
      sel = rep( T, length( x ) )
    }
    
    # Excluded specified values
    if ( is.na( excl ) ) {
      sel = sel & !is.na( x )
    } else {
      sel = sel & x != excl
    }
    
    # If any data remains, apply function
    if ( any( sel ) ) {
      out = f( x[sel] )
    }
    
  }
  
  return( out )
}

# 2.5) 
result_summary <- function( est, p_val, 
                            alpha = .05, 
                            start = 'T', 
                            middle = '', 
                            end = '.',
                            units = '', 
                            digits = c( 1, 3 ) ) {
  
  sig <- 'a significant'
  if ( p_val > alpha ) {
    'no significant'
  }
  
  pstring <- round( p_val, digits[2] )
  if ( pstring == 0 ) {
    pstring <- paste0( 'p < 0.',
                       paste( rep( 0, digits[2] - 1 ),
                              collapse = '' ),
                       '1' )
  } else {
    pstring <- paste0( 'p = ', pstring )
  }
  
  val <- paste0(
    'Estimate = ',
    round( est, digits[1] ),
    units, 
    ', ',
    pstring
  )
  
  out <- paste0(
    start, 
    'here was ',
    sig,
    ' difference ',
    middle, 
    ' (',
    val, 
    ')',
    end
  )
  
  return( out )
}

###
### 3) Download data from REDCap
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

###
### 4) Data processing
###

# Indicate steps to conduct with data processing
steps_for_processing <- list(
  Remove_columns = TRUE,
  Filter_rows = TRUE,
  Clean_workspace = TRUE
)

# 4.1) Extract columns of interest

dat = raw_dat %>% 
  select(
    # Identifiers
    screen_id,
    subject_study_num,
    # Conditions
    redcap_event_name,
    mid_complete,
    group_assignment,
    condition,
    primary_cond_mm,
    visit_complete,
    icf,
    # Demographics
    #   Age
    age,
    age_hc,
    #   Gender
    gender,
    gender_hc,
    #   Education
    education,
    education_ea2895,
    education_years,
    education_a, 
    #   Race
    race___0, # American Indian/Native Alaskan
    race___1, # Asian
    race___2, # Black
    race___3, # Pacific Islander
    race___4, # White
    race___5, # Bi-racial
    race___6, # Unknown/Not reported
    race_2b3692___1, # American Indian/Native Alaskan
    race_2b3692___2, # Asian
    race_2b3692___3, # Black
    race_2b3692___4, # Pacific Islander
    race_2b3692___5, # White
    race_2b3692___6, # Bi-racial
    race_2b3692___7, # Unknown/Not reported
    #   Ethnicity
    hispanic,
    ethnicity
  )

# Rename variables to have more 
# consistent naming scheme for 
# easier processing
colnames( dat ) = c(
  # Identifiers
  "IDS.Screen",
  "IDS.Subject",
  # Conditions/Visit info
  "CND.REDCap_event_name",
  "CND.Scan_initial",
  "CND.Group_assignment_1",
  "CND.Primary_condition_1",
  "CND.Primary_condition_2",
  "CND.Visit_complete",
  "CND.Informed_consent_1",
  # Demographics
  #   Age
  "DMG.Age_1",
  "DMG.Age_2",
  "DMG.Gender_1",
  "DMG.Gender_2",
  #   Education
  "DMG.Education_level_1",
  "DMG.Education_level_2",
  "DMG.Education_years_1",
  "DMG.Education_years_2",
  #   Race
  "DMG.Race.Native_American",
  "DMG.Race.Asian",
  "DMG.Race.African_American",
  "DMG.Race.Pacific_Islander",
  "DMG.Race.Caucasian",
  "DMG.Race.Multi_racial",
  "DMG.Race.Unknown",
  "DMG.Race.Native_American.HC",
  "DMG.Race.Asian.HC",
  "DMG.Race.African_American.HC",
  "DMG.Race.Pacific_Islander.HC",
  "DMG.Race.Caucasian.HC",
  "DMG.Race.Multi_racial.HC",
  "DMG.Race.Unknown.HC",
  #   Ethnicity
  "DMG.Ethnicity_1",
  "DMG.Ethnicity_2"
)

# 4.2) Define/adjust columns

# 4.2.1) Label those who withdrew

# Add column to track subjects who withdrew from study
dat$CND.Withdrew <- NA

# Use labels as initial identification of those who withdrew

# Check if subject IDs contain the character string "_W"
sel <- str_detect(
  dat$IDS.Subject, # Vector of character strings
  "_W" # Pattern of interest
)
dat$CND.Withdrew[sel] <- TRUE

# The label "_W" attached to subject ID only at point when 
# subject withdrew, which can erroneously result in R treating 
# same subject ID as two separate IDs

# Therefore, remove the "_W" tag
dat$IDS.Subject <- str_replace(
  dat$IDS.Subject, # Vector of character strings
  "_W", # Pattern to find
  "" # Replacement pattern
)

# 4.2.1) Label time points

# Initialize variables
dat$CND.Time_point <- ""
dat$CND.Month <- NA # Numeric coding for months

# Can identify the study time points 
# by determining which REDCap event 
# names contain certain character strings

# Define time points
time_points <- c(
  "Recruitment", # i = 1
  "Screening",
  "Baseline",
  "Two weeks",
  "One month", # i = 5
  "Two months",
  "Three months",
  "Four months",
  "Five months",
  "Six months", # i = 10
  "Seven months",
  "Eight months",
  "Nine months",
  "Ten months",
  "Eleven months", # i = 15
  "One year",
  "Two years"
)
# Loop over time points
for ( i in 1:length( time_points ) ) {
  # Determine for which rows the REDCap event name 
  # contains the specified time point
  sel = str_detect(
    dat$CND.REDCap_event_name, # Vector of character strings
    time_points[i] # Pattern of interest
  )
  # Provide appropriate label
  dat$CND.Time_point[sel] <- time_points[i]
  
  # Use knowledge of increment variable to specify 
  # months
  dat$CND.Month[sel] <- i - 4
  # Special cases
  if ( i == 1 ) dat$CND.Month[sel] <- -2
  if ( i == 2 ) dat$CND.Month[sel] <- -1
  if ( i == 3 ) dat$CND.Month[sel] <- 0
  if ( i == 4 ) dat$CND.Month[sel] <- .5
  if ( i == 17 ) dat$CND.Month[sel] <- 24
  
}
# Special case for healthy controls
sel = str_detect(
  dat$CND.REDCap_event_name, 
  "MRI Scan"
)
# Label as baseline
dat$CND.Time_point[sel] <- "Baseline"
dat$CND.Month[sel] <- 0

# 4.2.2) Visit modality

# Initialize variable
dat$CND.Visit_modality <- "Phone call"

# In-person visits
sel = 
  str_detect( dat$CND.REDCap_event_name, "Visit" ) | 
  str_detect( dat$CND.REDCap_event_name, "V1" ) | 
  str_detect( dat$CND.REDCap_event_name, "V2" ) | 
  str_detect( dat$CND.REDCap_event_name, "V3" ) | 
  str_detect( dat$CND.REDCap_event_name, "V4" ) | 
  str_detect( dat$CND.REDCap_event_name, "V5" ) | 
  str_detect( dat$CND.REDCap_event_name, "V6" ) | 
  str_detect( dat$CND.REDCap_event_name, "V7" ) | 
  str_detect( dat$CND.REDCap_event_name, "Screening" )
dat$CND.Visit_modality[sel] <- "In person"

# 4.2.3) Phase

dat$CND.Phase <- ""

sel = str_detect( dat$CND.REDCap_event_name,
                  "Recruitment" )
dat$CND.Phase[sel] <- "Recruitment"
sel = str_detect( dat$CND.REDCap_event_name,
                  "Active" )
dat$CND.Phase[sel] <- "Active study"
sel = str_detect( dat$CND.REDCap_event_name,
                  "Pilot" )
dat$CND.Phase[sel] <- "Pilot"
sel = str_detect( dat$CND.REDCap_event_name,
                  fixed( "Healthy Control" ) )
dat$CND.Phase[sel] <- "Control"

# 4.2.4) Propogate values

# Data is in long format (i.e., each subject 
# has multiple rows corresponding to different 
# time points). However, for many static variables 
# (e.g., gender, racial group), only one row for 
# a subject will have an entry, making it difficult 
# to extract value/flag missing data

# Therefore, we will propogate values over all entries 
# for a subject

# Initialize variables
dat$CND.Informed_consent = NA
dat$CND.Primary_condition = ""
dat$CND.Primary_complaint = ""
dat$DMG.Age = NA
dat$DMG.Gender = ""
dat$DMG.Race = ""
dat$DMG.Ethnicity = ""
dat$DMG.Education_level = ""
dat$DMG.Education_years = ""

# Racial category is challenging to process, because 
# subjects can select multiple categories to reflect 
# a multi-racial background. For simplicity, we 
# can define a new category 'multi-race':

# Identify cases for race in which multiple checkboxes 
# were selected

# Column names
clm <- colnames( dat )
# Select all checkboxes for race
sel <- str_detect(
  clm, 
  fixed( 'DMG.Race.' )
)
# Checkboxes for active study partiipants
race_cat <- clm[sel][1:7]
# Checkboxes for healthy controls
race_cat_hc <- clm[sel][1:7+7]

# Use a base R function 'apply', which can apply a 
# function over each row of a matrix
multi_race <- apply(
  dat[,race_cat], # Matrix of checkbox results
  1, # Indicates to apply function over rows
  function(x) sum( x == "Checked" ) # Function to apply
)
multi_race_hc <- apply(
  dat[,race_cat_hc], 
  1,
  function(x) sum( x == "Checked" )
)

# Prep informed consent variable
sel <- 
  !is.na( dat$CND.Informed_consent_1 ) & 
  dat$CND.Informed_consent_1 == "Completed"
dat$CND.Informed_consent[sel] <- TRUE

# List of all assigned subject IDs
subj <- unique( dat$IDS.Subject )
# Remove cases where no ID was assigned
subj <- subj[ subj != "" ]

# Loop over subject IDs
for ( s in 1:length( subj ) ) {
  
  # Determine all entries for a subject 
  # using screen ID
  sel <- dat$IDS.Subject == subj[s]
  screen_id <- unique( dat$IDS.Screen[sel] )
  entries <- dat$IDS.Screen == screen_id
  
  # Propogate subject ID
  dat$IDS.Subject[entries] <- subj[s]
  
  # Propogate primary condition
  dat$CND.Primary_condition[entries] <- process_find_unique_val(
    dat$CND.Primary_condition_1,
    entries,
    default = ""
  )
  
  # Propogate primary complaint
  dat$CND.Primary_complaint[entries] <- process_find_unique_val(
    dat$CND.Primary_condition_2,
    entries,
    default = ""
  )
  
  # Propogate withdrawal status
  dat$CND.Withdrew[entries] <- process_find_unique_val(
    dat$CND.Withdrew,
    entries,
    default = FALSE
  )
  
  # Propogate informed consent status
  dat$CND.Informed_consent[entries] <- process_find_unique_val(
    dat$CND.Informed_consent,
    entries,
    default = FALSE
  )
  
  # Propogate age
  dat$DMG.Age[entries] <- process_find_unique_val(
    dat$DMG.Age_1,
    entries,
    variable_2 = dat$DMG.Age_2,
    default = NA
  )
  
  # Propogate gender
  dat$DMG.Gender[entries] <- process_find_unique_val(
    dat$DMG.Gender_1,
    entries,
    variable_2 = dat$DMG.Gender_2,
    default = ""
  )
  
  # Propogate education level
  dat$DMG.Education_level[entries] <- process_find_unique_val(
    dat$DMG.Education_level_1,
    entries,
    variable_2 = dat$DMG.Education_level_2,
    default = ""
  )
  
  # Propogate education (in years)
  dat$DMG.Education_years[entries] <- process_find_unique_val(
    dat$DMG.Education_years_1,
    entries,
    variable_2 = dat$DMG.Education_years_2,
    default = NA
  )
  
  # Propogate ethnicity
  dat$DMG.Ethnicity[entries] <- process_find_unique_val(
    dat$DMG.Ethnicity_1,
    entries,
    variable_2 = dat$DMG.Ethnicity_2,
    default = ""
  )
  
  # Propogate racial category
  
  sel <- any( str_detect( dat$IDS.Subject[entries], "_HC" ) )
  if ( !sel ) {
    # Active study participants
    dat$DMG.Race[entries] <- process_race(
      dat[,race_cat],
      multi_race,
      entries
    )
  } else {
    # Healthy controls
    dat$DMG.Race[entries] <- process_race(
      dat[,race_cat_hc],
      multi_race_hc,
      entries
    )
  }
  
}

# 4.2.5) Additional processing

# Remove unnecessary variables
if ( steps_for_processing$Remove_columns ) {
  sel <- 
    str_detect( clm, fixed( "_1" ) ) | 
    str_detect( clm, fixed( "_2" ) ) | 
    str_detect( clm, fixed( "DMG.Race." ) )
  dat <- dat %>% 
    select(
      -one_of( clm[sel] ),
      -CND.Scan_initial
    )
}

# Additional processing of withdrawal status
dat$CND.Withdrew[ is.na( dat$CND.Withdrew ) ] = FALSE

# Create logical vector indicating which subjects 
# were assigned IDs
dat$IDS.Assigned_ID <- dat$IDS.Subject != ""

# Simplify labels for ethnicity
sel <- str_detect(
  dat$DMG.Ethnicity,
  fixed( "Hispanic or Latino." )
)
dat$DMG.Ethnicity[sel] <- "Hispanic or Latino"

# Simplify labels for primary condition
sel <- str_detect(
  dat$CND.Primary_condition,
  "Affective"
)
dat$CND.Primary_condition[sel] = "Mood disorder"

# Adjust label for primary condition/complaint 
# for healthy controls
sel <- dat$CND.Phase == "Control"
dat$CND.Primary_condition[sel] <- "Healthy"
dat$CND.Primary_complaint[sel] <- "None"

# 4.3) Filter data

if ( steps_for_processing$Filter_rows ) {
  
  dat <- dat %>% 
    filter(
      # Only include subjects assigned an ID
      IDS.Assigned_ID & 
        # Drop pilot and healthy controls
        !( CND.Phase %in% c( "Pilot", "Control" ) ) & 
        # Exclude recruitment and screening cases
        !( CND.Time_point %in% c( "Recruitment", "Screening" ) ) & 
        # Exclude subjects without informed consent
        CND.Informed_consent & 
        # Exclude cases with no condition data
        CND.Primary_condition != ""
    )
}

# Clean up workspace of nuisance variables used for 
# data processing

if ( steps_for_processing$Clean_workspace ) {
  rm( i, sel, time_points, entries, subj, s, screen_id,
      race_cat, race_cat_hc, multi_race, multi_race_hc,
      raw_dat, cn, clm, process_find_unique_val, process_race,
      steps_for_processing )
}

###
### 5) Descriptive statistics
###

# 5.1) Extract subject-level summaries

sls <- dat %>% 
  group_by(
    IDS.Subject
  ) %>% 
  summarise(
    CND.CHR.Condition = data_univariate(
      CND.Primary_condition,
      f = unique,
      init = ""
    ),
    DMG.LGC.Sex = data_univariate(
      DMG.Gender == "Male",
      f = unique,
      sel = DMG.Gender != "",
      init = NA
    ),
    DMG.INT.Age = data_univariate(
      DMG.Age,
      f = unique,
      init = NA
    ),
    DMG.INT.Education_years = data_univariate(
      as.numeric( DMG.Education_years ),
      f = unique,
      init = NA
    ),
    DMG.LGC.Four_years_of_college_or_more = data_univariate(
      DMG.Education_level %in% c(
        "Graduated 4 year college",
        "Part graduate/professional school"
      ), 
      f = unique, 
      sel = DMG.Education_level != "",
      init = FALSE
    ),
    DMG.LGC.Ethnicity = data_univariate(
      DMG.Ethnicity == "Hispanic or Latino",
      f = unique, 
      sel = DMG.Ethnicity != "",
      init = FALSE
    ),
    DMG.LGC.Race_white = data_univariate(
      DMG.Race == "Caucasian",
      f = unique, 
      init = FALSE
    ),
    DMG.LGC.Race_black = data_univariate(
      DMG.Race == "African American",
      f = unique, 
      init = FALSE
    ),
    DMG.LGC.Race_other = data_univariate(
      !( DMG.Race %in% c( "Caucasian", "African American" ) ),
      f = unique, 
      init = FALSE
    )
  ) %>% 
  as.data.frame()
sls <- sls %>% 
  rename(
    IDS.CHR.Subject = IDS.Subject
  )

# 5.2) Table of summary statistics by group

# 5.2.1) Example - Age of patients

tbl <- sls %>% 
  group_by(
    CND.CHR.Condition
  ) %>% 
  summarise(
    N = length( IDS.CHR.Subject ),
    M = round( mean( DMG.INT.Age ), 1 ),
    SD = sd( DMG.INT.Age )
  ) %>% 
  as.data.frame()
# Standard error of the mean
tbl$SE <- tbl$SD/sqrt( tbl$N )
# Round values
tbl$SD <- round( tbl$SD, 1 )
tbl$SE <- round( tbl$SE, 1 )

print( tbl )

# 5.2.2) Example - Percentage of patients who were male

tbl <- sls %>% 
  group_by(
    CND.CHR.Condition
  ) %>% 
  summarise(
    N = length( IDS.CHR.Subject ),
    M = round( mean( DMG.LGC.Sex )*100 ),
    V = 100*mean( DMG.LGC.Sex )*( 1 - mean( DMG.LGC.Sex ) )
  ) %>% 
  as.data.frame()
print( tbl )
# Additional statistics
tbl$SD <- sqrt( tbl$V )
tbl$SE <- round( tbl$SD/sqrt( tbl$N ) )
# Drop variance
tbl <- tbl %>% select( -V )
# Round values
tbl$SD <- round( tbl$SD )
tbl$SE <- round( tbl$SE )

print( tbl )

# 5.2.3) Example - Multiple outcomes

# Variables to summarize over
vrb <- str_detect(
  colnames( sls ),
  fixed( "DMG." )
)
vrb <- colnames( sls )[vrb]
tbl <- sls %>% 
  group_by(
    CND.CHR.Condition
  ) %>% 
  summarise_at(
    vrb, 
    function(x) round( mean(x), 2 )
  ) %>% 
  as.data.frame()

print( tbl )

# Clean up workspace
rm( vrb )

###
### 6) Statistical analyses
###

# 6.1) Example - age of participants

# Data frame with observations to fit
dtba <- sls

# Create list of logical vectors for each level 
# of the categorical variable
sel <- lapply(
  unique( dtba$CND.CHR.Condition ),
  function(x) dtba$CND.CHR.Condition == x
)
names( sel ) <- unique( dtba$CND.CHR.Condition )

# 6.1.1) t-test

# Independent samples t-test

# Compared mood disorders against other two groups
res <- t.test(
  x = dtba$DMG.INT.Age[ sel$Pain | sel$Insomnia ],
  y = dtba$DMG.INT.Age[ sel$`Mood disorder` ],
  alternative = 'two.sided',
  var.equal = FALSE
)
print( res )

# You can also create a custom function to summarize the 
# results and paste them into a manuscript (which reduces 
# the risk of transcription errors):
result_summary(
  est = diff( res$estimate ), # Different in means for estimate
  p_val = res$p.value,
  middle = 'in age for those with versus without mood disorders',
  units = ' years'
)

# 6.1.2) Linear regression

lmf <- lm( DMG.INT.Age ~ CND.CHR.Condition, data = dtba )
# R automatically handles how to numerically code 
# the grouping factor

# Summary of the results (estimates, p-values, etc.)
res <- summary( lmf )

# Extracting results

# Regression coefficients
res$coefficients[,1] %>% round( 1 ) %>% cbind
lmf %>% coef %>% round( 1 ) %>% cbind

# T-statistic
res$coefficients[,3] %>% round( 2 ) %>% cbind

# p-values
res$coefficients[,4] %>% round( 3 ) %>% cbind

# Can create your own numeric coding schemes though

# Effects coding - test whether each level differs 
# from the grand mean

# Given K levels, initialize K - 1 variables
dtba$CND.INT.Condition_pain <- 0
dtba$CND.INT.Condition_sleep <- 0

# Coding for levels
dtba$CND.INT.Condition_pain[ sel$Pain ] <- 1
dtba$CND.INT.Condition_sleep[ sel$Insomnia ] <- 1

# Add reference level
dtba$CND.INT.Condition_pain[ sel$`Mood disorder` ] <- -1
dtba$CND.INT.Condition_sleep[ sel$`Mood disorder` ] <- -1

# Scaling and centering the predictors gives you 
# standardized effects
dtba <- dtba %>% 
  mutate(
    CND.INT.Condition_pain = scale( CND.INT.Condition_pain ),
    CND.INT.Condition_sleep = scale( CND.INT.Condition_sleep )
  )

lmf_2 <- lm( DMG.INT.Age ~ 
               CND.INT.Condition_pain + 
               CND.INT.Condition_sleep,
             data = dtba )
summary( lmf_2 ) # Intercept now represents the grand mean

# 6.1.3) One-way ANOVA

# Convert categorical variable to a factor
dtba <- dtba %>% 
  mutate(
    CND.FAC.Condition = as.factor( CND.CHR.Condition )
  )

# Conduct a linear regression
lmf <- lm( DMG.INT.Age ~ CND.FAC.Condition, data = dtba )

# Can conduct a one-way ANOVA via the 'ANOVA' command
print( anova( lmf ) )

# Clean up workspace
rm( lmf, lmf_2, sel, tbl, res, dtba )

```
