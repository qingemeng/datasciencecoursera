# Codebook for Getting and Cleaning Data Course Project

### Variables 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals `tAcc-XYZ `and `tGyro-XYZ`. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (`tBodyAcc-XYZ` and `tGravityAcc-XYZ`) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (`tBodyAccJerk-XYZ` and `tBodyGyroJerk-XYZ`). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (`tBodyAccMag`, `tGravityAccMag`, `tBodyAccJerkMag`, `tBodyGyroMag`, `tBodyGyroJerkMag`). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing `fBodyAcc-XYZ`, `fBodyAccJerk-XYZ`, `fBodyGyro-XYZ`, `fBodyAccJerkMag`, `fBodyGyroMag`, `fBodyGyroJerkMag`. (Note the 'f' to indicate frequency domain signals). 

The set of variables that were estimated from these signals are: 

`mean()`: Mean value
`std()`: Standard deviation

There are two more variables in the dataset:

`subject`: The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person is a experimental subject.

`activity`: six activities (**WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING**) are performed.

### Units
1. `subject`: integers are used to indicated subject id (Its range is from 1 to 30)
2. `activity`: string to indicate 6 activities
3. feature variables: Features are normalized and bounded within [-1,1]


### Work Performed

1. read subject files
2. read feature files, select data on **mean** and **standard deviation** only
3. read labels
4. merge required train data of `subject`,`activity`, and features
5. merge required test data of `subject`,`activity`, and features
6. merge train and test data
7. give descriptive activity names and variable names
8. create independent tidy data set with the average of each variable for each activity and each subject.
9. reorder the dataset based on `subject` and `activity`
9. write to file

