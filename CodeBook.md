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
Human Activity Recognition Using Smartphones Dataset is the result of a an experiment involving 30 volunteers of 19-48 years of age.  Each volunteer performed six discrete activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while a smartphone on their waist.  The phone, a Samsung Galaxy S II, has an internal accelerometer and gyroscope.  Three dimensional acceleration and volocity measurments were taken.  The volunteers were randomly assigned to two groups.   Seventy percent of the volunteers were desiginated as generating training data and the remaining volunteers were designated as generating test data. 

The data in the training and test datasets represents an intermediate state of the data.   The sensor data have been processed by applying the following:
  - noise filters
  - sampled withing a sliding windows of 2.56 sec and 50% overlap (128 readings/window)
  - gravitational and body motion separation
  - Fast Fourier Transformations
  - normalization to a relative range [-1,1]

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

The data was already sufficiently clean for our purposes.  The features were processed to remove duplicate names and invalid characters from the names.

##Description of the variables in the HumanActivitymeans.txt file
  This data file contains 86 columns representing the means of the means or standard deviations of the measurements of the named variables.   There are 180 observations and 88 columns in the dataset.

###Variable 1
  * Name: activity
  * Type: Factor w/ 6 Levels
  * Levels: WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAYING 
  * Values:       1                2                  3       4        5      6
    
###Variable 2
  * Name: subjectnumber
  * Type: Integer
  * Value: Subject Identification Number

###Variable 3
  * Name: tbodyaccmeanx
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean body acceleration minus gravity in the x axis
  * Value: mean of variable of same name by activity and subject

###Variable 4
  * Name: tbodyaccmeany
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean body acceleration minus gravity in the y axis
  * Value: mean of variable of same name by activity and subject

###Variable 5
  * Name: tbodyaccmeanz
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean body acceleration minus gravity in the z axis
  * Value: mean of variable of same name by activity and subject

###Variable 6
  * Name: tbodyaccstdx
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of standard deviation of body acceleration minus gravity in the x axis
  * Value: mean of variable of same name by activity and subject

###Variable 7
  * Name: tbodyaccstdy
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of standard deviation of body acceleration minus gravity in the y axis
  * Value: mean of variable of same name by activity and subject

###Variable 8
  * Name: tbodyaccstdz
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of standard deviation of body acceleration minus gravity in the z axis
  * Value: mean of variable of same name by activity and subject

###Variable 9
  * Name: tgravityaccmeanx
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean constant value of gravity in the x axis
  * Value: mean of variable of same name by activity and subject

###Variable 10
  * Name: tgravityaccmeany
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean constant value of gravity in the y axis
  * Value: mean of variable of same name by activity and subject

###Variable 11
  * Name: tgravityaccmeanz
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean constant value of gravity in the z axis
  * Value: mean of variable of same name by activity and subject

###Variable 12
  * Name: tgravityaccstdx
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean standard deviation of constant value of gravity in the x axis
  * Value: mean of variable of same name by activity and subject

###Variable 13
  * Name: tgravityaccstdy
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean standard deviation of value of gravity in the y axis
  * Value: mean of variable of same name by activity and subject

###Variable 14
  * Name: tgravityaccstdz
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean standard deviation of value of gravity in the z axis
  * Value: mean of variable of same name by activity and subject

###Variable 15
  * Name: tbodyaccjerkmeanx
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean body jerk magniture  minus gravity in the z axis
  * Value: mean of variable of same name by activity and subject

###Variable 16
  * Name: tbodyaccjerkmeany
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean body jerk magniture  minus gravity in the y axis
  * Value: mean of variable of same name by activity and subject

###Variable 17
  * Name: tbodyaccjerkmeanz
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean body jerk magniture  minus gravity in the z axis
  * Value: mean of variable of same name by activity and subject

###Variable 18
  * Name: tbodyaccjerkstdx
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of standard deviation of body jerk magniture minus gravity in the x axis
  * Value: mean of variable of same name by activity and subject

###Variable 19
  * Name: tbodyaccjerkstdy
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of standard deviation of body jerk magniture minus gravity in the y axis
  * Value: mean of variable of same name by activity and subject

