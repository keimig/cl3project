---
title: "Codebook Human Activity Project"
author: "Mark Keimig"
date: "Nov 15, 2015"
output:
  html_document:
    keep_md: yes
---

## Project Description
The project involves the analysis and merge of a set of related data from the Human Activity Recognition Using Smartphones Dataset.   

##Study design and data processing

###Collection of the raw data
Human Activity Recognition Using Smartphones Dataset is the result of a an experiment involving 30 volunteers of 19-48 years of age.  Each volunteer performed six discrete activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAyING) while a smartphone on their waist.  The phone, a Samsung Galaxy S II, has an internal accelerometer and gyroscope.  Three dimensional acceleration and volocity measurments were taken.  The volunteers were randomly assigned to two groups.   Seventy percent of the volunteers were desiginated as generating training data and the remaining volunteers were designated as generating test data. 

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

###Creation of the HumanActivityRecognition tidy data file

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

###Creation of the HumanActivitymeans tidy data file

1. Create vector consisting of ActivityDescription, SubjectNumber, and all columns containing either the string mean or std (length is 88)
2. Create meanAndStd data,table based on vector if columns (10299x88)
3. Group meanAndStd by ActivityDescription and SubjectNumber (10299x88)
4. Compute means for all columns by ActivityDescription and SubjectNumber (180x88)
5. write the data table to meansByActivityAndSubject.txt file

###Cleaning of the data

The data was already sufficiently clean for our purposes

##Description of the variables in the HumanActivitymeans.txt file
  This data file contains 86 columns representing the means of the means or standard deviations of the measurements of the named variables.   There are 180 observations and 88 columns in the dataset.

###Variable 1
  * Name: activity
  * Type: Factor w/ 6 Levels
  * Levels: WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAyING 
  * Values:       1                2                  3       4        5      6
    
###Variable 2
  * Name: subjectnumber
  * Type: Integer
  * Value: Subject Identification Number

###Variable 3
  * Name: tbodyaccmeanx
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 4
  * Name: tbodyaccmeany
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 5
  * Name: tbodyaccmeanz
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 6
  * Name: tbodyaccstdx
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 7
  * Name: tbodyaccstdy
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 8
  * Name: tbodyaccstdz
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 9
  * Name: tgravityaccmeanx
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 10
  * Name: tgravityaccmeany
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 11
  * Name: tgravityaccmeanz
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 12
  * Name: tgravityaccstdx
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 13
  * Name: tgravityaccstdy
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 14
  * Name: tgravityaccstdz
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 15
  * Name: tbodyaccjerkmeanx
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 16
  * Name: tbodyaccjerkmeany
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 17
  * Name: tbodyaccjerkmeanz
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 18
  * Name: tbodyaccjerkstdx
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 19
  * Name: tbodyaccjerkstdy
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 20
  * Name: tbodyaccjerkstdz
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 21
  * Name: tbodygyromeanx
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 22
  * Name: tbodygyromeany
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 23
  * Name: tbodygyromeanz
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 24
  * Name: tbodygyrostdx
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 25
  * Name: tbodygyrostdy
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 26
  * Name: tbodygyrostdz
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 27
  * Name: tbodygyrojerkmeanx
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 28
  * Name: tbodygyrojerkmeany
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 29
  * Name: tbodygyrojerkmeanz
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 30
  * Name: tbodygyrojerkstdx
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 31
  * Name: tbodygyrojerkstdy
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 32
  * Name: tbodygyrojerkstdz
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 33
  * Name: tbodyaccmagmean
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 34
  * Name: tbodyaccmagstd
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 35
  * Name: tgravityaccmagmean
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 36
  * Name: tgravityaccmagstd
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 37
  * Name: tbodyaccjerkmagmean
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 38
  * Name: tbodyaccjerkmagstd
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 39
  * Name: tbodygyromagmean
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 40
  * Name: tbodygyromagstd
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 41
  * Name: tbodygyrojerkmagmean
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 42
  * Name: tbodygyrojerkmagstd
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 43
  * Name: fbodyaccmeanx
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 44
  * Name: fbodyaccmeany
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 45
  * Name: fbodyaccmeanz
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 46
  * Name: fbodyaccstdx
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 47
  * Name: fbodyaccstdy
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 48
  * Name: fbodyaccstdz
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 49
  * Name: fbodyaccmeanfreqx
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 50
  * Name: fbodyaccmeanfreqy
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 51
  * Name: fbodyaccmeanfreqz
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 52
  * Name: fbodyaccjerkmeanx
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 53
  * Name: fbodyaccjerkmeany
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 54
  * Name: fbodyaccjerkmeanz
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 55
  * Name: fbodyaccjerkstdx
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 56
  * Name: fbodyaccjerkstdy
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 57
  * Name: fbodyaccjerkstdz
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 58
  * Name: fbodyaccjerkmeanfreqx
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 59
  * Name: fbodyaccjerkmeanfreqy
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 60
  * Name: fbodyaccjerkmeanfreqz
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 61
  * Name: fbodygyromeanx
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 62
  * Name: fbodygyromeany
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 63
  * Name: fbodygyromeanz
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 64
  * Name: fbodygyrostdx
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 65
  * Name: fbodygyrostdy
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 66
  * Name: fbodygyrostdz
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 67
  * Name: fbodygyromeanfreqx
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 68
  * Name: fbodygyromeanfreqy
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 69
  * Name: fbodygyromeanfreqz
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 70
  * Name: fbodyaccmagmean
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 71
  * Name: fbodyaccmagstd
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 72
  * Name: fbodyaccmagmeanfreq
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 73
  * Name: fbodybodyaccjerkmagmean
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 74
  * Name: fbodybodyaccjerkmagstd
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 75
  * Name: fbodybodyaccjerkmagmeanfreq
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 76
  * Name: fbodybodygyromagmean
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 77
  * Name: fbodybodygyromagstd
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 78
  * Name: fbodybodygyromagmeanfreq
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 79
  * Name: fbodybodygyrojerkmagmean
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 80
  * Name: fbodybodygyrojerkmagstd
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 81
  * Name: fbodybodygyrojerkmagmeanfreq
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 82
  * Name: angletbodyaccmeangravity
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 83
  * Name: angletbodyaccjerkmeangravitymean
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 84
  * Name: angletbodygyromeangravitymean
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 85
  * Name: angletbodygyrojerkmeangravitymean
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 86
  * Name: anglexgravitymean
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 87
  * Name: angleygravitymean
  * Type: Double
  * Value: mean of variable by Activity and Subject

###Variable 88
  * Name: anglezgravitymean
  * Type: Double
  * Value: mean of variable by Activity and Subject
