---
title: "CodeBook.md"
author: "Jeff Carlson"
date: "September 5, 2016"
output: html_document
---

# Code Book for Getting and Cleaning Data Course Project

This document describes the code inside `run_analysis.R`. It explains the source of data, transformations, and outputs created for the Getting and Cleaning Data course final assignment.

# Source of data

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data used in this project can be obtained here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# R Analysis Code

The code has several sections:

* Setting Working Directory
* Installing and loading necessary R packages
* Reading and manipulating "Test" data
* Reading and manipulating "Train" data
* Combining Test and Train data into single dataframe
* Replacing activity numbers with activity labels
* Subsetting the dataframe to only those measures that are either means or standard deviations
* Creating aggregated means of measurements for each subject and activity 
* Writing final data to text file

## Variables
### Identity Variables
* subject - The ID assigned to the subject being tested
* activity - The activity that was being performed when the measurement was taken
              (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

### Measures
* TimeBodyAccelerometer-Mean-X
* TimeBodyAccelerometer-Mean-Y
* TimeBodyAccelerometer-Mean-Z
* TimeBodyAccelerometer-StdDev-X
* TimeBodyAccelerometer-StdDev-Y
* TimeBodyAccelerometer-StdDev-Z
* TimeGravityAccelerometer-Mean-X
* TimeGravityAccelerometer-Mean-Y
* TimeGravityAccelerometer-Mean-Z
* TimeGravityAccelerometer-StdDev-X
* TimeGravityAccelerometer-StdDev-Y
* TimeGravityAccelerometer-StdDev-Z
* TimeBodyAccelerometerJerk-Mean-X
* TimeBodyAccelerometerJerk-Mean-Y
* TimeBodyAccelerometerJerk-Mean-Z
* TimeBodyAccelerometerJerk-StdDev-X
* TimeBodyAccelerometerJerk-StdDev-Y
* TimeBodyAccelerometerJerk-StdDev-Z
* TimeBodyGyroscope-Mean-X
* TimeBodyGyroscope-Mean-Y
* TimeBodyGyroscope-Mean-Z
* TimeBodyGyroscope-StdDev-X
* TimeBodyGyroscope-StdDev-Y
* TimeBodyGyroscope-StdDev-Z
* TimeBodyGyroscopeJerk-Mean-X
* TimeBodyGyroscopeJerk-Mean-Y
* TimeBodyGyroscopeJerk-Mean-Z
* TimeBodyGyroscopeJerk-StdDev-X
* TimeBodyGyroscopeJerk-StdDev-Y
* TimeBodyGyroscopeJerk-StdDev-Z
* TimeBodyAccelerometerMagnitude-Mean
* TimeBodyAccelerometerMagnitude-StdDev
* TimeGravityAccelerometerMagnitude-Mean
* TimeGravityAccelerometerMagnitude-StdDev
* TimeBodyAccelerometerJerkMagnitude-Mean
* TimeBodyAccelerometerJerkMagnitude-StdDev
* TimeBodyGyroscopeMagnitude-Mean
* TimeBodyGyroscopeMagnitude-StdDev
* TimeBodyGyroscopeJerkMagnitude-Mean
* TimeBodyGyroscopeJerkMagnitude-StdDev
* FrequencyBodyAccelerometer-Mean-X
* FrequencyBodyAccelerometer-Mean-Y
* FrequencyBodyAccelerometer-Mean-Z
* FrequencyBodyAccelerometer-StdDev-X
* FrequencyBodyAccelerometer-StdDev-Y
* FrequencyBodyAccelerometer-StdDev-Z
* FrequencyBodyAccelerometerJerk-Mean-X
* FrequencyBodyAccelerometerJerk-Mean-Y
* FrequencyBodyAccelerometerJerk-Mean-Z
* FrequencyBodyAccelerometerJerk-StdDev-X
* FrequencyBodyAccelerometerJerk-StdDev-Y
* FrequencyBodyAccelerometerJerk-StdDev-Z
* FrequencyBodyGyroscope-Mean-X
* FrequencyBodyGyroscope-Mean-Y
* FrequencyBodyGyroscope-Mean-Z
* FrequencyBodyGyroscope-StdDev-X
* FrequencyBodyGyroscope-StdDev-Y
* FrequencyBodyGyroscope-StdDev-Z
* FrequencyBodyAccelerometerMagnitude-Mean
* FrequencyBodyAccelerometerMagnitude-StdDev
* FrequencyBodyAccelerometerJerkMagnitude-Mean
* FrequencyBodyAccelerometerJerkMagnitude-StdDev
* FrequencyBodyGyroscopeMagnitude-Mean
* FrequencyBodyGyroscopeMagnitude-StdDev
* FrequencyBodyGyroscopeJerkMagnitude-Mean
* FrequencyBodyGyroscopeJerkMagnitude-StdDev

### Reading and manipulating "train and "test" data

Read dataset files from UCI HAR to given name and prefix. Know names are "train" and "test". Known prefixes are "X", "y" and "subject".

Examples:

* `UCI HAR Dataset/train/X_train.txt`
* `UCI HAR Dataset/train/y_train.txt`
* `UCI HAR Dataset/train/subject_train.txt`

### Combining Test and Train data into single dataframe

The returned `rb2` contains a column `activity` with labels integer codes, a column `subject` with subjects integer codes and all other columns from data.


## Replacing activity numbers with activity labels

Uses the `activity_labels` file to replace the activity numbers with descriptive activity names (such as  `WALKING`)

## Subsetting the dataframe to only those measures that are either means or standard deviations

* Identifies the mean and std columns (plus activity and subject) and creates new dataframe `MeanAndStdCols`

## Creating aggregated means of measurements for each subject and activity 

* Summarizes `meanAndStdData` calculating the average for each column for each activity/subject pair to `averages`.

At this point the final data frame `averages` looks like this:

    > head(averages[, 1:5], n=3)
  subject activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z
1       1   LAYING         0.2215982       -0.04051395        -0.1132036
2       2   LAYING         0.2813734       -0.01815874        -0.1072456
3       3   LAYING         0.2755169       -0.01895568        -0.1013005


## Writing final data to text file

Writes `averages` data frame to the outputfile `averages.txt`.