###Variable 20
  * Name: tbodyaccjerkstdz
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of standard deviation of body jerk magniture minus gravity in the z axis
  * Value: mean of variable of same name by activity and subject

###Variable 21
  * Name: tbodygyromeanx
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of body gyro reading in the x axis
  * Value: mean of variable of same name by activity and subject

###Variable 22
  * Name: tbodygyromeany
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of body gyro reading in the y axis
  * Value: mean of variable of same name by activity and subject

###Variable 23
  * Name: tbodygyromeanz
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of body gyro reading in the z axis
  * Value: mean of variable of same name by activity and subject

###Variable 24
  * Name: tbodygyrostdx
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of the standard deviation of body gyro reading in the x axis
  * Value: mean of variable of same name by activity and subject

###Variable 25
  * Name: tbodygyrostdy
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of the standard deviation of body gyro reading in the y axis
  * Value: mean of variable of same name by activity and subject

###Variable 26
  * Name: tbodygyrostdz
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of the standard deviation of body gyro reading in the z axis
  * Value: mean of variable of same name by activity and subject

###Variable 27
  * Name: tbodygyrojerkmeanx
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of body gyro jerk reading in the x axis
  * Value: mean of variable of same name by activity and subject

###Variable 28
  * Name: tbodygyrojerkmeany
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of body gyro jerk reading in the y axis
  * Value: mean of variable of same name by activity and subject

###Variable 29
  * Name: tbodygyrojerkmeanz
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of body gyro jerk reading in the z axis
  * Value: mean of variable of same name by activity and subject

###Variable 30
  * Name: tbodygyrojerkstdx
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of the standard deviations of the body gyro jerk reading in the x axis
  * Value: mean of variable of same name by activity and subject

###Variable 31
  * Name: tbodygyrojerkstdy
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of the standard deviations of the body gyro jerk reading in the y axis
  * Value: mean of variable of same name by activity and subject

###Variable 32
  * Name: tbodygyrojerkstdz
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of the standard deviations of the body gyro jerk reading in the z axis
  * Value: mean of variable of same name by activity and subject

###Variable 33
  * Name: tbodyaccmagmean
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of body acceleration magnitude 
  * Value: mean of variable of same name by activity and subject

###Variable 34
  * Name: tbodyaccmagstd
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of standard deviation of body acceleration magnitude 
  * Value: mean of variable of same name by activity and subject

###Variable 35
  * Name: tgravityaccmagmean
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Constant of gravity acceleration magnitude 
  * Value: mean of variable of same name by activity and subject

###Variable 36
  * Name: tgravityaccmagstd
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of standard deviation of constant of gravity acceleration magnitude     
  * Value: mean of variable of same name by activity and subject

###Variable 37
  * Name: tbodyaccjerkmagmean
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of jerk acceleration magnitude
  * Value: mean of variable of same name by activity and subject

###Variable 38
  * Name: tbodyaccjerkmagstd
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of standard deviation of jerk acceleration magnitude
  * Value: mean of variable of same name by activity and subject

###Variable 39
  * Name: tbodygyromagmean
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of body gyro magnitude reading 
  * Value: mean of variable of same name by activity and subject

###Variable 40
  * Name: tbodygyromagstd
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of standard deviation of body gyro magnitude reading 
  * Value: mean of variable of same name by activity and subject

###Variable 41
  * Name: tbodygyrojerkmagmean
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of body gyro jerk magnitude reading 
  * Value: mean of variable of same name by activity and subject

###Variable 42
  * Name: tbodygyrojerkmagstd
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of standard deviation of body gyro jerk magnitude reading
  * Value: mean of variable of same name by activity and subject

###Variable 43
  * Name: fbodyaccmeanx
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Fast Fourier Transform of tbodyaccx 
  * Value: mean of variable of same name by activity and subject

###Variable 44
  * Name: fbodyaccmeany
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Fast Fourier Transform of tbodyaccy 
  * Value: mean of variable of same name by activity and subject

###Variable 45
  * Name: fbodyaccmeanz
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Fast Fourier Transform of tbodyaccz
  * Value: mean of variable of same name by activity and subject

