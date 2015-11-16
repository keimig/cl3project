## ###################################################################
## #  run_analysis
## #  the numbers correspond to the 5 requirements of the assignment. 
## #  in the interests of clarity i decided to move 3 and 4 into the
## #  merge process so that the resulting HummanActivityRecognition
## #  dataframe was "tidy" before proceeding to items 2 and 5 of the 
## #  project.
## #
## #  1  - Read, Set Column Names, and Combine Data
## #  1a - data.table activity        - columns (ActivityCode, ActivityDescription)
## #  1b - data.table y_train         - columns (ActivityCode, ActivityDescription)
## #     - data.table y_test          - columns (ActivityCode, ActivityDescription)
## #  1c - data.table subject_train   - columns (SubjectNumber)
## #     - data.table subject_test    - columns (SubjectNumber)
## #  1d - data.table features        - columns (MeasurementColumn, MeasurementName)
## #  1e - data.table x_train         - columns (561 data columns with names from features applied)
## #     - data.table x_text          - columns (561 data columns with names from features applied)
## #  1f - combine the data into data.table HumanActivityRecognition          - 
## #
## #  1h - combine all into data.table - HummanActivityRecognition (564 data columns)
## #  1i - check the resuls, stop if it looks bad
## #  scope exception:
## #  HumanActivityRecognition - a "tidy" data.table is written to the
## #                            parent environment
## #  HumanActivityRecognition.txt - written using write.table
## ###################################################################
## #  2  - MeansAndStd        - a "tidy" data.table is written to the 
## #                            parent environment.  It contains variables
## #                            which have mean or std in their names 
## #                            irrespective of case.  Verified that all 
## #                            cases are complete
## ###################################################################
## #  MeanAndStd.txt - written using write.table
##
## Requirements 3 and 4 were handled during the data consolitation phase 
## ###################################################################
## #  5  - Means        - a "tidy" data.table containing on observation 
## #                      for each activity type and subject. The 
## #                      measurement varieles are the means of the 
## #                      observed values for each group.                           cases are complete
## ###################################################################
## # meansByActivityAndSubject - written using write.table 
## 

