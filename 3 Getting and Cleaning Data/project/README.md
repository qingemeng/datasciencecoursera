## Introduction
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. Files need to be submitted:

* a tidy data set as described below
* a link to a Github repository with your script for performing the analysis, and 
* a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called `CodeBook.md`. You should also include a `README.md` in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

Here are the data for the project: 

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

You should create one R script called `run_analysis.R` that does the following.

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Files included

`run_analysis.R`: data clean up script

	1. Work Performed
	2. read subject files
	3. read feature files, select data on mean and standard deviation only
	4. read labels
	5. merge required train data of subject,activity, and features
	6. merge required test data of subject,activity, and features
	7. merge train and test data
	8. give descriptive activity names and variable names
	9. create independent tidy data set with the average of each variable for each activity and each subject.
	10. reorder the dataset based on subject and activity
	11. write to file

`tidy_data.txt`: cleaned up output dataset

`CodeBook.md`: explanation of the cleaned data, variables, transformation, etc.

`README.md`: project requirements and files included