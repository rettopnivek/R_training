## RStudio Projects

When using R and RStudio for data processing and analysis, often you will end up with a large number of files (such as R scripts, data, figures, tables, and reports). RStudio provides a useful feature to make it easier to organize and track files associated with a given analysis, the __RStudio Project__.

### Table of contents
1. Creating an RStudio Project
2. RStudio Project features

#### 1. Creating an RStudio Project

There are multiple ways to create an RStudio project. First, click on the 'File' tab, and select 'New Project' in the pulldown menu. You then are presented with multiple options:

1. 'New Directory' - RStudio will create a new folder and associate the project with the folder. You can then create/add all files that you want associated with the project in this new folder.
2. 'Existing Directory' - RStudio will let you convert an existing folder into an RStudio project. This is useful if you already have a folder with your R scripts and you would like to organize them better.
3. 'Version Control' - An advanced option that allows you to use software like Git and to associate an RStudio project with a Github repository. This allows you to track changes to your scripts and files and restore them to a previous version if something goes awry. It also provides an easy way to share your files with other people. Additionally, RStudio provides a simple and user friendly graphical interface for version control.

*Note: Here is a useful [guide](https://happygitwithr.com/rstudio-git-github.html) on how to link an RStudio project to a Github repository.*

Once you select the appropriate option, follow the on-screen prompts to finish creating your project.

#### 2. RStudio Project features

Once you have created an RStudio project, a new Rstudio session specifically associated with the project will load. You can load in sessions associated with previous projects via the 'Open Project' option in the 'File' tab. You can also open a separate window with a new session associated with a different RStudio project via the 'Open Project in New Session' option in the 'File' tab.

RStudio projects are helpful because of several useful tracking features. For example:

* You can quickly change R's working directory to the location of the project directory via the 'Set Working Directory' pulldown menu in the 'Session' tab.
* You can have RStudio save the R workspace associated with the project, and then have RStudio reload this workspace every time you open the project.
* RStudio will automatically track R scripts and other files opened in the 'Source' pane and re-open these files when you reload the project.

[Return to sections](C00_P002_Chapters.md)


