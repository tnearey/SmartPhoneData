
This was submitted late. Since I really didn't understand the raw data, I'm mainly copying info from the original data web site, plus
information in my README.md file in this repository.

The data in tidy_data.text represent summaries (in the form of averages [ arithmetic means] aggregated within  and tabulated by subject and within activity
activity type. The summaries are of selected measurement variables described in the original data source.

The oroginal data source consitits of files unpacked from a zip file downloaded from the web site
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Information about the meaning of the measurements  the README.TXT and the features_info.txt files that were packed in the .zip file.
These files  are copied below in the Appendix section below.

The processed data is based on the following measurement variables, as well as subject numbers and the names of the activity types.

Variables names involving mean and standard deviation in the original were simplified in structure
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

These constituted the first 79 columns of the data.
They are real values in the original units of the raw data set (see the features_info.txt file in appendix 2 below)
Column 80 is a subject id number
Column 81 is an activity identifier, coded as a string. The original names of the activities are taken from
the codes in the original file activity_labels.txt
They are:
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING



Appendix 1 Original README.txt
>==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

Original features_info.txt file:
>Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

