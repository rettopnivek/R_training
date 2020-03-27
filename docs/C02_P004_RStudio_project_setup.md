## Best practices for organizing code, files, and folders

RStudio greatly streamlines the process of creating easily organized files and folders via the combination of RStudio projects and navigation tools like the 'Files' tab in the viewer pane. It is therefore highly recommended to take advantage of these features and develop a consistent set of practices for organizing and naming your files and folders, along with arranging and annotating your code, irrespective of the size of the project you are working on. In the following, I describe some guiding principles and provide examples of how to go about creating clean code and directory structures.

### Table of contents
1. Benefits of consistent organization and naming schemes
2. General recommendations

#### 1. Benefits of consistent organization and naming schemes

Using a modular file and folder organization, consistent naming practices, and annotating code (adding notes describing what the code does and how it works) have distinct benefits, improving reproducibility, readability, and ensuring faster implementation with fewer errors:
* Annotating code (especially complicated parts or parts that have non-intuitive names) will make it clearer what is trying to be achieved, allow new users to quickly understand your code, and prevent confusion later on.
* Labeling dependencies and requirements for your code to work (e.g., what R packages were used, and whether additional data files or R scripts are required) will make it easier to ensure you and others will be able to get the code to work later on.
* Consistent naming practices, both in files/folders and with your code, will make it easier for others to read and understand.
* Modular file organization (e.g., having a dedicated folder for data, another for R scripts, and another for output like figures or tables), makes it easier to locate files, and to isolate sources of errors or missing dependencies.

#### 2. General recommendations

While there are no ironclad rules on how to best write R code and organize your files, there are several helpful recommendations to bear in mind.

##### A) File and folder organization

Big projects can quickly end up with a large number of files and chunks of code, making organization key. However, it is good practice to have a clear organizational structure even for small projects. Some core ideas to consider are:
1. Create separate folders (labeled appropriately) for your data, R scripts, and outputs (figures, documents, and tables).
2. Use meaningful and intuitive file names (e.g., 'Script_to_process_raw_data.R' instead of 'script_01.R' )

##### B) Naming conventions when writing R code

When writing R code, you will need to often need create names and labels for variables, functions, and data. Some key things to remember are:
1. Use labels and names that are understandable (e.g., 'age_data' instead of 'ad').
2. Be consistent - choose a naming scheme (or set of naming schemes) and use them in the same way throughout a project.
3. If you need to use abbreviations or unintuitive variable names (either for the sake of conciseness or when variables or functions defined by others), annotate the code using the '#' symbol.

There are several types of naming conventions that you can find across a variety of coding scenarios. Below, I list 5 common ones:
* All lower case (e.g., myvariablename)
* Period separated (e.g., my.variable.name)
* Underscore separated (e.g., my_variable_name)
* Lower Camel case (e.g., myVariableName)
* Upper Camel case (e.g., MyVariableName)

Again, regardless of which type you pick (or combination), the most important thing to remember is to be consistent throughout your code.

[Return to sections](C00_P002_Chapters.md)


