library(data.table)
library(dplyr)


# create data directory
if ( file.exists("data") )
{
	unlink("data/",recursive=TRUE)
}
	
# download file and 
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="data.zip", method="curl")
unzip("data.zip")
file.rename("UCI HAR Dataset","data")

# Read x, y, subject from training and test sets
train_Measurement <- data.table(read.table("data/train/X_train.txt", header=FALSE))
test_Measurement <- data.table(read.table("data/test/X_test.txt", header=FALSE))
train_Activity <- data.table(read.table("data/train/y_train.txt", header=FALSE, colClasses ="character"))
test_Activity <- data.table(read.table("data/test/y_test.txt", header=FALSE, colClasses ="character"))
train_Subject <- data.table(read.table("data/train/subject_train.txt", header=FALSE))
test_Subject <- data.table(read.table("data/test/subject_test.txt", header=FALSE))

# Read names of the measurements, number of measurement is the same as the number
# of columns in x
MeasurementNames <- data.table(read.table("data/features.txt", stringsAsFactors = FALSE, header=FALSE))

# mearge training set and test set
Measurement <- rbind(train_Measurement,test_Measurement)
Activity <- rbind(train_Activity,test_Activity)
Subject <- rbind(train_Subject,test_Subject)

# rename columns of Activity and Subject
setnames(Activity, names(Activity), "Activity")
setnames(Subject, names(Subject), "Subject")

# rename columns of Measurement with MeasurementNames
setnames(Measurement,names(Measurement),MeasurementNames$V2)

# rename Activity
Activity[Activity==1] <- "Walking"
Activity[Activity==2] <- "WalkingUp"
Activity[Activity==3] <- "WalkingDown"
Activity[Activity==4] <- "Sitting"
Activity[Activity==5] <- "Standing"
Activity[Activity==6] <- "Laying"

# extract measurements for mean and std values only
Measurement <- Measurement[,grep("mean\\(\\)|std\\(\\)",colnames(Measurement)),with=FALSE]

# join Subject, Activity and Measurement
FinalData <-cbind(Subject,Activity,Measurement)

# aggregate average values by activity and subject
AverageByActivity <- aggregate(FinalData,FUN=mean,by=Activity,na.rm=TRUE)
AverageByActivity <- AverageByActivity[,-(2:3)]
AverageBySubject <- aggregate(FinalData,FUN=mean,by=Subject,na.rm=TRUE)
AverageBySubject <- AverageBySubject[,-(2:3)]

# output the final data and the data averaged over activities and subjects
write.table(FinalData,"FinalData.txt",row.name=FALSE,)
write.table(AverageByActivity,"AverageByActivity.txt",row.name=FALSE,)
write.table(AverageBySubject,"AverageBySubject.txt",row.name=FALSE,)