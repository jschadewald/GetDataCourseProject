#Introduction
Hi!

Before you read this CodeBook, please be sure to read the README.md -- particularly the "Introduction" and the section "About the Codebook and Original Dataset." The purpose of this Codebook is to provide details about the contents of `tidy_averages.txt`, which is produced by `run_analysis()` in `run_analysis.R`.


#Structure of the Codebook
Each entry in the "Variables and Descriptions" section is structured as follows.
> **VariableName**
>
> [Column Number] **_OriginalName_**
>
> _A brief description_

In the above format:
* `VariableName` is the name of the column in `tidy_averages.txt`
* `[ColumnNumber]` is the column number corresponding to `VariableName` in `tidy_averages.txt`
* `OriginalName` is the name of the same variable in the original UCI HAR Dataset.  (see README.md for more information)


All of the values in `tidy_averages.txt` represent averages of the named variable taken over all instances of a given Activity for a given Person_ID in the original UCI HAR Dataset.  Hence, they are actually "Means of Means" and "Means of Standard Deviations," as communicated in the descriptions.  Also note that Note that "Person_ID" and "Activity" were unnamed in the original dataset, so their original names are given as "NA" for "Not Available/Applicable."


#Variables and Descriptions
**Person_ID**

[1] **_NA_**

`Person_ID` is a number from 1 to 30 that represents the human test subject (user of the phone) for whom the data was collected and the measures were calculated.  It was not a named column in the original UCI HAR Dataset, but its values were stored in the `subject_test.txt` and `subject_train.txt` files.


**Activity**

[2] **_NA_**

`Activity` is a factor taking one of the values "STANDING", "SITTING", "LAYING", "WALKING", "WALKING_DOWNSTAIRS", or "WALKING_UPSTAIRS" as indicated in the original UCI HAR Dataset.  The values were manually tagged by the original researchers.  It was not a named column in the original UCI HAR Dataset, but its values were stored in the `y_test.txt` and `y_train.txt` files.


**Mean.of.the.X.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[3] **_tBodyAcc-mean()-X_**

The mean of the `tBodyAcc-mean()-X` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Y.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[4] **_tBodyAcc-mean()-Y_**

The mean of the `tBodyAcc-mean()-Y` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Z.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[5] **_tBodyAcc-mean()-Z_**

The mean of the `tBodyAcc-mean()-Z` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.X.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[6] **_tBodyAcc-std()-X_**

The mean of the `tBodyAcc-std()-X` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Y.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[7] **_tBodyAcc-std()-Y_**

The mean of the `tBodyAcc-std()-Y` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Z.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[8] **_tBodyAcc-std()-Z_**

The mean of the `tBodyAcc-std()-Z` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.X.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Gravity**

[9] **_tGravityAcc-mean()-X_**

The mean of the `tGravityAcc-mean()-X` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Y.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Gravity**

[10] **_tGravityAcc-mean()-Y_**

The mean of the `tGravityAcc-mean()-Y` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Z.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Gravity**

[11] **_tGravityAcc-mean()-Z_**

The mean of the `tGravityAcc-mean()-Z` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.X.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Gravity**

[12] **_tGravityAcc-std()-X_**

The mean of the `tGravityAcc-std()-X` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Y.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Gravity**

[13] **_tGravityAcc-std()-Y_**

The mean of the `tGravityAcc-std()-Y` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Z.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Gravity**

[14] **_tGravityAcc-std()-Z_**

The mean of the `tGravityAcc-std()-Z` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.X.axis.of.the.Linear.Jerk.of.the.phone.due.to.Body.Movement.of.Person**

[15] **_tBodyAccJerk-mean()-X_**

The mean of the `tBodyAccJerk-mean()-X` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Y.axis.of.the.Linear.Jerk.of.the.phone.due.to.Body.Movement.of.Person**

[16] **_tBodyAccJerk-mean()-Y_**

The mean of the `tBodyAccJerk-mean()-Y` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Z.axis.of.the.Linear.Jerk.of.the.phone.due.to.Body.Movement.of.Person**

[17] **_tBodyAccJerk-mean()-Z_**

The mean of the `tBodyAccJerk-mean()-Z` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.X.axis.of.the.Linear.Jerk.of.the.phone.due.to.Body.Movement.of.Person**

[18] **_tBodyAccJerk-std()-X_**

The mean of the `tBodyAccJerk-std()-X` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Y.axis.of.the.Linear.Jerk.of.the.phone.due.to.Body.Movement.of.Person**

[19] **_tBodyAccJerk-std()-Y_**

The mean of the `tBodyAccJerk-std()-Y` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Z.axis.of.the.Linear.Jerk.of.the.phone.due.to.Body.Movement.of.Person**

[20] **_tBodyAccJerk-std()-Z_**

The mean of the `tBodyAccJerk-std()-Z` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.X.axis.of.the.Angular.Velocity.of.the.phone.due.to.Body.Movement.of.Person**

[21] **_tBodyGyro-mean()-X_**

