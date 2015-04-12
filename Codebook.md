codebook:


1. data layout:

               ----------------------------------------------------------------------------------------------
Column names:         "Subject"                |      "Activity"         |   data/features.txt$V2
               --------------------------------+-------------------------+-----------------------------------
Data:            data/train/subject_train.txt  | data/train/y_train.txt  |   data/train/X_train.txt
Data:            data/train/subject_test.txt   | data/train/y_test.txt   |   data/train/X_test.txt


2. data manipulations 

raw data from read.table are merged according to the above geometry using rbind() and cbind() functions
Column names are defined using column 2 in data/features.txt except the first two columns.
Columns whose names do not containing "mean()" or "std()" are deleted.
Activity values are renamed using dictionary in data/activity_labels.txt
Result are stored in FinalData and output as FinalData.txt

Averaged value among subjects and activities are extracted using aggregate() fuction.
The results are output in AverageByActivity.txt and AverageBySubject.txt
