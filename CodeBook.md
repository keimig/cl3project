---
title: "Codebook Human Activity Project"
author: "Mark Keimig"
date: "Nov 15, 2015"
output:
  html_document:
    keep_md: yes
---

## Project Description
Short description of the project

##Study design and data processing

###Collection of the raw data
Human Activity Recognition Using Smartphones Dataset is the result of a an experiment involving 30 volunteers of 19-48 years of age.  Each volunteer performed six discrete activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while a smartphone on their waist.  The phone, a Samsung Galaxy S II, has an internal accelerometer and gyroscope.  Three dimensional acceleration and volocity measurments were taken.  The volunteers were randomly assigned to two groups.   Seventy percent of the volunteers were desiginated as generating training data and the remaining volunteers were designated as generating test data. 

The data in the training and test datasets represents an intermeiate state of the data.   The sensor have been press processes by applying the following:
  - noise filters
  - sampled withing a sliding windows of 2.56 sec and 50% overlap (128 readings/window)
  - gravitational and body motion seperation

###Notes on the original (raw) data 

Reference to data source 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

See the README.txt file contained in the UCI HAR Dataset downloaded from 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Creating the tidy datafiles

###Creation of the HumanActivityRecignition tidy data file

1. download and unzip the data using the "project_setup.R" script
2. read activity_labels.txt into data.table and assign column names of ActivityCode and ActivityDescription (6x2)
3. read y_train.txt into data.table and assign first column name to ActivityCode (7352x1)
4. read y_test.txt into data.table and assign first column name to ActivityCode (2947x1)
5. loop through each row of y_train data.table creating an ActivityDescription column based on ActivityCode value (7352x2)
6. loop through each row of y_test data.table creating an ActivityDescription column based on ActivityCode value (2947x2)
7. read subject_train.txt into data.table and assign first column names to SubjectNumber (7352x1)
8. read subject_test.txt into data.table and assign first column names to SubjectNumber (2947x1)
9. read features.txt into data table and assign column names of MeasurementColumn and MeasurementName (561x2)
10. read x_train.txt into data.table with column names v1:v561 (7352x561)
11. read x_test.txt into data.table with column names v1:v561(2947x561)
12. loop through features data.tab.e and assign MeasurementName values to the columns in x_train data.table (7352x561) and x_test data.table (2947x561)
13. use cbind to merge y_train, subject_train, and x_train data tables into train data.table (7352x564)
14. use cbind to merge y_test, subject_test, and x_test data tables into test data.table (2847x564)
15. use rbind to concatenate train and test data tables indo HumanActivityRecognition tidy data table (10299x564)

###Creation of the HumanActivityMeans tidy data file

1. Create vector consisting of ActivityDescription, SubjectNumber, and all columns containing either the string mean or std() (length is 88)
2. Create MeanAndStd data,table based on vector if columns (10299 x 88)
3. Group MeanAndStd by ActivityDescription and SubjectNumber (10299 x 88)
4. Compute means for all columns by ActivityDescription and SubjectNumber (10299 x 88)
5. write the data table to meansByActivityAndSubject.txt file

###Cleaning of the data

The data was already sufficiently clean for our purposes

##Description of the variables in the HumanActivityMeans.txt file
  This data file contains 86 columns representing the means of the means or standard deviations of the measurements of the named variables.   There are 180 observations and 88 columns in the dataset.

###Variable 1
  * Name: ActivityDescription
  * Type: Character
  * Values:
    + STANDING
    + SITTING
    + LAYING
    + WALKING
    + WALKING_DOWNSTAIRS
    + WALKING_UPSTAIRS
    
###Variable 2
  * Name: SubjectNumber
  * Type: Integer
  * Value: Subject Identification Number

