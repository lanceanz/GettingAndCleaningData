# README for repo GettingAndCleaningData
Project assignment for Coursera "Getting and Cleaning Data"  
Author: Lance Andrewes

##Files Included
This repository contains the following files as the requirements of the Getting and Cleaning Data Course Project:
* README.md,         this file, describing how the R script is used  
* CodeBook.md,       description of the variables, the data, and transformations done to clean the data 
* run_analysis.R,    the script that was run  
* tidy.txt,          the output of the R script  

##Instructions for using the R script
1. The script assumes that the Samsung data files are in your working-directory. They must not be in subfolders of the working-directory.
To validate this requirement, run command `list.files(pattern="*.txt")` from the R console. The result must include the following files:

    > list.files(pattern="*.txt")  
    [1] "activity_labels.txt" "features.txt"        "features_info.txt"  
    [4] "subject_test.txt"    "subject_train.txt"   "X_test.txt"         
    [7] "X_train.txt"         "y_test.txt"          "y_train.txt"        
  
2. Execute 'run_analysis.R' and it will create file 'tidy.txt' in the working-directory.

3. Review file 'tidy.txt' in RStudio by executing the following commands:
    
    tidy <- read.table(tidy.txt, header = TRUE)
    View(tidy)


