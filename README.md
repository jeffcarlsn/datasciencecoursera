---
title: "README.md"
author: "Jeff Carlson"
date: "September 5, 2016"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Getting and Cleaning Data Course Project

This file describes how run_analysis.R script works.

### Obtaining data
First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into a new folder.

Make sure the folder with the data and the run_analysis.R script are both in the current working directory.

### Running the run_analysis R Script
Second, use source("run_analysis.R") command in RStudio.

### Results
The resulting data frame with all the mean and standard deviation values will be available in RStudio named `MeanAndStdCols`.
There is also an output file representing the average values for each mean and standard deviation values by subject and activity in the current working directory called `averages.csv`

Use data <- read.csv("averages.txt",header=FALSE,sep=" ") command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 79 measures.

