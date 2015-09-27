## download dataset if not exist
library(plyr)
if(!dir.exists("UCI HAR Dataset"))
{
    file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(file.url, destfile="HARdataset.zip", method="curl")
    download.date <- date()
    unzip("HARdataset.zip")   
}

## seperate paths for data
root.dir <- file.path("UCI HAR Dataset")
train.dir <- file.path(root.dir, "train")
test.dir <- file.path(root.dir, "test")

## read subject files
DT.subject.train <- read.table(file.path(train.dir, "subject_train.txt"), header=F, na.strings="??")
DT.subject.test <- read.table(file.path(test.dir, "subject_test.txt"), header=F, na.strings="??")

## read feature files, only the data on mean and standard deviation
feature.header <- read.table(file.path(root.dir, "features.txt"), header=F)
feature.header[,2] <- as.character(feature.header[,2])
target <- grep("-(mean|std)\\(\\)", feature.header[, 2])

DT.feature.train <- read.table(file.path(train.dir, "X_train.txt"), header=F, na.strings="??")
DT.feature.train <- DT.feature.train[, target]

DT.feature.test <- read.table(file.path(test.dir, "X_test.txt"), header=F, na.strings="??")
DT.feature.test <- DT.feature.test[, target]

## read labels
activity.header <- read.table(file.path(root.dir, "activity_labels.txt"), header=F, na.strings="??")
activity.header[,2] <- as.character(activity.header[,2])

DT.label.train <- read.table(file.path(train.dir, "Y_train.txt"), header=F, na.strings="??")
DT.label.test <- read.table(file.path(test.dir, "Y_test.txt"), header=F, na.strings="??")

## merge and label data
trainData <- cbind(DT.subject.train, DT.label.train, DT.feature.train)
testData <- cbind(DT.subject.test, DT.label.test, DT.feature.test)
merged.data <- rbind(trainData, testData)
names(merged.data) = c("subject", "activity", feature.header[target, 2])
merged.data$activity <- factor(merged.data$activity, levels = activity.header[,1], labels = activity.header[,2])
merged.data$subject <- as.factor(merged.data$subject)

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy.data <- aggregate(. ~subject + activity, merged.data, mean)
tidy.data<-tidy.data[order(tidy.data$subject,tidy.data$activity),]
write.table(tidy.data, file = "tidy_data.txt",row.name=FALSE)