###Variable 46
  * Name: fbodyaccstdx
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of standard deviation of Fast Fourier Transform of tbodyaccx
  * Value: mean of variable of same name by activity and subject

###Variable 47
  * Name: fbodyaccstdy
  * Type: Double
  * Units: Relative g force normalized to range of values 
  * Computed: Mean of standard deviation of Fast Fourier Transform of tbodyaccy
  * Value: mean of variable of same name by activity and subject

###Variable 48
  * Name: fbodyaccstdz
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of standard deviation of Fast Fourier Transform of tbodyaccz
  * Value: mean of variable of same name by activity and subject

###Variable 49
  * Name: fbodyaccmeanfreqx
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of frequency components of tbodyaccx
  * Value: mean of variable of same name by activity and subject

###Variable 50
  * Name: fbodyaccmeanfreqy
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of frequency components of tbodyaccy
  * Value: mean of variable of same name by activity and subject

###Variable 51
  * Name: fbodyaccmeanfreqz
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of frequency components of tbodyaccz
  * Value: mean of variable of same name by activity and subject

###Variable 52
  * Name: fbodyaccjerkmeanx
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of Fast Fourier Transform of tbodyaccjerkx
  * Value: mean of variable of same name by activity and subject

###Variable 53
  * Name: fbodyaccjerkmeany
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of Fast Fourier Transform of tbodyaccjerky
  * Value: mean of variable of same name by activity and subject

###Variable 54
  * Name: fbodyaccjerkmeanz
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of Fast Fourier Transform of tbodyaccjerkrz
  * Value: mean of variable able of same name by activity and subject

###Variable 55
  * Name: fbodyaccjerkstdx
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of standard deviation of Fast Fourier Transform of tbodyaccjerkx
  * Value: mean of variable of same name by activity and subject

###Variable 56
  * Name: fbodyaccjerkstdy
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of standard deviation of Fast Fourier Transform of tbodyaccjerky
  * Value: mean of variable of same name by activity and subject

###Variable 57
  * Name: fbodyaccjerkstdz
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of standard deviation of Fast Fourier Transform of tbodyaccjerkz
  * Value: mean of variable of same name by activity and subject

###Variable 58
  * Name: fbodyaccjerkmeanfreqx
  * Type: Double
  * Units: Relative g force normalized to range of values 
  * Computed: Mean of frequency components of tbodyaccjerkx
  * Value: mean of variable of same name by activity and subject

###Variable 59
  * Name: fbodyaccjerkmeanfreqy
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of frequency components of tbodyaccjerky
  * Value: mean of variable of same name by activity and subject

###Variable 60
  * Name: fbodyaccjerkmeanfreqz
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of frequency components of tbodyaccjerkz
  * Value: mean of variable of same name by activity and subject

###Variable 61
  * Name: fbodygyromeanx
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of Fast Fourier Transform of tbodygyrox
  * Value: mean of variable of same name by activity and subject

###Variable 62
  * Name: fbodygyromeany
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of Fast Fourier Transform of tbodygyroy
  * Value: mean of variable of same name by activity and subject

###Variable 63
  * Name: fbodygyromeanz
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of Fast Fourier Transform of tbodygyroz
  * Value: mean of variable of same name by activity and subject

###Variable 64
  * Name: fbodygyrostdx
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of standard deviation of Fast Fourier Transform of tbodygyrox
  * Value: mean of variable of same name by activity and subject

###Variable 65
  * Name: fbodygyrostdy
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of standard deviation of Fast Fourier Transform of tbodygyroy
  * Value: mean of variable of same name by activity and subject

###Variable 66
  * Name: fbodygyrostdz
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of standard deviation of Fast Fourier Transform of tbodygyroz
  * Value: mean of variable of same name by activity and subject

###Variable 67
  * Name: fbodygyromeanfreqx
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of frequency components of tbodygyrox
  * Value: mean of variable of same name by activity and subject

###Variable 68
  * Name: fbodygyromeanfreqy
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of frequency components of tbodygyroy
  * Value: mean of variable of same name by activity and subject

###Variable 69
  * Name: fbodygyromeanfreqz
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of frequency components of tbodygyroz
  * Value: mean of variable of same name by activity and subject