The mean of the `tBodyGyro-mean()-X` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Y.axis.of.the.Angular.Velocity.of.the.phone.due.to.Body.Movement.of.Person**

[22] **_tBodyGyro-mean()-Y_**

The mean of the `tBodyGyro-mean()-Y` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Z.axis.of.the.Angular.Velocity.of.the.phone.due.to.Body.Movement.of.Person**

[23] **_tBodyGyro-mean()-Z_**

The mean of the `tBodyGyro-mean()-Z` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.X.axis.of.the.Angular.Velocity.of.the.phone.due.to.Body.Movement.of.Person**

[24] **_tBodyGyro-std()-X_**

The mean of the `tBodyGyro-std()-X` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Y.axis.of.the.Angular.Velocity.of.the.phone.due.to.Body.Movement.of.Person**

[25] **_tBodyGyro-std()-Y_**

The mean of the `tBodyGyro-std()-Y` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Z.axis.of.the.Angular.Velocity.of.the.phone.due.to.Body.Movement.of.Person**

[26] **_tBodyGyro-std()-Z_**

The mean of the `tBodyGyro-std()-Z` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.X.axis.of.the.Angular.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[27] **_tBodyGyroJerk-mean()-X_**

The mean of the `tBodyGyroJerk-mean()-X` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Y.axis.of.the.Angular.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[28] **_tBodyGyroJerk-mean()-Y_**

The mean of the `tBodyGyroJerk-mean()-Y` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Z.axis.of.the.Angular.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[29] **_tBodyGyroJerk-mean()-Z_**

The mean of the `tBodyGyroJerk-mean()-Z` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.X.axis.of.the.Angular.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[30] **_tBodyGyroJerk-std()-X_**

The mean of the `tBodyGyroJerk-std()-X` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Y.axis.of.the.Angular.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[31] **_tBodyGyroJerk-std()-Y_**

The mean of the `tBodyGyroJerk-std()-Y` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Z.axis.of.the.Angular.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[32] **_tBodyGyroJerk-std()-Z_**

The mean of the `tBodyGyroJerk-std()-Z` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Magnitude.of.the.Linear.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[33] **_tBodyAccMag-mean()_**

The mean of the `tBodyAccMag-mean()` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Magnitude.of.the.Linear.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[34] **_tBodyAccMag-std()_**

The mean of the `tBodyAccMag-std()` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Magnitude.of.the.Linear.Acceleration.of.the.phone.due.to.Gravity**

[35] **_tGravityAccMag-mean()_**

The mean of the `tGravityAccMag-mean()` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Magnitude.of.the.Linear.Acceleration.of.the.phone.due.to.Gravity**

[36] **_tGravityAccMag-std()_**

The mean of the `tGravityAccMag-std()` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Magnitude.of.the.Linear.Jerk.of.the.phone.due.to.Body.Movement.of.Person**

[37] **_tBodyAccJerkMag-mean()_**

The mean of the `tBodyAccJerkMag-mean()` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Magnitude.of.the.Linear.Jerk.of.the.phone.due.to.Body.Movement.of.Person**

[38] **_tBodyAccJerkMag-std()_**

The mean of the `tBodyAccJerkMag-std()` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Magnitude.of.the.Angular.Velocity.of.the.phone.due.to.Body.Movement.of.Person**

[39] **_tBodyGyroMag-mean()_**

The mean of the `tBodyGyroMag-mean()` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Magnitude.of.the.Angular.Velocity.of.the.phone.due.to.Body.Movement.of.Person**

[40] **_tBodyGyroMag-std()_**

The mean of the `tBodyGyroMag-std()` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Magnitude.of.the.Angular.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[41] **_tBodyGyroJerkMag-mean()_**

The mean of the `tBodyGyroJerkMag-mean()` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Magnitude.of.the.Angular.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[42] **_tBodyGyroJerkMag-std()_**

The mean of the `tBodyGyroJerkMag-std()` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Fourier.Transform.of.the.X.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[43] **_fBodyAcc-mean()-X_**

The mean of the `fBodyAcc-mean()-X` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Fourier.Transform.of.the.Y.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[44] **_fBodyAcc-mean()-Y_**

The mean of the `fBodyAcc-mean()-Y` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Fourier.Transform.of.the.Z.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[45] **_fBodyAcc-mean()-Z_**

The mean of the `fBodyAcc-mean()-Z` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Fourier.Transform.of.the.X.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[46] **_fBodyAcc-std()-X_**

The mean of the `fBodyAcc-std()-X` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Fourier.Transform.of.the.Y.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[47] **_fBodyAcc-std()-Y_**

The mean of the `fBodyAcc-std()-Y` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Fourier.Transform.of.the.Z.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[48] **_fBodyAcc-std()-Z_**

The mean of the `fBodyAcc-std()-Z` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Fourier.Transform.of.the.X.axis.of.the.Linear.Jerk.of.the.phone.due.to.Body.Movement.of.Person**

[49] **_fBodyAccJerk-mean()-X_**

