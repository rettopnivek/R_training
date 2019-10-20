## The RStudio Graphical User Interface (GUI)

R is a programming language, and using R typically involves typing out commands into a console window, or running a script with a sequence of commands. However, a GUI does exist for R, to help streamline the process of saving/loading files, creating R data and script files, and setting internal options for R. Unfortunately, this GUI is somewhat barebones. Therefore, we will focus on the more feature-rich GUI provided by RStudio (which is most reminiscent of Matlab's interface).

RStudio provides four panes meant to display:
* The __Console__ window (for input and output when programming in R);
* The __Source__ window (where R scripts are shown);
* The __Environment__ window (listing variables and data currently available in the R workspace);
* The __Viewer__ window (e.g., for displaying figures).

*Note: You can edit the arrangment and content of these four panes by selecting 'Tools' in the file menu, and then selecting 'Global options'. In the pop-up window, click 'Pane layout' to change how you want your panes arranged).*

### The Console Window

The __Console__ window allows you to directly type commands for R to process. The __Console__ window then displays the results of these commands, or if you run a R script, the results of running all the commands listed in the script.

### The Source Window

The __Source__ window displays R script files. To create a new R script, go to 'File' in the file menu, click 'New file' and choose 'R Script' (*Note the keyboard shortcut option as well listed the right*). Multiple scripts can be open at once, in which case the __Source__ window provides a series of tabs with the file name associated with each script. Clicking on a tab displays that given script in the __Source__ window, and you can then edit the script at your leisure.

At the top right of the __Source__ window, there are two buttons. If you set your cursor on a line with a command, or highlight a sequence of commands, you can tell R to process this selection of commands and display the results in the __Console__ window (i.e., 'run' the commands) by clicking 'Run'. To run the entire set of commands in a R script, you can click on the 'Source' button. At the top left of the __Source__ window, there are additional buttons to help with writing scripts. Two of the most useful are the 'Save' button (the floppy disk icon), and the 'Search' option (the magnifying glass). Also, by default RStudio provides code highlighting, using different color schemes to make R code more readable and easy to understand.

*Note: You can change the style and appearance of the code highlighting in the 'Global options' pop-up window under the 'Appearances' tab. You can also change indenting and auto-complete options in the 'Code' tab.*
