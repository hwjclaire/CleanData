
Cousera online course: Getting and Cleaning Data 
Course project by Quan Wan
Sun Apr 12 17:44:23 CDT 2015

####################################################################################
Project Objects:
1. Download smartphone accelerometer data from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. merge data from traing and test sets, extract mean/std values and store in data.table
3. In a seperate table categorize data into mean values for different subjects and activities


####################################################################################
Software:
R version 3.1.3 (2015-03-09) -- "Smooth Sidewalk"
Copyright (C) 2015 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin13.4.0 (64-bit)
Operating system: MacOSX Yosemite 10.10.3

####################################################################################
Files:
run_analysis.R:         executable R script for the objects
data.zip:               downloaded raw data zip file
data/:                  raw data folder extracted from zip
Codebook.md:            description of methods in run_analysis.R
FinalData.txt:          tidy data after merging and exctraction
AverageByActivity.txt:  averaged Data for different activities
AverageBySubject.txt:   averaged Data for different subjects
