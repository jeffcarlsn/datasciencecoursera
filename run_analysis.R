# Set working directory
  setwd ("..")
  setwd("Google Drive")
  setwd("Coursera Data Science")
  setwd("Getting_cleaning_data")
  setwd("UCI HAR Dataset")

# Install and load necessary R packages
  install.packages("dplyr")
  library(dplyr)
  install.packages("xlsx")
  library(xlsx)

# Read in Test data: activities, subjects, and measurements

      # Read in activity numbers, replace with activity names
        urll1 <- "test/Y_test.txt"
        test_labels <- read.csv(urll1,header=FALSE,sep=" ")
        #test_labels[,1] <- as.numeric(as.character(test_labels[,1]))
      
      # Read in subjects file
        urlsubject <- "test/subject_test.txt"
        subjects <- read.csv(urlsubject,header=FALSE,sep=" ")
      
      # Read in test measurements
        url1 <- "test/X_test.txt"
        test_x <- data.frame(row.names = test_labels)
        test_x <- read.table(url1,header=FALSE)
      
      # Combine subjects, activities, and measurements
        cb_test <- cbind(subjects,test_labels,test_x)
        colnames(cb_test)[1:2] <- c("subject","activitynumber")
        colnames(cb_test[1:2])

# Repeat steps above for train data: activities, subjects, and measurements

      # Read in activity numbers, replace with activity names
        urll3 <- "train/Y_train.txt"
        train_labels <- read.csv(urll3,header=FALSE,sep=" ")
        #train_labels1 <- merge(train_labels,activities,by.x="V1",by.y ="number",sort=FALSE)
      
      # Read in subjects file
        urlsubject <- "train/subject_train.txt"
        subjects <- read.csv(urlsubject,header=FALSE,sep=" ")
      
      # Read in train measurements
        url2 <- "train/X_train.txt"
        train_x <- data.frame(row.names = train_labels)
        train_x <- read.table(url2,header=FALSE)
      
      # Combine subjects, activities, and measurements
        cb_train <- cbind(subjects,train_labels,train_x)
        colnames(cb_train)[1:2] <- c("subject","activity")
        colnames(cb_train[1:2])

# (1) Combine test and train files
    rb <- rbind(cb_test,cb_train)

# (3) Replace activity numbers with labels
    urll2 <- "activity_labels.txt"
    activities <- read.csv(urll2,header=FALSE,sep=" ")
    rb1 <- merge(rb,activities,by.x="activitynumber",by.y ="V1", all.y=FALSE,sort=FALSE)
    rb2 <- rb1[,c(564,2:563)]
    colnames(rb2)[1]<- "activity"

# (4) Add measurement labels
    urlfeatureslabels <- "features.txt"
    featureslabels <- read.csv(urlfeatureslabels,header=FALSE,sep=" ")
    colnames(rb)[3:563] <- as.character(featureslabels[,2])

# (2) subset dataframe to only those measurements with "mean" or "std" in the names
    MeanAndStdCols <- rb2[,grepl(("subject|activity|mean()|std()"),colnames(rb))]

# (5) create aggregated means of measurements for each subject and activity and create output file               
    averages <-aggregate(MeanAndStdCols[,3:81],by=MeanAndStdCols[c("subject","activity")],
                         FUN=mean,drop=FALSE,na.rm=TRUE)
    write.csv(averages,file='averages.csv')