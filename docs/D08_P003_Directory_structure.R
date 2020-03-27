# Project directory template
# Written by Kevin Potter
# email: kevin.w.potter@gmail.com
# Please email me directly if you 
# have any questions or comments
# Last updated 2020-03-27

# To choose your main directory, click
# 'Session' in the file menu, select 
# 'Set working directory' and pick 
# 'Choose directory' to open the 
# browser window.

# Create list to keep track of directory structure
folder_pathways = list()

# Save pathway for RStudio project directory
folder_pathways$Project = getwd()

# Create directories for data
dir.create( 'Data' )
# Navigate into new folder
setwd( 'Data' )
# Save pathway
folder_pathways$Data = getwd()

# Create directory for raw data files
dir.create( 'Raw_data_files' )
# Navigate into new folder
setwd( 'Raw_data_files' )
# Save pathway
folder_pathways$Raw = getwd()

# Return to main directory
setwd( folder_pathways$Project )

# Create directory for R scripts
dir.create( 'R' )
# Navigate into new folder
setwd( 'R' )
# Save pathway
folder_pathways$R = getwd()

# Create directory for figures
dir.create( 'Figures' )
# Navigate into new folder
setwd( 'Figures' )
# Save pathway
folder_pathways$Figures = getwd()
# Return to R directory
setwd( folder_pathways$R )

# Create directory for documents
dir.create( 'Documents' )
# Navigate into new folder
setwd( 'Documents' )
# Save pathway
folder_pathways$Documents = getwd()
# Return to R directory
setwd( folder_pathways$R )

# Create directory for additional outputs
dir.create( 'Output' )
# Navigate into new folder
setwd( 'Output' )
# Save pathway
folder_pathways$Output = getwd()



