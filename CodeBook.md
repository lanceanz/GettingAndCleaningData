# Codebook for Course Project  
# Coursera "Getting and Cleaning Data"  
Author: Lance Andrewes  
Date: August 2015  

##Purpose of this codebook
This codebook describes the variables, the data, and processes performed to clean up the data prior to creation of the final output-file. The data descriptions are in most cases directly from the README.txt included with the source-data. See Acknowledgments below.

## Related files
* README.md,         describes how the R script is used, and how to view the final tidy data  
* run_analysis.R,    the script that is run to produce the tidy data
* tidy.txt,          the tidy output of the R script

##Source data
###Overview of the data
This analysis uses data collected from the sensors in Samsung smartphones. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
For each record it is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

### Source files
* activity_labels.txt - Links the class labels with their activity name
* features.txt - List of all features.
* features_info.txt - Shows information about the variables used on the feature vector.
* subject_test.txt - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* subject_train.txt - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* X_test.txt - Test set       
* X_train.txt - Training set
* y_test.txt - Test labels
* y_train.txt - Training labels
  
## Work done to clean the data
The source files were read and processed by a single R script `run_analysis.R`.
 
1. Source files were all read into dataframes. The main (sensor-data) files are X_test.txt and X_train.txt.
2. Column names were attached to the sensor-data dataframes.
3. The subject identifiers (i.e. the person carrying the smartphone) and their activity classes (numeric) were then attached to the sensor-data.
4. The descriptive activity names were merged into the sensor-data according to the numeric activity classes.
5. The mean and standard deviation columns were extracted into a new dataframe, along with the columns identifying the subject (person) and their activity. Only those variables containing the strings "mean()" and "std()" were chosen, based on the variable descriptions in file "features_info.txt" (included with the source data).
6. The averages of the selected variables were calculated, grouped by subject and their activity. 
7. The resulting analysis was saved as tidy.txt.

## Variables in final output 'tidy.txt'

"Subject"  - numeric identifier of the person carrying the smartphone    
"Activity"  - description of the activity being performed by the person carrying the smartphone  
  
The remaining variables are the mean of each sensor variable by each Activity performed by each Subject (person). Two sensors are involved - an accelerometer ("Acc") and a gyroscope ("Gyro"), both providing measurements in X, Y, and Z axes. Gravimetric variables ("Gravity") were also derived from the accelerometer.  
  
"tBodyAcc-mean()-X"  
"tBodyAcc-mean()-Y"  
"tBodyAcc-mean()-Z"  
"tBodyAcc-std()-X"  
"tBodyAcc-std()-Y"  
"tBodyAcc-std()-Z"  
"tGravityAcc-mean()-X"  
"tGravityAcc-mean()-Y"  
"tGravityAcc-mean()-Z"  
"tGravityAcc-std()-X"  
"tGravityAcc-std()-Y"  
"tGravityAcc-std()-Z"  
"tBodyAccJerk-mean()-X"  
"tBodyAccJerk-mean()-Y"  
"tBodyAccJerk-mean()-Z"  
"tBodyAccJerk-std()-X"  
"tBodyAccJerk-std()-Y"  
"tBodyAccJerk-std()-Z"  
"tBodyGyro-mean()-X"  
"tBodyGyro-mean()-Y"  
"tBodyGyro-mean()-Z"  
"tBodyGyro-std()-X"  
"tBodyGyro-std()-Y"  
"tBodyGyro-std()-Z"  
"tBodyGyroJerk-mean()-X"  
"tBodyGyroJerk-mean()-Y"  
"tBodyGyroJerk-mean()-Z"  
"tBodyGyroJerk-std()-X"  
"tBodyGyroJerk-std()-Y"  
"tBodyGyroJerk-std()-Z"  
"tBodyAccMag-mean()"  
"tBodyAccMag-std()"  
"tGravityAccMag-mean()"  
"tGravityAccMag-std()"  
"tBodyAccJerkMag-mean()"  
"tBodyAccJerkMag-std()"  
"tBodyGyroMag-mean()"  
"tBodyGyroMag-std()"  
"tBodyGyroJerkMag-mean()"  
"tBodyGyroJerkMag-std()"  
"fBodyAcc-mean()-X"  
"fBodyAcc-mean()-Y"  
"fBodyAcc-mean()-Z"  
"fBodyAcc-std()-X"  
"fBodyAcc-std()-Y"  
"fBodyAcc-std()-Z"  
"fBodyAccJerk-mean()-X"  
"fBodyAccJerk-mean()-Y"  
"fBodyAccJerk-mean()-Z"  
"fBodyAccJerk-std()-X"  
"fBodyAccJerk-std()-Y"  
"fBodyAccJerk-std()-Z"  
"fBodyGyro-mean()-X"  
"fBodyGyro-mean()-Y"  
"fBodyGyro-mean()-Z"  
"fBodyGyro-std()-X"  
"fBodyGyro-std()-Y"  
"fBodyGyro-std()-Z"  
"fBodyAccMag-mean()"  
"fBodyAccMag-std()"  
"fBodyBodyAccJerkMag-mean()"  
"fBodyBodyAccJerkMag-std()"  
"fBodyBodyGyroMag-mean()"  
"fBodyBodyGyroMag-std()"  
"fBodyBodyGyroJerkMag-mean()"  
"fBodyBodyGyroJerkMag-std()"  

## Acknowledgements
The datasets and documentation used in this course project were sourced from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
A full description of the data can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
The data is used according to the following License:  

### License
Use of this dataset in publications must be acknowledged by referencing the following publication [1]    
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012  
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.  
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


