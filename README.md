# Getting and Cleaning Data Project 

## Instructions
1. Create GIT Repository for cl3project on github

2. Create local directory for cl3project on local server

3. Configure git locally and issue
  * git remote add cl3project https://github.com/keimig
  * git pull
  * git add run_analysis.R
  * git add project_setup.R
  * git add CodeBook.md
  
4. Customize project_setup.R
  * Change working directory in line 2
  * Execute project_setup.R to download and extract the data

5.  Ensure packages plyr, data.tables, and dplyr are installed 

## run_analysis.R design

1. Read, Set Column Names, and Combine Data 
  * data.table activityFactors - columns (activitycode, activity)
  * data.table y_train         - columns (activitycode, activity)
  * data.table y_test          - columns (activitycode, activity)
  * data.table subject_train   - columns (subjectnumber)
  * data.table subject_test    - columns (subjectnumber)
  * data.table features        - columns (MeasurementColumn, MeasurementName)
  * data.table x_train         - columns (561 data columns with names from features applied)
  * data.table x_text          - columns (561 data columns with names from features applied)
  * combine all into data.table - HummanActivityRecognition (564 data columns)
  * check the resuls, stop if it looks bad

2. MeansAndStd 
  * a "tidy" data.table 
  * contains variables that have mean or std in their names 
  * Verified that all cases are complete
  * Requirements 3 and 4 were handled during the data consolitation phase 

3. Means
  * a "tidy" data.table 
  * one observation for each activity type and subject
  * The measurement varieles are the means of the variables containing mean or std in any form summarized by activity and subject
  * All cases are complete
  * meansByActivityAndSubject.txt - written using write.table 
