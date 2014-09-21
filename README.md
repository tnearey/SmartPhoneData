#SmartphonesDataCleaningProject
author: Terrance Nearey
date: September 16, 2014
Underscore: &#95; ampersand number 9 5 semicolon
Gt &gt; ampersand gt semicolon
Pipe | &#124; ampersand number 1 2 4 semicolon
Split pipe  ¦ &#166; ampersand number 1 6 6 semicolon

## Goal:  
Produce a .csv file representing tidy data set with the average of each of several selected variable for each activity and each subject for the combined test and training data.  
## Outline of process:
* Stage 1. The "train" data files x\_train.txt, y\_train.txt and subjects\_train.txt are read and consolidated into a single data table. This is done via a call to the included function readTrainOrTest('train')  
* Stage 2. The "test" data files x\_train.txt, y\_train.txt and subjects\_train.txt are read and consolidated into a single data table. This is done via a call to the included function readTrainOrTest('test')  
* Stage 3.

###Implementation notes:
1)  The program knows about relies on the relative subdirectory
     structure of the data as unpacked from the zip file (downloaded from
     http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
( see File Structure Details section below fro more)

   # http://hints.macworld.com/article.php?story=20060209130749352
   # cd to the base-working directory.
   # ls -R | grep ":" | sed -e 's/://' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
   # Here's something simpler from here: https://coderwall.com/p/owb6eg
   alias tree="find . -print | sed -e 's;[^/]*/;|;g;s;____|; |;g'"


##File structure details
  There must be a child subdirectory named  "UCI HAR Dataset" with the original files as         unpacked. The file structure should include the following subtree of files:  
  > UCI HAR Dataset  
  >  > activity_labels.txt  
  >  > features.txt  
  >  > features_info.txt  
  >  > README.txt  
  >  > test  
  >  >  > subject_test.txt  
  >  >  > X_test.txt  
  >  >  > y_test.txt  
  > > train  
  >  >  > subject_train.txt
  >  >  > X_train.txt
  >  >  > y_train.txt
   _Note the 2 "Inertial Signals" subdirectories are not used._


## Variable name details
Variables involving mean and standard deviation were simplified in structure
using a 'camelCase' conversion and getting rid of ().
x --> y means x was renamed as y
tBodyAcc-mean()-X  -->  tBodyAccMeanX 
tBodyAcc-mean()-Y  -->  tBodyAccMeanY 
tBodyAcc-mean()-Z  -->  tBodyAccMeanZ 
tBodyAcc-std()-X  -->  tBodyAccStdX 
tBodyAcc-std()-Y  -->  tBodyAccStdY 
tBodyAcc-std()-Z  -->  tBodyAccStdZ 
tGravityAcc-mean()-X  -->  tGravityAccMeanX 
tGravityAcc-mean()-Y  -->  tGravityAccMeanY 
tGravityAcc-mean()-Z  -->  tGravityAccMeanZ 
tGravityAcc-std()-X  -->  tGravityAccStdX 
tGravityAcc-std()-Y  -->  tGravityAccStdY 
tGravityAcc-std()-Z  -->  tGravityAccStdZ 
tBodyAccJerk-mean()-X  -->  tBodyAccJerkMeanX 
tBodyAccJerk-mean()-Y  -->  tBodyAccJerkMeanY 
tBodyAccJerk-mean()-Z  -->  tBodyAccJerkMeanZ 
tBodyAccJerk-std()-X  -->  tBodyAccJerkStdX 
tBodyAccJerk-std()-Y  -->  tBodyAccJerkStdY 
tBodyAccJerk-std()-Z  -->  tBodyAccJerkStdZ 
tBodyGyro-mean()-X  -->  tBodyGyroMeanX 
tBodyGyro-mean()-Y  -->  tBodyGyroMeanY 
tBodyGyro-mean()-Z  -->  tBodyGyroMeanZ 
tBodyGyro-std()-X  -->  tBodyGyroStdX 
tBodyGyro-std()-Y  -->  tBodyGyroStdY 
tBodyGyro-std()-Z  -->  tBodyGyroStdZ 
tBodyGyroJerk-mean()-X  -->  tBodyGyroJerkMeanX 
tBodyGyroJerk-mean()-Y  -->  tBodyGyroJerkMeanY 
tBodyGyroJerk-mean()-Z  -->  tBodyGyroJerkMeanZ 
tBodyGyroJerk-std()-X  -->  tBodyGyroJerkStdX 
tBodyGyroJerk-std()-Y  -->  tBodyGyroJerkStdY 
tBodyGyroJerk-std()-Z  -->  tBodyGyroJerkStdZ 
tBodyAccMag-mean()  -->  tBodyAccMagMean 
tBodyAccMag-std()  -->  tBodyAccMagStd 
tGravityAccMag-mean()  -->  tGravityAccMagMean 
tGravityAccMag-std()  -->  tGravityAccMagStd 
tBodyAccJerkMag-mean()  -->  tBodyAccJerkMagMean 
tBodyAccJerkMag-std()  -->  tBodyAccJerkMagStd 
tBodyGyroMag-mean()  -->  tBodyGyroMagMean 
tBodyGyroMag-std()  -->  tBodyGyroMagStd 
tBodyGyroJerkMag-mean()  -->  tBodyGyroJerkMagMean 
tBodyGyroJerkMag-std()  -->  tBodyGyroJerkMagStd 
fBodyAcc-mean()-X  -->  fBodyAccMeanX 
fBodyAcc-mean()-Y  -->  fBodyAccMeanY 
fBodyAcc-mean()-Z  -->  fBodyAccMeanZ 
fBodyAcc-std()-X  -->  fBodyAccStdX 
fBodyAcc-std()-Y  -->  fBodyAccStdY 
fBodyAcc-std()-Z  -->  fBodyAccStdZ 
fBodyAcc-meanFreq()-X  -->  fBodyAccMeanFreqX 
fBodyAcc-meanFreq()-Y  -->  fBodyAccMeanFreqY 
fBodyAcc-meanFreq()-Z  -->  fBodyAccMeanFreqZ 
fBodyAccJerk-mean()-X  -->  fBodyAccJerkMeanX 
fBodyAccJerk-mean()-Y  -->  fBodyAccJerkMeanY 
fBodyAccJerk-mean()-Z  -->  fBodyAccJerkMeanZ 
fBodyAccJerk-std()-X  -->  fBodyAccJerkStdX 
fBodyAccJerk-std()-Y  -->  fBodyAccJerkStdY 
fBodyAccJerk-std()-Z  -->  fBodyAccJerkStdZ 
fBodyAccJerk-meanFreq()-X  -->  fBodyAccJerkMeanFreqX 
fBodyAccJerk-meanFreq()-Y  -->  fBodyAccJerkMeanFreqY 
fBodyAccJerk-meanFreq()-Z  -->  fBodyAccJerkMeanFreqZ 
fBodyGyro-mean()-X  -->  fBodyGyroMeanX 
fBodyGyro-mean()-Y  -->  fBodyGyroMeanY 
fBodyGyro-mean()-Z  -->  fBodyGyroMeanZ 
fBodyGyro-std()-X  -->  fBodyGyroStdX 
fBodyGyro-std()-Y  -->  fBodyGyroStdY 
fBodyGyro-std()-Z  -->  fBodyGyroStdZ 
fBodyGyro-meanFreq()-X  -->  fBodyGyroMeanFreqX 
fBodyGyro-meanFreq()-Y  -->  fBodyGyroMeanFreqY 
fBodyGyro-meanFreq()-Z  -->  fBodyGyroMeanFreqZ 
fBodyAccMag-mean()  -->  fBodyAccMagMean 
fBodyAccMag-std()  -->  fBodyAccMagStd 
fBodyAccMag-meanFreq()  -->  fBodyAccMagMeanFreq 
fBodyBodyAccJerkMag-mean()  -->  fBodyBodyAccJerkMagMean 
fBodyBodyAccJerkMag-std()  -->  fBodyBodyAccJerkMagStd 
fBodyBodyAccJerkMag-meanFreq()  -->  fBodyBodyAccJerkMagMeanFreq 
fBodyBodyGyroMag-mean()  -->  fBodyBodyGyroMagMean 
fBodyBodyGyroMag-std()  -->  fBodyBodyGyroMagStd 
fBodyBodyGyroMag-meanFreq()  -->  fBodyBodyGyroMagMeanFreq 
fBodyBodyGyroJerkMag-mean()  -->  fBodyBodyGyroJerkMagMean 
fBodyBodyGyroJerkMag-std()  -->  fBodyBodyGyroJerkMagStd 
fBodyBodyGyroJerkMag-meanFreq()  -->  fBodyBodyGyroJerkMagMeanFreq 