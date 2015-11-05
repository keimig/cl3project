project_setup<-function() {
  setwd("~/jhu_ds_track/3_cleandata")
  if (!file.exists("data")) {
    dir.create("data")
  }
  if (!file.exists("./data/Dataset.zip")) {
     fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
     download.file(fileUrl, destfile="./data/Dataset.zip",method="curl") 
  }
  list.files("./data")
  if (!file.exists("./data/UCI HAR Dataset")) {
     setwd("./data")
     system("unzip -qq Dataset.zip ")
     setwd("..")
  }
  else {
    "Setup Already Complete"
  }
  "Setup Complete"  
}
