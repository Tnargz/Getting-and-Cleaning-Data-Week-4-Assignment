Getting and Cleaning Data Week 4 Assignment Read Me

The purpose of the Week 4 Assignment repo is to finish the final assignment of the Getting and Cleaning Data Coursera course.  Below are the steps to replicate the work done to tidy the raw data.
* Download and unzip the raw data to a R directory.
* Download R source code to same R directory.
* Run the R source code to create a clean data file.

Raw Data Description
The data X variables are sensor signals from a waist mounted smartphone from 30 participants. The data y variables are the activities done by the participants while being recorded.

Code Explanation
The code will combine the test data set and the train data set and merge specific variables to create a new data set with the average and standard deviation for each activity.

Clean Data Description
The clean data contains the mean and standard deviation of each variable merged from the code.

Explanation of R code used to complete assignment
The Goal was to read “test” and “training data” into R environment. Then read the respective variables to the R environment. Finally, to read the subject index to the R environment.
1. Merges the training and the test set to create one data set. cbind was used to merge test and train x, y, z, and subject data sets. rbind is then used to combine test and train into one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. grepl is used to index variable names for mean() or std().
3. Uses descriptive activity names to name the acivities in the data set. The lines 9-16 are written to tag new, more comprehensible names, to the data set.  FinalTable and Finalmeanstd is the result.
4. Appropriately lables the data set with descrivive variable names.  New variable names seen in CleanData 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  Aggregate function is used to create a new clean data set by getting the average of each variable for the activity.

