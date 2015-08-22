# Course Project for Coursera "Getting and Cleaning Data"
# Author: Lance Andrewes
# Date: August 2015
#
# Project requirements for this R script:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#
# Assumptions: all source files must be in the working-directory 
#              (not in subfolders)

# Load all the source files
dfFeatures <- read.csv("features.txt", header = FALSE, sep = "")
dfActivity <- read.csv("activity_labels.txt", header = FALSE, sep = "")
dfxTEST <- read.csv("X_test.txt", header = FALSE, sep = "")
dfyTEST <- read.csv("y_test.txt", header = FALSE, sep = "")
dfsubjectTEST <- read.csv("subject_test.txt", header = FALSE, sep = "")#
dfxTRAIN <- read.csv("X_train.txt", header = FALSE, sep = "")
dfyTRAIN <- read.csv("y_train.txt", header = FALSE, sep = "")
dfsubjectTRAIN <- read.csv("subject_train.txt", header = FALSE, sep = "")
# Rename the columns in Activity to make things clearer when we merge it
colnames(dfActivity) <- c("ActivityClass", "Activity")

# Apply the column names to each of the main dataframes
colnames(dfxTEST) <- dfFeatures$V2
colnames(dfxTRAIN) <- dfFeatures$V2

# Note: until we have all the associated columns applied to the main
# dataframes, they must be kept in the original order.

# Append activity-class to the rows of the main dataframes
dfxTEST$ActivityClass <- dfyTEST$V1
dfxTRAIN$ActivityClass <- dfyTRAIN$V1

# Append the Subject identifiers to to main dataframes
dfxTEST$Subject <- dfsubjectTEST$V1
dfxTRAIN$Subject <- dfsubjectTRAIN$V1

# Merge the test and train dataframes (vertically)
# All columns match, so this is simple an rbind
dfALL <- rbind(dfxTEST, dfxTRAIN)

# Clear memory used by dataframes that we no longer need
rm("dfFeatures")
rm("dfsubjectTEST")
rm("dfsubjectTRAIN")
rm("dfxTEST")
rm("dfxTRAIN")
rm("dfyTEST")
rm("dfyTRAIN")

# Extract only measurements on the mean and standard deviation for each measurement, and ActivityClass and Subject
# Those chosen are the variable names containing "mean()" and "std()". 
# For further information on reasoning, see CodeBook.md
# Use regex to select the required variables. For safety, we surround ActivityClass
# and Subject with ^ $ to ensure only the whole words are found. "()" must be
# escaped as "\\(\\)".
dfMeanStd <- dfALL[, grep("mean\\(\\)|std\\(\\)|^ActivityClass$|^Subject$", names(dfALL))]

# Add the Activity names by looking-up the codes in the activity dataframe
# NOTE: Merge sorts the rows, but this is okay because we have added all row-position-dependent columns already.
dfMeanStdActivity <- merge(dfMeanStd, dfActivity, by.x = "ActivityClass", by.y = "ActivityClass")
# ActivityClass is no longer needed
dfMeanStdActivity$ActivityClass <- NULL

# Create a tidy dataframe with means of each variable, grouped by activity for each subject
library(dplyr)
dfTIDY <- dfMeanStdActivity %>% group_by(Subject, Activity) %>% summarise_each(funs(mean) )

# Complete the Project requirements by outputing the tidy data as a simple text file
write.table(dfTIDY, file = "tidy.txt", row.names = FALSE)
