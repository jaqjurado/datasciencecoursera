analyze <- function(){
  
  library(plyr)
  
  features <- read.table("./UCI HAR Dataset/features.txt")
  
  xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
  
  yTest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
  
  subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  
  xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
  
  yTrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
  
  subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  
  mergedX <- rbind(xTest, xTrain)
  mergedY <- rbind(yTest, yTrain)
  mergedSubject <- rbind(subjectTest, subjectTrain)
  
  
  meanSTDIdx <- grep("std()|mean()" ,features$V2)
  meanSTDName <- grep("std()|mean()" ,features$V2, value=TRUE)
  
  subsetMergedX <- mergedX[, c(meanSTDIdx)] 
  
  subsetSubjectRename <- setnames(mergedSubject, old="V1", new="Subject")
  subsetActivityRename <- setnames(mergedY, old="V1", new="Activity")
  
  oldNames <- colnames(subsetMergedX)
  subsetFeatureRename <- setnames(subsetMergedX, old=oldNames, new=meanSTDName)
  
  combinedSet <- cbind(subsetSubjectRename,subsetActivityRename,subsetFeatureRename)
  
  combinedSet$Activity[combinedSet$Activity==1] <- "WALKING"
  combinedSet$Activity[combinedSet$Activity==2] <- "WALKING_UPSTAIRS"
  combinedSet$Activity[combinedSet$Activity==3] <- "WALKING_DOWNSTAIRS"
  combinedSet$Activity[combinedSet$Activity==4] <- "SITTING"
  combinedSet$Activity[combinedSet$Activity==5] <- "STANDING"
  combinedSet$Activity[combinedSet$Activity==6] <- "LAYING"
  
  ordeCombinedSet <- combinedSet[order(combinedSet$Subject, combinedSet$Activity),]
  
  summary <- ddply(ordeCombinedSet,.(Subject,Activity),numcolwise(mean,na.rm = TRUE))
  
  return(summary)
}