###Variable 3
  * Name: tBodyAcc-mean()-X
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 4
  * Name: tBodyAcc-mean()-Y
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 5
  * Name: tBodyAcc-mean()-Z
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 6
  * Name: tBodyAcc-std()-X
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 7
  * Name: tBodyAcc-std()-Y
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 8
  * Name: tBodyAcc-std()-Z
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 9
  * Name: tGravityAcc-mean()-X
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 10
  * Name: tGravityAcc-mean()-Y
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 11
  * Name: tGravityAcc-mean()-Z
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 12
  * Name: tGravityAcc-std()-X
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 13
  * Name: tGravityAcc-std()-Y
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 14
  * Name: tGravityAcc-std()-Z
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 15
  * Name: tBodyAccJerk-mean()-X
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 16
  * Name: tBodyAccJerk-mean()-Y
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 17
  * Name: tBodyAccJerk-mean()-Z
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 18
  * Name: tBodyAccJerk-std()-X
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 19
  * Name: tBodyAccJerk-std()-Y
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 20
  * Name: tBodyAccJerk-std()-Z
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 21
  * Name: tBodyGyro-mean()-X
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 22
  * Name: tBodyGyro-mean()-Y
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 23
  * Name: tBodyGyro-mean()-Z
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 24
  * Name: tBodyGyro-std()-X
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 25
  * Name: tBodyGyro-std()-Y
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 26
  * Name: tBodyGyro-std()-Z
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 27
  * Name: tBodyGyroJerk-mean()-X
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 28
  * Name: tBodyGyroJerk-mean()-Y
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 29
  * Name: tBodyGyroJerk-mean()-Z
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 30
  * Name: tBodyGyroJerk-std()-X
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 31
  * Name: tBodyGyroJerk-std()-Y
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 32
  * Name: tBodyGyroJerk-std()-Z
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 33
  * Name: tBodyAccMag-mean()
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 34
  * Name: tBodyAccMag-std()
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 35
  * Name: tGravityAccMag-mean()
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 36
  * Name: tGravityAccMag-std()
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 37
  * Name: tBodyAccJerkMag-mean()
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 38
  * Name: tBodyAccJerkMag-std()
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 39
  * Name: tBodyGyroMag-mean()
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 40
  * Name: tBodyGyroMag-std()
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 41
  * Name: tBodyGyroJerkMag-mean()
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 42
  * Name: tBodyGyroJerkMag-std()
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 43
  * Name: fBodyAcc-mean()-X
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 44
  * Name: fBodyAcc-mean()-Y
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 45
  * Name: fBodyAcc-mean()-Z
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 46
  * Name: fBodyAcc-std()-X
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 47
  * Name: fBodyAcc-std()-Y
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 48
  * Name: fBodyAcc-std()-Z
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 49
  * Name: fBodyAcc-meanFreq()-X
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 50
  * Name: fBodyAcc-meanFreq()-Y
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 51
  * Name: fBodyAcc-meanFreq()-Z
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 52
  * Name: fBodyAccJerk-mean()-X
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 53
  * Name: fBodyAccJerk-mean()-Y
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 54
  * Name: fBodyAccJerk-mean()-Z
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 55
  * Name: fBodyAccJerk-std()-X
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 56
  * Name: fBodyAccJerk-std()-Y
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 57
  * Name: fBodyAccJerk-std()-Z
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 58
  * Name: fBodyAccJerk-meanFreq()-X
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 59
  * Name: fBodyAccJerk-meanFreq()-Y
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 60
  * Name: fBodyAccJerk-meanFreq()-Z
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 61
  * Name: fBodyGyro-mean()-X
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 62
  * Name: fBodyGyro-mean()-Y
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 63
  * Name: fBodyGyro-mean()-Z
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 64
  * Name: fBodyGyro-std()-X
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 65
  * Name: fBodyGyro-std()-Y
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 66
  * Name: fBodyGyro-std()-Z
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 67
  * Name: fBodyGyro-meanFreq()-X
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 68
  * Name: fBodyGyro-meanFreq()-Y
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 69
  * Name: fBodyGyro-meanFreq()-Z
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 70
  * Name: fBodyAccMag-mean()
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 71
  * Name: fBodyAccMag-std()
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 72
  * Name: fBodyAccMag-meanFreq()
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 73
  * Name: fBodyBodyAccJerkMag-mean()
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 74
  * Name: fBodyBodyAccJerkMag-std()
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 75
  * Name: fBodyBodyAccJerkMag-meanFreq()
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 76
  * Name: fBodyBodyGyroMag-mean()
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 77
  * Name: fBodyBodyGyroMag-std()
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 78
  * Name: fBodyBodyGyroMag-meanFreq()
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 79
  * Name: fBodyBodyGyroJerkMag-mean()
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 80
  * Name: fBodyBodyGyroJerkMag-std()
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 81
  * Name: fBodyBodyGyroJerkMag-meanFreq()
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 82
  * Name: angle(tBodyAccMean,gravity)
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 83
  * Name: angle(tBodyAccJerkMean),gravityMean)
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 84
  * Name: angle(tBodyGyroMean,gravityMean)
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 85
  * Name: angle(tBodyGyroJerkMean,gravityMean)
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 86
  * Name: angle(X,gravityMean)
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 87
  * Name: angle(Y,gravityMean)
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 88
  * Name: angle(Z,gravityMean)
  * Type: Double
  * Value: mean of variable by Activity and Subject