run_analysis <- function() {
  library(plyr)
  library(data.table)
  library(dplyr)
  ## set working directory
  setwd("~/jhu_ds_track/3_cleandata")
  setwd("./data/UCI HAR Dataset")
  filelist<-list.files(".")
  ## 1a - read and rename activity labels in activity_labels.txt file
  activityLabels<-fread(
         "./activity_labels.txt",
         data.table=TRUE)
  setnames(activityLabels,"V1","activitycode")
  setnames(activityLabels,"V2","activitydescription")
  mylevels<-activityLabels$activitydescription
  activityFactors<-mutate(activityLabels, activity = factor(activitydescription,levels = mylevels))
  rm (activityLabels)  ## we are finished with this
  ## activityFactors contents
  ## activitycode activitydescription           activity
  ## 1:            1             WALKING            WALKING
  ## 2:            2    WALKING_UPSTAIRS   WALKING_UPSTAIRS
  ## 3:            3  WALKING_DOWNSTAIRS WALKING_DOWNSTAIRS
  ## 4:            4             SITTING            SITTING
  ## 5:            5            STANDING           STANDING
  ## 6:            6              LAYING             LAYING
  
  ##
  ## 1b - read and test and train record activity codes for data vector in the 
  ## train/y_train.txt and test/y_test.txt files
  y_train<-fread(
      "./train/y_train.txt",
         sep="\n",data.table=TRUE)
  y_test<-fread(
       "./test/y_test.txt",
        sep="\n",data.table=TRUE)
  setnames(y_train,"V1","activitycode")
  setnames(y_test,"V1","activitycode")
  ## add an activity column based on activitycode and the activityFactors
  for ( i in 1:nrow(y_test) ) {
    y_test[i,activity:=activityFactors[y_test[i,activitycode],activity]]
  } 
  for ( i in 1:nrow(y_train) ) {
    y_train[i,activity:=activityFactors[y_train[i,activitycode],activity]]
  } 
    
  ## 1c - read and test and train subject identifiers for data vector in the 
  ## train/y_train.txt and test/y_test.txt files
  subject_train<-fread(
      "./train/subject_train.txt",
      sep="\n",data.table=TRUE)
  subject_test<-fread(
      "./test/subject_test.txt",
      sep="\n",data.table=TRUE)
  ##
  ## 1c - use setnames function to column name V1 to subject
  setnames(subject_train,"V1","subjectnumber")
  setnames(subject_test,"V1","subjectnumber") 
  ##
  
  ## 1d -read and rename feature labels in feature.txt file
  features<-fread(
    "./features.txt",
    data.table=TRUE)
  setnames(features,"V1","MeasurementColumn")
  setnames(features,"V2","MeasurementName")
  ## fix names here ******
  ##
  ## 1e - read test and train data vectors data rows in the 
  ## train/x_train.txt and test/x_test.txt files into a data.tables
    x_test<-fread(
      "./test/X_test.txt")
    x_train<-fread(
      "./train/X_train.txt")
  ##
  ## use a for loop to apply the feature lables to the columns names of
  ## the data.table my means of the more efficient setnames function. frams.  We now have 
  for ( i in 1:nrow(features) ) {
        setnames(x_test,paste("V",i,sep=""),features[i,MeasurementName])
        setnames(x_train,paste("V",i,sep=""),features[i,MeasurementName])
  }
  ## This assigns duplicate names to the data frames.  This may be shown by 
  ## means of the following call
  ##    features[duplicated(MeasurementName)]
  ## this is not an ideal solution for removing duplicate names, nor is it
  ## strictly necessary as none of the duplicates are standard deviations or 
  ## means.   This is a rather brute force approach but it works.
  x_test <- as.data.frame(x_test)   ## convert to data frame
  x_train <- as.data.frame(x_train) ## 
  x_test <-x_test[,]                ## to add suffixes to duplicated names
  x_train <-x_train[,]              ## 
  x_test <- as.data.table(x_test)   ## back to data table
  x_train <- as.data.table(x_train) ##
  ##
  ## 1f - now we have the following state:
  ##  subject_test data.table with single column named "SubjectNumber"
  ##  x_test data,tablewith 561 named columns
  ##  y_test data.table with columns named "ActivityCode" and "ActivityDescription"
  ##   
  ##  subject_train data frame with single column named "SubjectNumber"
  ##  x_train data frame with 561 named columns
  ##  y_train data frame with single columns named "ActivityCode" and "ActivityDescription"
  ##
  ##  now we combine using cbind and rbind into a single data.table called alldata
  ##
  test<-cbind(y_test, subject_test, x_test)
  train<-cbind(y_train, subject_train,  x_train)
  HumanActivityRecognition<-rbind(test,train)
  ##
  ## 1i - check that all cases are complete, if not then stop
  
  comp<-HumanActivityRecognition[complete.cases(HumanActivityRecognition),]
  if (nrow(HumanActivityRecognition) != nrow(comp)) {
    stop("Houston we have a problem!  Not all data are complete.")
  } else {
    print("All cases are complete!")
    rm(comp)
    write.table(HumanActivityRecognition,file="./HumanActivityRecognition.txt",row.names=FALSE)
  }
  ##
  ## 2 - determine what fields to extract which contain any ocurrance of mean or std().
  myvars<-c("activity","subjectnumber",grep("mean|std()",features$MeasurementName,ignore.case=TRUE,value=TRUE))
  ## 
  ## MeanAndStd<-HumanActivityRecognition[, .SD, .SDcols=myvars]
  MeanAndStd<-HumanActivityRecognition[, myvars, with=FALSE]
  ## write.table(MeanAndStd,file="./MeanAndStd.txt",row.names=FALSE)
  ##
  ## Requirements 3 and 4 were handled during the data consolitation phase 
  
  ## 5 - summarization by each activity and subject
  grouped<-group_by(MeanAndStd,activity, subjectnumber) 
  HumanActivityMeans<-summarize_each(grouped,funs(mean))
  write.table(HumanActivityMeans,file="./meansByActivityAndSubject.txt",row.names=FALSE)
  
  
}


