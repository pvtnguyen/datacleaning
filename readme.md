The run_analysis.R script takes the Human Activity Recognition Using Smartphones Dataset 
from your working directory and performs the following actions:
	-Merges the training and test sets into the combined_data data frame
	-Extracts only the measurements on the mean and standard deviation for each
	 measurement and stores those into the mean_std data frame.  These 66 measurements include
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
	 The variables containing -meanFreq() were not included as the assignment asked
	 for just the mean and standard deviation for each measurement while the 
	 features_info.txt for the dataset defines meanFreq() as a different set of 
	 variables from mean() with a different formula used to obtain the values.
	-Uses the activity names defined in activity_labels.txt in place of activity numbers
	-Altered the mean and std variable names above to be more descriptive.  The new names
	 are listed in codebook.md with the following changes to the original names:
		-changed the names to all lower case
		-removed all "()"
		-changed leading "t"'s to "time"
		-changed leading "f"'s to "frequency"
		-changed instances of "acc" to "accelerometer"
		-changed instances of "gyro" to "gyroscope"
		-changed instances of "mag" to "magnitude"
		-changed instances of "-x", "-y", and "-z" to "xaxis", "yaxis", and "zaxis"
		-corrected instances of "bodybody" to just "body"
	-Creates the tidy.txt dataset which contains the average of each variable for each
	 activity and each subject.  The columns for tidy are "subject", "activity", "variable",
	 and "average".  30 subjects * 6 activities * 66 variables = 11880 observations.  More
	 information on the dataset can be found in codebook.md
	*The exact steps are detailed in the comments on run_analysis.R

In order to run the run_analysis.R script, you must have the UCI HAR Dataset folder in your working
directory and have the plyr and reshape2 packages installed.  To install these packages, run
the following commands in R.
install.packages("plyr")
install.packages("reshape2")

To run the script, run the command
source("<path of run_analysis.R>") where <path of run_analysis.R> is the path to the script, 
such as C:/WorkingDirectory/run_analysis.R
