#SmartphonesDataCleaningProject
author: Terrance Nearey
date: September 16, 2014


### Goal:  
Produce a text file representing tidy data set with the average of each of several selected variables for each activity and each subject in the combined test and training data.  

### Running the script
The script is called run_analysis.R
It reads data in a subdirectory of its base home directory.
See data structure  section below below.
It produces a (whitespace delimited) text file called SmartphoneMeanStdevSummary.txt
in the same directory. It contains means within-subject and within - activity type
of the variables whose original names have the substings -mean(), -std(), -freqMean().
The variable names are simplified using a camelCase strategy... new words start with
capital letters within the variable names. See _Variable name details_ below.

### Outline of process:
* Stage 1. The "train" data files x\_train.txt, y\_train.txt and subjects\_train.txt are read and consolidated into a single data table. This is done via a call to the included function readTrainOrTest('train')  
* Stage 2. The "test" data files x\_train.txt, y\_train.txt and subjects\_train.txt are read and consolidated into a single data table. This is done via a call to the included function readTrainOrTest('test')  
* Stage 3. The variables are renamed programmatically using gsub and a home-grown function called camelCase included in the script.
* Stage 4. The only  selected measured variables are extracted, namely the ones that originally had the substrings substings -mean(), -std(), -freqMean() n their names.
* Stage 5. Package dplyr's summarise with a by_groups argument  is used to summarize the data. The call is quite cumbersome, so it has been created as a string programmatically and the string is execuated via `eval(parse(text= <long string with necessary summarise command>))`. See are comments in the script -- an alternate method is also shown in the included function `checkSummariesAlternateWay()`.
* Stage 6. The resulting data frame is saved via write.table to the output text file



###Implementation notes:
 The program knows about relies on the relative subdirectory
     structure of the data as unpacked from the zip file (downloaded from
     []http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]  
     See* File structure details *below.


###File structure details
	  There must be a child subdirectory named  "UCI HAR Dataset" with the original files as  unpacked. The file structure should include the following subtree of files:  
	  &gt; UCI HAR Dataset  
	  &gt;  &gt; activity_labels.txt  
	  &gt;  &gt; features.txt  
	  &gt;  &gt; features_info.txt  
	  &gt;  &gt; README.txt  
	  &gt;  &gt; test  
	  &gt;  &gt;  &gt; subject_test.txt  
	  &gt;  &gt;  &gt; X_test.txt  
	  &gt;  &gt;  &gt; y_test.txt  
	  &gt; &gt; train  
	  &gt;  &gt;  &gt; subject_train.txt  
	  &gt;  &gt;  &gt; X_train.txt  
	  &gt;  &gt;  &gt; y_train.txt  
	  
	   _Note the 2 "Inertial Signals" subdirectories are not used._
	

### Variable name details
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