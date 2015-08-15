run_analysis <- function(){
  
  library(plyr)
  
## Read features, test and train files into tables
  features <- read.table("./UCI HAR Dataset/features.txt") 
  xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
  yTest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
  subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt") 
  xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
  yTrain <- read.table("./UCI HAR Dataset/train/Y_train.txt") 
  subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## Merge test and train dataset
  mergedX <- rbind(xTest, xTrain)
  mergedY <- rbind(yTest, yTrain)
  mergedSubject <- rbind(subjectTest, subjectTrain)
  
## Get index and feature name of the features file that are means and standard deviation  
  meanSTDIdx <- grep("std()|mean()" ,features$V2)
  meanSTDName <- grep("std()|mean()" ,features$V2, value=TRUE)

## Get a subset of the feature dataset that has only mean and standard deviation metrics
  subsetMergedX <- mergedX[, c(meanSTDIdx)] 
  
## Rename subject column and activity column with a descriptive name
  mergedSubjectRename <- setnames(mergedSubject, old="V1", new="Subject")
  mergedYRename <- setnames(mergedY, old="V1", new="Activity")

## Rename feature column with a descriptive name, instead of V1, V2.. etc rename it to the actual feature metric name from the feature file
  oldNames <- colnames(subsetMergedX)
  subsetFeatureRename <- setnames(subsetMergedX, old=oldNames, new=meanSTDName)

## Combine the subject, activity and feature dataset into one dataset
  combinedSet <- cbind(mergedSubjectRename,mergedYRename,subsetFeatureRename)

## Change activity row values with a descriptive activity name
  combinedSet$Activity[combinedSet$Activity==1] <- "WALKING"
  combinedSet$Activity[combinedSet$Activity==2] <- "WALKING_UPSTAIRS"
  combinedSet$Activity[combinedSet$Activity==3] <- "WALKING_DOWNSTAIRS"
  combinedSet$Activity[combinedSet$Activity==4] <- "SITTING"
  combinedSet$Activity[combinedSet$Activity==5] <- "STANDING"
  combinedSet$Activity[combinedSet$Activity==6] <- "LAYING"

## Order the dataset based on subject and activity combination
  ordeCombinedSet <- combinedSet[order(combinedSet$Subject, combinedSet$Activity),]

## Create a new dataset that averages the features based on subject and activity
  summary <- ddply(ordeCombinedSet,.(Subject,Activity),numcolwise(mean,na.rm = TRUE))

## Return the summary data
  return(summary)
}
