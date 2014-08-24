
##Load all datasets into R

activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activitylabels) <- c("activitykey","activity")

features <- read.table("UCI HAR Dataset/features.txt")
names(features) <- c("featurekey","feature")

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
names(x_train) <- features[,2]
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
names(x_test) <- features[,2]
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

## Start combining the datasets.

## First, combine subjects and activities.

subjectactivity_train <- cbind(subject_train, y_train)
names(subjectactivity_train) <- c("subject","activity")
subjectactivity_test <- cbind(subject_test, y_test)
names(subjectactivity_test) <- c("subject","activity")

## Second, Combine with x data

finaltrain <- cbind(subjectactivity_train, x_train)
finaltest <- cbind(subjectactivity_test, x_test)

## Finally, Row bind train and test datasets together. This consolidates all of the data.

totaldata <- rbind(finaltrain,finaltest)

## Change the values of the activity column to be Descriptive words instead of integer ID's.

totaldata$activity[totaldata$activity == "1"] <- as.character(activitylabels[1,2])
totaldata$activity[totaldata$activity == "2"] <- as.character(activitylabels[2,2])
totaldata$activity[totaldata$activity == "3"] <- as.character(activitylabels[3,2])
totaldata$activity[totaldata$activity == "4"] <- as.character(activitylabels[4,2])
totaldata$activity[totaldata$activity == "5"] <- as.character(activitylabels[5,2])
totaldata$activity[totaldata$activity == "6"] <- as.character(activitylabels[6,2])

## Prune down the columns to only include the first 2, and the ones that contain the string "mean" or "std"

totaldata_mean_std <- totaldata[,append(c(1,2),grep("mean|std",features[,2])+2)]