###Variable 70
  * Name: fbodyaccmagmean
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of Fast Fourier Transform of tbodyaccmag
  * Value: mean of variable of same name by activity and subject

###Variable 71
  * Name: fbodyaccmagstd
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of standard deviation of Fast Fourier Transform of tbodyaccmag
  * Value: mean of variable of same name by activity and subject

###Variable 72
  * Name: fbodyaccmagmeanfreq
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of frequency components of tbodyaccmag
  * Value: mean of variable of same name by activity and subject

###Variable 73
  * Name: fbodybodyaccjerkmagmean
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of Fast Fourier Transform of tbodybodyaccjerkmag
  * Value: mean of variable of same name by activity and subject

###Variable 74
  * Name: fbodybodyaccjerkmagstd
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of standard deviation of Fast Fourier Transform of tbodybodyaccjerkmag
  * Value: mean of variable of same name by activity and subject

###Variable 75
  * Name: fbodybodyaccjerkmagmeanfreq
  * Type: Double
  * Units: Relative g force normalized to range of values
  * Computed: Mean of frequency components of tbodybodyaccjerkmag
  * Value: mean of variable of same name by activity and subject

###Variable 76
  * Name: fbodybodygyromagmean
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of Fast Fourier Transform of tbodybodygyromag
  * Value: mean of variable of same name by activity and subject

###Variable 77
  * Name: fbodybodygyromagstd
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of standard deviations of Fast Fourier Transform of tbodybodygyromag
  * Value: mean of variable of same name by activity and subject

###Variable 78
  * Name: fbodybodygyromagmeanfreq
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of frequency components of tbodybodygyromag
  * Value: mean of variable of same name by activity and subject

###Variable 79
  * Name: fbodybodygyrojerkmagmean
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of Fast Fourier Transform of tbodybodygyrojerkmag
  * Value: mean of variable of same name by activity and subject

###Variable 80
  * Name: fbodybodygyrojerkmagstd
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of standard deviation of Fast Fourier Transform of tbodybodygyrojerkmag
  * Value: mean of variable of same name by activity and subject

###Variable 81
  * Name: fbodybodygyrojerkmagmeanfreq
  * Type: Double
  * Units: Relative gyro reading normalized to range.  Originally radians/sec
  * Computed: Mean of frequency components of tbodybodygyrojerkmag
  * Value: mean of variable of same name by activity and subject

###Variable 82
  * Name: angletbodyaccmeangravity
  * Type: Double
  * Units: Relative angle reading normalized to range.  Originally radians
  * Computed: Mean angle between tbodyacc and gravity force vectors
  * Value: mean of variable of same name by activity and subject

###Variable 83
  * Name: angletbodyaccjerkmeangravitymean
  * Type: Double
  * Units: Relative angle reading normalized to range.  Originally radians
  * Computed: Mean angle between tbodyaccjerk and gravity force vectors
  * Value: mean of variable of same name by activity and subject

###Variable 84
  * Name: angletbodygyromeangravitymean
  * Type: Double
  * Units: Relative angle reading normalized to range.  Originally radians
  * Computed: Mean angle between tbodygyro and gravity force vectors
  * Value: mean of variable of same name by activity and subject

###Variable 85
  * Name: angletbodygyrojerkmeangravitymean
  * Type: Double
  * Units: Relative angle reading normalized to range.  Originally radians
  * Computed: Mean angle between tbodygyrojerk and gravity force vectors
  * Value: mean of variable of same name by activity and subject

###Variable 86
  * Name: anglexgravitymean
  * Type: Double
  * Units: Relative angle reading normalized to range.  Originally radians
  * Computed: Mean angle between x vector and gravity force vectors
  * Value: mean of variable of same name by activity and subject

###Variable 87
  * Name: angleygravitymean
  * Type: Double
  * Units: Relative angle reading normalized to range.  Originally radians
  * Computed: Mean angle between y vector and gravity force vectors
  * Value: mean of variable of same name by activity and subject

###Variable 88
  * Name: anglezgravitymean
  * Type: Double
  * Units: Relative angle reading normalized to range.  Originally radians
  * Computed: Mean angle between z vector and gravity force vectors
  * Value: mean of variable of same name by activity and subject
