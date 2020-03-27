# Directory navigation tools
# Written by Kevin Potter
# email: kevin.w.potter@gmail.com
# Please email me directly if you 
# have any questions or comments
# Last updated 2020-03-27

# Table of contents
# 1) List with pathways
# 2) Functions
#   2.1) go_to
#   2.2) load_package
#   2.3) file_present

###
### 1) List with pathways
###

# Check to see if variable 'folder_pathways' 
# already exisits - if it doesn't, create 
# variable
if ( !exists( 'folder_pathways' ) ) {
  
  # Location of R scripts
  folder_pathways = list(
    R_scripts = getwd()
  )
  # Project folder
  setwd( '..' )
  folder_pathways$Project = getwd()
  
  # Folder for data
  setwd( 'Data' )
  folder_pathways$Data = getwd()
  
  # Raw data files
  setwd( 'Raw_data_files' )
  folder_pathways$Raw_data_files = getwd()
  
  # Add labels/abbreviations for paths
  folder_pathways$Path_labels = 
    list(
      Project = c( 'Project', 'project', 'proj', 'Proj' ), 
      R_scripts = c( 'R', 'R scripts', 'r', 'r scripts', 'scripts' ),
      Data = c( 'Data', 'data', 'dat', 'Dat' ),
      Raw_data_files = c( 'Raw', 'raw', 'Raw data', 'raw data' )
    )
}

###
### 2) Functions
###

# 2.1) 
go_to = function( path ) {
  # Purpose:
  # Navigates to the specified folder.
  # Arguments:
  # path            - Label for desired folder to navigate to
  
  # Extract stored paths
  nms = names( folder_pathways )
  nms = nms[ nms != 'Path_labels' ]
  # Extract labels/abbreviations for each path
  lbls = folder_pathways$Path_labels
  
  # Function to check if a string is 
  # present in vector of strings
  is_in = function( x, labels ) {
    return( x %in% labels )
  }
  
  location = ""
  
  # Loop over possible paths
  for ( i in 1:length( nms ) ) {
    
    if ( path %in% lbls[[ nms[i] ]] ) {
      # Save path for future navigation
      location = folder_pathways[[ nms[i] ]]
      
    }
    
  }
  
  if ( location == "" ) {
    stop( 'Label/abbreviation for folder path not available',
          call. = F )
  } else {
    setwd( location )
  }
  
}

# 2.2)
load_package = function( package_name,
                         from = 'CRAN',
                         repo = NULL, 
                         ... ) {
  # Purpose:
  # Checks if a package is installed, and if not,
  # sees if it can be installed. Then, loads the 
  # package for easy use.
  # Arguments:
  # package_name - A character string with the package 
  #                name
  # from         - Where to download the package from;
  #                Options include...
  #                [1] 'CRAN'
  #                [2] 'Github'
  # repo         - An optional character string with the 
  #                Github repository name
  #                (in the form 'username/repository');
  #                If NULL, assumes the username is 
  #                'rettopnivek' and that the
  #                repository is 'package_name'
  # ...          - Additional parameters for the 
  #                'devtools' installation functions
  
  # List of packages that are installed
  installed_packages = installed.packages()[,1]
  
  if ( !( package_name %in% installed_packages ) ) {
    
    # Install package via 'devtools' package
    
    # Check if 'devtools' is installed
    if ( !( 'devtools' %in% installed_packages ) ) {
      install.packages( 'devtools' )
    }
    
    # Installs package from CRAN repository
    if ( from == 'CRAN' ) {
      devtools::install_cran( package_name, ... )
    }
    
    # Installs package from Github repository
    if ( from == 'Github' ) {
      if ( is.null( repo ) ) {
        repo = paste0( "rettopnivek/", package_name )
      }
      devtools::install_github( repo, ... )
    }
    
  }
  
  # Load installed package for use
  library( package_name, character.only = T )
  
}

# 2.3) 
file_present = function( string, 
                         output = 'Logical' ) {
  # Purpose:
  # Checks if a file is present in the current 
  # working directory.
  # Arguments:
  # string - A file name or part of a file name to 
  #          search for
  # outout - Character string, either...
  #          'Logical', 'Vector', 'Index', or 'Name'
  # Returns:
  # Either...
  # [1] A logical value, TRUE if the file is present;
  # [2] A logical vector;
  # [3] The index for the file if it exists;
  # [4] The file name.
  
  # All files and folders present 
  # in working directory
  all_files = dir()
  
  # Determine if file name is present 
  # in list of files/folders
  check = grepl( string, all_files, fixed = T )
  
  # Output
  if ( output %in% c( 'Logical', 'logical' ) ) {
    return( any( check ) )
  }
  if ( output %in% c( 'Vector', 'vector', 'vec' ) ) {
    return( check )
  }
  if ( output %in% c( 'Index', 'index' ) ) {
    return( which( check ) )
  }
  if ( output %in% c( 'Name', 'name' ) ) {
    if ( any( check ) ) {
      return( all_files[ check ] )
    } else {
      return( NULL )
    }
  }
  
}

# Return to R scripts directory
go_to( 'R' )


