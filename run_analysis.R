## Loading these packages for the melt and ddply functions.  Install if necessary
library("plyr")
library("reshape2")

## Load list of features 
features <- read.table("./UCI HAR Dataset/features.txt")

## Load the test data into a table
test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")
## Set the features as the column names for the test data table
## Part of Step 4 of assignment to label the data set
colnames(test_data) <- features[,2]
## Load the test subjects table and set the column name
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
colnames(test_subject) <- c("subject")
## Load the test activities and set the column name
test_activities <- read.table("./UCI HAR Dataset/test/Y_test.txt")
colnames(test_activities) <- c("activity")
## Combine the three test data tables into one
test_data <- cbind(test_subject, test_activities, test_data)

## Load the training data into a table
training_data <- read.table("./UCI HAR Dataset/train/X_train.txt")
## Set the features as the column names for the training data table
## Part of Step 4 of assignment to label the data set
colnames(training_data) <- features[,2]
## Load the training subjects table and set the column name
training_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(training_subject) <- c("subject")
## Load the training activities and set the column name
training_activities <- read.table("./UCI HAR Dataset/train/Y_train.txt")
colnames(training_activities) <- c("activity")
## Combine the three training data tables into one
training_data <- cbind(training_subject, training_activities, training_data)

## Merge the test and training data tables into one huge table for Step 1 of assignment
combined_data <- rbind(test_data, training_data)

## Convert the activity numbers into descriptive names for Step 3 of assignment
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
factors <- factor(combined_data$activity)
levels(factors) <- activity_labels[,2]
combined_data$activity <- factors

## Extracts only the measurements on the mean and standard deviation for each measurement
## for Step 2 of assignment
mean_std <- cbind(combined_data[, 1:2], combined_data[, grepl("mean()", names(combined_data), fixed=TRUE) 
                                                           | grepl("std()", names(combined_data), fixed=TRUE)])

## Edit the variable names so that they're more descriptive
## part of Step 4 of assignment
names(mean_std) <- tolower(names(mean_std))
names(mean_std) <- gsub("\\()", "", names(mean_std))
names(mean_std) <- gsub("^t", "time", names(mean_std))
names(mean_std) <- gsub("^f", "frequency", names(mean_std))
names(mean_std) <- gsub("acc", "accelerometer", names(mean_std))
names(mean_std) <- gsub("gyro", "gyroscope", names(mean_std))
names(mean_std) <- gsub("mag", "magnitude", names(mean_std))
names(mean_std) <- gsub("-x", "-xaxis", names(mean_std))
names(mean_std) <- gsub("-y", "-yaxis", names(mean_std))
names(mean_std) <- gsub("-z", "-zaxis", names(mean_std))
names(mean_std) <- gsub("bodybody", "body", names(mean_std))


## melt the data table into four columns containing subject, activity, measured variable, and value of variable
## for given subject and activity combination
melted <- melt(mean_std, id.vars = c("subject", "activity"))


## Create a second, independent tidy data set with the average of each variable for each activity and each subject 
## then writes the table to tidydata.txt in your working directory
## for Step 5 of assignment
tidy <- ddply(melted, c("subject", "activity", "variable"), summarise, average = mean(value))
write.table(tidy, "./tidydata.txt", row.names=FALSE)