The mean of the `fBodyAccJerk-mean()-X` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Fourier.Transform.of.the.Y.axis.of.the.Linear.Jerk.of.the.phone.due.to.Body.Movement.of.Person**

[50] **_fBodyAccJerk-mean()-Y_**

The mean of the `fBodyAccJerk-mean()-Y` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Fourier.Transform.of.the.Z.axis.of.the.Linear.Jerk.of.the.phone.due.to.Body.Movement.of.Person**

[51] **_fBodyAccJerk-mean()-Z_**

The mean of the `fBodyAccJerk-mean()-Z` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Fourier.Transform.of.the.X.axis.of.the.Linear.Jerk.of.the.phone.due.to.Body.Movement.of.Person**

[52] **_fBodyAccJerk-std()-X_**

The mean of the `fBodyAccJerk-std()-X` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Fourier.Transform.of.the.Y.axis.of.the.Linear.Jerk.of.the.phone.due.to.Body.Movement.of.Person**

[53] **_fBodyAccJerk-std()-Y_**

The mean of the `fBodyAccJerk-std()-Y` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Fourier.Transform.of.the.Z.axis.of.the.Linear.Jerk.of.the.phone.due.to.Body.Movement.of.Person**

[54] **_fBodyAccJerk-std()-Z_**

The mean of the `fBodyAccJerk-std()-Z` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Fourier.Transform.of.the.X.axis.of.the.Angular.Velocity.of.the.phone.due.to.Body.Movement.of.Person**

[55] **_fBodyGyro-mean()-X_**

The mean of the `fBodyGyro-mean()-X` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Fourier.Transform.of.the.Y.axis.of.the.Angular.Velocity.of.the.phone.due.to.Body.Movement.of.Person**

[56] **_fBodyGyro-mean()-Y_**

The mean of the `fBodyGyro-mean()-Y` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Fourier.Transform.of.the.Z.axis.of.the.Angular.Velocity.of.the.phone.due.to.Body.Movement.of.Person**

[57] **_fBodyGyro-mean()-Z_**

The mean of the `fBodyGyro-mean()-Z` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Fourier.Transform.of.the.X.axis.of.the.Angular.Velocity.of.the.phone.due.to.Body.Movement.of.Person**

[58] **_fBodyGyro-std()-X_**

The mean of the `fBodyGyro-std()-X` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Fourier.Transform.of.the.Y.axis.of.the.Angular.Velocity.of.the.phone.due.to.Body.Movement.of.Person**

[59] **_fBodyGyro-std()-Y_**

The mean of the `fBodyGyro-std()-Y` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Fourier.Transform.of.the.Z.axis.of.the.Angular.Velocity.of.the.phone.due.to.Body.Movement.of.Person**

[60] **_fBodyGyro-std()-Z_**

The mean of the `fBodyGyro-std()-Z` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Fourier.Transform.of.the.Magnitude.of.the.Linear.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[61] **_fBodyAccMag-mean()_**

The mean of the `fBodyAccMag-mean()` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Fourier.Transform.of.the.Magnitude.of.the.Linear.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[62] **_fBodyAccMag-std()_**

The mean of the `fBodyAccMag-std()` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Fourier.Transform.of.the.Magnitude.of.the.Linear.Jerk.of.the.phone.due.to.Body.Movement.of.Person**

[63] **_fBodyBodyAccJerkMag-mean()_**

The mean of the `fBodyBodyAccJerkMag-mean()` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Fourier.Transform.of.the.Magnitude.of.the.Linear.Jerk.of.the.phone.due.to.Body.Movement.of.Person**

[64] **_fBodyBodyAccJerkMag-std()_**

The mean of the `fBodyBodyAccJerkMag-std()` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Fourier.Transform.of.the.Magnitude.of.the.Angular.Velocity.of.the.phone.due.to.Body.Movement.of.Person**

[65] **_fBodyBodyGyroMag-mean()_**

The mean of the `fBodyBodyGyroMag-mean()` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Fourier.Transform.of.the.Magnitude.of.the.Angular.Velocity.of.the.phone.due.to.Body.Movement.of.Person**

[66] **_fBodyBodyGyroMag-std()_**

The mean of the `fBodyBodyGyroMag-std()` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Mean.of.the.Fourier.Transform.of.the.Magnitude.of.the.Angular.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[67] **_fBodyBodyGyroJerkMag-mean()_**

The mean of the `fBodyBodyGyroJerkMag-mean()` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.


**Standard.Deviation.of.the.Fourier.Transform.of.the.Magnitude.of.the.Angular.Acceleration.of.the.phone.due.to.Body.Movement.of.Person**

[68] **_fBodyBodyGyroJerkMag-std()_**

The mean of the `fBodyBodyGyroJerkMag-std()` variable from the original UCI HAR Dataset, which had been previously normalized so that all values fell between -1 and 1 (inclusive).  The mean was taken over all values with the same Person_ID and Activity.  The normalization process has rendered the variable unitless.