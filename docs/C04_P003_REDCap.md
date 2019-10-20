## Import data from REDCap

A large amount of the projects I currently work on store their data on [REDCap](https://www.project-redcap.org/). Especially with large, multi-year projects, it can be challenging to extract and process data from REDCap. Fortunately, several options exist for downloading data from REDCap and loading it into R. We will focus on a streamlined and user-friendly R package, 'REDCapR'.

### Table of contents
1. Prerequisites
2. The REDCapR package

#### 1. Prerequisites

To download data from REDCap via scripting methods, you first need to know two things:
1. The API URL associated with your work organization. For example, with organizations associated with Partners, this url is https://redcap.partners.org/redcap/api/.
2. The API token associated with the project from which you'd like to download data. A token is generated by the REDCap administrators and connects your user account to specific REDCap projects (therefore, multiple projects will require a separate token for each one).

Obtaining a token will typically require contacting the REDCap administrators in your organization, and may require additional training before you are allowed to obtain one. Since REDCap projects usually contain confidential information, such as patient health information (PHI), best practice entails taking appropriate steps to make sure your token is not shared or exposed to others.

Another important consideration is the level of access you have with data in the project. For example, you may only be able to download de-identified data, and as such cannot download the full data set.

#### 2. The REDCapR package

Once you have obtained an API token linked to the specific project, the helper functions included in the REDCapR package greatly simplify the process of downloading the full data set from REDCap directly into R.
```R
# Install the 'REDCapR' package
install.packages( 'REDCapR' )
# Load in package
library( REDCapR )

# Read in API token
token = scan( file = "API_token.txt", what = character() )
  
# Use the REDCapR package to download full data set as data frame
dwnld = redcap_read( 
  redcap_uri = "https://redcap.partners.org/redcap/api/", 
  token = token,
  raw_or_label = 'label'
)
# Extract data frame
raw_dat = dwnld$data
  
# Extract column names
cn = colnames( raw_dat )

# Save results as .RData
save( raw_dat, cn, file = 'REDCap_data.RData' )
```

Downloading, especially for large projects, can be slow and take a few minutes. Data is downloading is smaller chunks, and R will provide a progress report for each chunk, the most important part being a status code. If there are no issues while downloading data, the status code will be '200'.
