#Introduction
Hi Reviewer!

Welcome to the README.md, and thank you very much for your consideration! :)

In case you wandered here by mistake and are wondering what this is, it's a submission for the course project of the getdata-009 class on Coursera.org.  This README is designed to expand upon the in-code comments of the accompanying run_analysis.R, to provide my reasoning and interpration of the assignment where any ambiguity exists, and to provide tangible examples of how the data is being manipulated as the code executes.

The code was tested exclusively on 64-bit Windows 7 with 64-bit R 3.1.2 and RStudio 0.98.1087.  It should also be noted that portions of the code use sub() to search and replace values in character vectors, and it's not clear to me whether or to what extent a difference in our locales might affect the results.  For your reference, here is my locale information:
```
> Sys.getlocale()
[1] "LC_COLLATE=English_United States.1252;LC_CTYPE=English_United States.1252;LC_MONETARY=English_United States.1252;LC_NUMERIC=C;LC_TIME=English_United States.1252"
```

If there is a difference in locale between our machines, it might explain some differences in results.  Just in case, I have included sample output throughout Walkthrough Section 4 so that you can follow along and verify that the code works as advertised.


#Running the Script and Reading the Output
1. Download the raw data from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.
2. Unzip it into your working directory so that "UCI HAR Dataset" is visible.
3. Source `run_analysis.R`.
3. Execute `run_analysis()`.
4. A file named "tidy_averages.txt" will be createdin your working directory.
5. Read the file using `tidy<-read.table("tidy_averages.txt", header=TRUE)`.

If there are any errors due to locale, operating system, or software versions in use, please use the walkthough (further below) rather than attempt to debug the code.


#About the Codebook and Original Dataset
The "Human Activity Recognition Using Smartphones Data Set" was designed for use by machine learning algorithms.  As such, you'll notice that the data in `X_test.txt` and `X_train.txt` was normalized so that every variable has minimum -1 and maximum 1.  As such, information about units has been erased and has no meaning in the context of this assignment.  Some unit information still exists in the lower-level data from the "Inertial Signals" folders; however those are expressly outside of the scope of the assignment (https://class.coursera.org/getdata-009/forum/thread?thread_id=58).

Given the above context and given that we intentionally select "descriptive variable names" in `run_analysis()`, the codebook requirement is made quite simple.  It merely needs to contain the variable names, an indication that the variables are unitless, and information about Person_ID and Activity.  So, that's what it contains.


#Walkthrough of the Code
The subsections of the walkthrough are directly related to the in-code comments and very closely related to the numbering provided in the assignment at 
<https://class.coursera.org/getdata-009/human_grading/view/courses/972587/assessments/3/submissions>.

Differences and exceptions are noted in each section as relevant.


##0. Read Data from Files
The code assumes that you have downloaded the zip from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> and unzipped it into your working directory so that the folder "UCI HAR Dataset" is visible.  A total of six files are each read into their own local variable.

I opted not to load any data from the sub-folders named "Inertial Signals" since they are not relevant to the assignment.  For reference, please see the FAQ from Community TA David Hood, here:
<https://class.coursera.org/getdata-009/forum/thread?thread_id=58>.

Of the remaining files in the zip:
* activity_labels.txt is read, used, and described in Section 3.
* features.txt is read, used, and described in Section 2.
* features_info.txt and README.txt are intended purely for human use.


##1. Merge Test and Training Sets
In this section, the six local variables are condensed to three by binding the rows, taking care to preserve the order that test data comes before training data (the order is less important than the fact that it is consistent across all three data sets).  To free up memory, local variables are removed once they are no longer needed.

In a slight deviation from instructions, the activities data and subjects data are left separate from the giant 561-variable data set (named `X_data` in the code).  This is done to make steps 3 and 4 easier.  At the end of Section 4, the activites and subjects are prepended as columns to `X_data` so that there is a single data frame containing all of the required data.

Here, we can see that the order of observations is preserved and consistent:
```
> sum(!X_data[1:2947,]==X_test)
[1] 0
> sum(!X_data[2948:10299,]==X_train)
[1] 0
> sum(!acts_data[1:2947,]==acts_test)
[1] 0
> sum(!acts_data[2948:10299,]==acts_train)
[1] 0
> sum(!subject_data[1:2947,]==subject_test)
[1] 0
> sum(!subject_data[2948:10299,]==subject_train)
[1] 0
```


##2. Extract mean() and std() for Each Measurement
To start, thankfully, features.txt contains abbreviated names for all 561 measurements (columns) in `X_data`.  The code searches `features$V2` for values that match either "mean(" or "std" where the "(" was intentionally included so that we would not get matches for "meanFreq."  The decision to exclude meanFreq values is supported by the FAQ <https://class.coursera.org/getdata-009/forum/thread?thread_id=58>.  It's as good an interpretation as any, and it's quicker.

The values returned from `grep()` to `mean_std_cols` are literally the column numbers of the data that we want to extract, so we use it to subset `X_data` and store the result back into `X_data`.  As well, since it's readily available, we might as well use it to prep the names for the columns of `X_data`, making step 4 easier later.  For reference, here are the columns that were extracted and named:
```
> names(X_data)
 [1] "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"          
 [3] "tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"           
 [5] "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"           
 [7] "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"       
 [9] "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"        
[11] "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"        
[13] "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"      
[15] "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"       
[17] "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"       
[19] "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"         
[21] "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"          
[23] "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"          
[25] "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"     
[27] "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"      
[29] "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"      
[31] "tBodyAccMag-mean()"          "tBodyAccMag-std()"          
[33] "tGravityAccMag-mean()"       "tGravityAccMag-std()"       
[35] "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"      
[37] "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"         
[39] "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"     
[41] "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"          
[43] "fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"           
[45] "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"           
[47] "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"      
[49] "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"       
[51] "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"       
[53] "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"         
[55] "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"          
[57] "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"          
[59] "fBodyAccMag-mean()"          "fBodyAccMag-std()"          
[61] "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"  
[63] "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"     
[65] "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()" 
```


##3. Set descriptive Activity Names
I wanted to be clever here, so I took extra time to ensure the code does what I intended.  The goal is to replace the numeric values in the activities column with the actual words (LAYING, SITTING, etc.) from activity_labels.txt.  The code stores activity_labels.txt in `acts_labels`:
```
> acts_labels
  V1                 V2
1  1            WALKING
2  2   WALKING_UPSTAIRS
3  3 WALKING_DOWNSTAIRS
4  4            SITTING
5  5           STANDING
6  6             LAYING
```

So, we can see that a "1" corresponds to "WALKING" and so on.  Now let's look at the observations in the activities data BEFORE any transformations are done:
```
> head(acts_data$V1)
[1] 5 5 5 5 5 5
Levels: 1 2 3 4 5 6
> tail(acts_data$V1)
[1] 2 2 2 2 2 2
Levels: 1 2 3 4 5 6
> set.seed(1)
> acts_data$V1[sample(1:10299,10)]
 [1] 2 4 6 3 4 4 2 4 6 5
Levels: 1 2 3 4 5 6
> summary(acts_data$V1)
   1    2    3    4    5    6 
1722 1544 1406 1777 1906 1944 
> levels(acts_data$V1)
[1] "1" "2" "3" "4" "5" "6"
```

So, now we have insight into the structure and ordering of `acts_data$V1`.  Wouldn't it be nice if we could just assign the values of `acts_labels$V2` as characters to the levels of `acts_data$V1`?  Yup.
```
> levels(acts_data$V1)<-as.character(acts_labels$V2)
> head(acts_data$V1)
[1] STANDING STANDING STANDING STANDING STANDING STANDING
6 Levels: WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING ... LAYING
> tail(acts_data$V1)
[1] WALKING_UPSTAIRS WALKING_UPSTAIRS WALKING_UPSTAIRS WALKING_UPSTAIRS
[5] WALKING_UPSTAIRS WALKING_UPSTAIRS
6 Levels: WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING ... LAYING
> set.seed(1)
> acts_data$V1[sample(1:10299,10)]
 [1] WALKING_UPSTAIRS   SITTING            LAYING            
 [4] WALKING_DOWNSTAIRS SITTING            SITTING           
 [7] WALKING_UPSTAIRS   SITTING            LAYING            
[10] STANDING          
6 Levels: WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING ... LAYING
> summary(acts_data$V1)
           WALKING   WALKING_UPSTAIRS WALKING_DOWNSTAIRS            SITTING 
              1722               1544               1406               1777 
          STANDING             LAYING 
              1906               1944 
```

Mission accomplished!


##4. Set Descriptive Variable Names
This part of the code first sets descriptive names for the activity and subject variables, then it calls makeGoodNames() to set names for `X_data`, and finally it completes the merging of data by binding activity and subject to the beginning of `X_data` (as columns).  I chose the name "Activity" for obvious reasons, and I chose "Person_ID" because it seems less ambiguous than "Subject" or "Subject_ID" while still maintaining the correct meaning.

The bulk of the work done in the makeGoodNames() function is based on information provided in features_info.txt, and a full description of the meanings of the variables is given in CodeBook.md.  This section of the README covers how the names are transformed by the code.  As noted in the Introduction, the transformations are entirely accomplished through use of the sub() function, so a difference in our locales might result in different behavior if you execute the code on your own machine.

###The makeGoodNames() Function -- Beginnings
I prefer variable names that are easily readable by both humans and machines, so I avoid the use of spaces and instead use the period ('.') character.  As our starting point, recall the current values in `names(X_data)`:
```
> names(X_data)
 [1] "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"          
 [3] "tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"           
 [5] "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"           
 [7] "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"       
 [9] "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"        
[11] "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"        
[13] "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"      
[15] "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"       
[17] "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"       
[19] "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"         
[21] "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"          
[23] "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"          
[25] "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"     
[27] "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"      
[29] "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"      
[31] "tBodyAccMag-mean()"          "tBodyAccMag-std()"          
[33] "tGravityAccMag-mean()"       "tGravityAccMag-std()"       
[35] "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"      
[37] "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"         
[39] "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"     
[41] "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"          
[43] "fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"           
[45] "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"           
[47] "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"      
[49] "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"       
[51] "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"       
[53] "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"         
[55] "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"          
[57] "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"          
[59] "fBodyAccMag-mean()"          "fBodyAccMag-std()"          
[61] "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"  
[63] "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"     
[65] "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()" 
```

Overall, I want the names to read something like:
* Mean.of.the.X.axis.of.the.Acceleration.due.to.Gravity
* Standard.Deviation.of.the.Fourier.Transform.of.the.Magnitude.of.the.Angular.Acceleration.due.to.Body.Movement
* ...and so on.


The first code line of `makeGoodNames()` just makes a fix (as noted in the code comments) to remove the duplicated "Body" in the last 6 variable names.

###Add Descriptions for mean() and std()
The next two code lines are:
```
names<-sub("(.*)-mean\\(\\)","Mean.of.the.\\1",names)
names<-sub("(.*)-std\\(\\)","Standard.Deviation.of.the.\\1",names)
```
What they do is:
1. Match all characters from the beginning of the string to the end of "-mean()" or "-std()" in each name.
2. Keep track of all characters that come before the "-" in "-mean()" or "-std()" with the ()'s.
3. Add the descriptive text to the beginning, and re-insert the remembered string from the ()'s with \\1.
So, for example, "tBodyAccJerk-mean()-X" becomes "Mean.of.the.tBodyAccJerk-X".

The result of executing the first three lines of `makeGoodNames()` is:
```
> names
 [1] "Mean.of.the.tBodyAcc-X"                        
 [2] "Mean.of.the.tBodyAcc-Y"                        
 [3] "Mean.of.the.tBodyAcc-Z"                        
 [4] "Standard.Deviation.of.the.tBodyAcc-X"          
 [5] "Standard.Deviation.of.the.tBodyAcc-Y"          
 [6] "Standard.Deviation.of.the.tBodyAcc-Z"          
 [7] "Mean.of.the.tGravityAcc-X"                     
 [8] "Mean.of.the.tGravityAcc-Y"                     
 [9] "Mean.of.the.tGravityAcc-Z"                     
[10] "Standard.Deviation.of.the.tGravityAcc-X"       
[11] "Standard.Deviation.of.the.tGravityAcc-Y"       
[12] "Standard.Deviation.of.the.tGravityAcc-Z"       
[13] "Mean.of.the.tBodyAccJerk-X"                    
[14] "Mean.of.the.tBodyAccJerk-Y"                    
[15] "Mean.of.the.tBodyAccJerk-Z"                    
[16] "Standard.Deviation.of.the.tBodyAccJerk-X"      
[17] "Standard.Deviation.of.the.tBodyAccJerk-Y"      
[18] "Standard.Deviation.of.the.tBodyAccJerk-Z"      
[19] "Mean.of.the.tBodyGyro-X"                       
[20] "Mean.of.the.tBodyGyro-Y"                       
[21] "Mean.of.the.tBodyGyro-Z"                       
[22] "Standard.Deviation.of.the.tBodyGyro-X"         
[23] "Standard.Deviation.of.the.tBodyGyro-Y"         
[24] "Standard.Deviation.of.the.tBodyGyro-Z"         
[25] "Mean.of.the.tBodyGyroJerk-X"                   
[26] "Mean.of.the.tBodyGyroJerk-Y"                   
[27] "Mean.of.the.tBodyGyroJerk-Z"                   
[28] "Standard.Deviation.of.the.tBodyGyroJerk-X"     
[29] "Standard.Deviation.of.the.tBodyGyroJerk-Y"     
[30] "Standard.Deviation.of.the.tBodyGyroJerk-Z"     
[31] "Mean.of.the.tBodyAccMag"                       
[32] "Standard.Deviation.of.the.tBodyAccMag"         
[33] "Mean.of.the.tGravityAccMag"                    
[34] "Standard.Deviation.of.the.tGravityAccMag"      
[35] "Mean.of.the.tBodyAccJerkMag"                   
[36] "Standard.Deviation.of.the.tBodyAccJerkMag"     
[37] "Mean.of.the.tBodyGyroMag"                      
[38] "Standard.Deviation.of.the.tBodyGyroMag"        
[39] "Mean.of.the.tBodyGyroJerkMag"                  
[40] "Standard.Deviation.of.the.tBodyGyroJerkMag"    
[41] "Mean.of.the.fBodyAcc-X"                        
[42] "Mean.of.the.fBodyAcc-Y"                        
[43] "Mean.of.the.fBodyAcc-Z"                        
[44] "Standard.Deviation.of.the.fBodyAcc-X"          
[45] "Standard.Deviation.of.the.fBodyAcc-Y"          
[46] "Standard.Deviation.of.the.fBodyAcc-Z"          
[47] "Mean.of.the.fBodyAccJerk-X"                    
[48] "Mean.of.the.fBodyAccJerk-Y"                    
[49] "Mean.of.the.fBodyAccJerk-Z"                    
[50] "Standard.Deviation.of.the.fBodyAccJerk-X"      
[51] "Standard.Deviation.of.the.fBodyAccJerk-Y"      
[52] "Standard.Deviation.of.the.fBodyAccJerk-Z"      
[53] "Mean.of.the.fBodyGyro-X"                       
[54] "Mean.of.the.fBodyGyro-Y"                       
[55] "Mean.of.the.fBodyGyro-Z"                       
[56] "Standard.Deviation.of.the.fBodyGyro-X"         
[57] "Standard.Deviation.of.the.fBodyGyro-Y"         
[58] "Standard.Deviation.of.the.fBodyGyro-Z"         
[59] "Mean.of.the.fBodyAccMag"                       
[60] "Standard.Deviation.of.the.fBodyAccMag"         
[61] "Mean.of.the.fBodyAccJerkMag"               
[62] "Standard.Deviation.of.the.fBodyAccJerkMag" 
[63] "Mean.of.the.fBodyBodyGyroMag"                  
[64] "Standard.Deviation.of.the.fBodyGyroMag"    
[65] "Mean.of.the.fBodyGyroJerkMag"              
[66] "Standard.Deviation.of.the.fBodyGyroJerkMag"
```

###Insert Fourier Transform (or not) descriptions
The next two lines use the same technique to add "Fourier.Transform.of.the" to variables beginning with "f" and to remove "t" from the rest.  So for example,
* "Mean.of.the.tBodyAcc-Z" becomes "Mean.of.the.BodyAcc-Z", ("t" is removed) and
* "Mean.of.the.fBodyAcc-Z" becomes "Mean.of.the.Fourier.Transform.of.the.BodyAcc-Z", ("f" is replaced).

###Add descriptions for axes and magnitudes
Next, we add magnitude and axis descriptions.  The first pattern is designed to match the current form of the axis variable names and divide them into 3 parts:
(Everything completed so far)(unconverted part)-(Letter X or Y or Z)
```
For example, the pattern:   (.*of\\.the\\.)(.*)-(X|Y|Z)
Matches the string:         "Mean.of.the.Fourier.Transform.of.the.BodyAccJerk-Z"
Like this:                  (Mean.of.the.Fourier.Transform.of.the.)(BodyAccJerk)-(Z)
And uses these references:  (\\1)(\\2)-(\\3)
In the replacement pattern: \\1\\3.axis.of.the.\\2
That expands like this:     (Mean.of.the.Fourier.Transform.of.the.)(Z).axis.of.the.(BodyAccJerk)
To give:                    "Mean.of.the.Fourier.Transform.of.the.Z.axis.of.the.BodyAccJerk"
```
Similarly, the next line finds "Mag" and introduces the description "Magnitude.of.the." Notice that there is no conflict because none of the names have both an axis and a magnitude, which makes sense because magnitudes are computed by using all three axes.

At this point, the names are almost done:
```
> head(names)
[1] "Mean.of.the.X.axis.of.the.BodyAcc"              
[2] "Mean.of.the.Y.axis.of.the.BodyAcc"              
[3] "Mean.of.the.Z.axis.of.the.BodyAcc"              
[4] "Standard.Deviation.of.the.X.axis.of.the.BodyAcc"
[5] "Standard.Deviation.of.the.Y.axis.of.the.BodyAcc"
[6] "Standard.Deviation.of.the.Z.axis.of.the.BodyAcc"
> tail(names)
[1] "Mean.of.the.Fourier.Transform.of.the.Magnitude.of.the.BodyAccJerk"               
[2] "Standard.Deviation.of.the.Fourier.Transform.of.the.Magnitude.of.the.BodyAccJerk" 
[3] "Mean.of.the.Fourier.Transform.of.the.Magnitude.of.the.BodyGyro"                  
[4] "Standard.Deviation.of.the.Fourier.Transform.of.the.Magnitude.of.the.BodyGyro"    
[5] "Mean.of.the.Fourier.Transform.of.the.Magnitude.of.the.BodyGyroJerk"              
[6] "Standard.Deviation.of.the.Fourier.Transform.of.the.Magnitude.of.the.BodyGyroJerk"
> unique(sub("(.*of\\.the\\.)(.*)","\\2",names))
[1] "BodyAcc"      "GravityAcc"   "BodyAccJerk"  "BodyGyro"     "BodyGyroJerk"
```

###Add linear and angular rate descriptions
Here, I decided to fix another error in the original variable names.  The "Gyro" readings get their names from the fact that a gyroscope produces them.  Gyroscopes measure angular velocity, which can be confirmed via Google and from the features_info.txt, which says "the body linear acceleration and angular velocity were derived in time to obtain Jerk signals."  It's true that Jerk is the time-derivative of acceleration, but the name "GyroJerk" is wrong.  "Gyro" is actually "angular velocity" and the derivative of angular velocity is "angular acceleration" rather than GyroJerk.

So, the code in this portion of `makeGoodNames()` make the following conversions, in order:
* "AccJerk" becomes "Linear.Jerk."
* "Acc" becomes "Linear.Acceleration."
* "GyroJerk" becomes "Angular.Acceleration."
* "Gyro" becomes "Angular.Velocity."
Importantly, note that the patterns recognize either "Body" or "Gravity" and move it to the end of the string.

Here's another snapshot of our nearly-finished names.
```
> head(names)
[1] "Mean.of.the.X.axis.of.the.Linear.Acceleration.Body"              
[2] "Mean.of.the.Y.axis.of.the.Linear.Acceleration.Body"              
[3] "Mean.of.the.Z.axis.of.the.Linear.Acceleration.Body"              
[4] "Standard.Deviation.of.the.X.axis.of.the.Linear.Acceleration.Body"
[5] "Standard.Deviation.of.the.Y.axis.of.the.Linear.Acceleration.Body"
[6] "Standard.Deviation.of.the.Z.axis.of.the.Linear.Acceleration.Body"
> tail(names)
[1] "Mean.of.the.Fourier.Transform.of.the.Magnitude.of.the.Linear.Jerk.Body"                       
[2] "Standard.Deviation.of.the.Fourier.Transform.of.the.Magnitude.of.the.Linear.Jerk.Body"         
[3] "Mean.of.the.Fourier.Transform.of.the.Magnitude.of.the.Angular.Velocity.Body"                  
[4] "Standard.Deviation.of.the.Fourier.Transform.of.the.Magnitude.of.the.Angular.Velocity.Body"    
[5] "Mean.of.the.Fourier.Transform.of.the.Magnitude.of.the.Angular.Acceleration.Body"              
[6] "Standard.Deviation.of.the.Fourier.Transform.of.the.Magnitude.of.the.Angular.Acceleration.Body"
> unique(sub("(.*of\\.the\\.)(.*)","\\2",names))
[1] "Linear.Acceleration.Body"    "Linear.Acceleration.Gravity"
[3] "Linear.Jerk.Body"            "Angular.Velocity.Body"      
[5] "Angular.Acceleration.Body"
```

###Finally, add the descriptions for "Body" and "Gravity."
Here, we recognize that the measurements all apply to the phone by adding "of.the.phone." to the description.  As well, we recognize that the measurements are attributable to either the movement of the subject ("due.to.Body.Movement.of.Person") or to the force of gravity ("due.to.Gravity").

The last step returns the "names" vector from `makeGoodNames()`, where `run_analysis()` assigns it back into `names(X_data)`.

For closure, here's the final snapshot:
```
> head(names)
[1] "Mean.of.the.X.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Body.Movement.of.Person"              
[2] "Mean.of.the.Y.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Body.Movement.of.Person"              
[3] "Mean.of.the.Z.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Body.Movement.of.Person"              
[4] "Standard.Deviation.of.the.X.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Body.Movement.of.Person"
[5] "Standard.Deviation.of.the.Y.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Body.Movement.of.Person"
[6] "Standard.Deviation.of.the.Z.axis.of.the.Linear.Acceleration.of.the.phone.due.to.Body.Movement.of.Person"
> tail(names)
[1] "Mean.of.the.Fourier.Transform.of.the.Magnitude.of.the.Linear.Jerk.of.the.phone.due.to.Body.Movement.of.Person"                       
[2] "Standard.Deviation.of.the.Fourier.Transform.of.the.Magnitude.of.the.Linear.Jerk.of.the.phone.due.to.Body.Movement.of.Person"         
[3] "Mean.of.the.Fourier.Transform.of.the.Magnitude.of.the.Angular.Velocity.of.the.phone.due.to.Body.Movement.of.Person"                  
[4] "Standard.Deviation.of.the.Fourier.Transform.of.the.Magnitude.of.the.Angular.Velocity.of.the.phone.due.to.Body.Movement.of.Person"    
[5] "Mean.of.the.Fourier.Transform.of.the.Magnitude.of.the.Angular.Acceleration.of.the.phone.due.to.Body.Movement.of.Person"              
[6] "Standard.Deviation.of.the.Fourier.Transform.of.the.Magnitude.of.the.Angular.Acceleration.of.the.phone.due.to.Body.Movement.of.Person"
```

###One more thing...
After `makeGoodNames()` finishes execution but before proceeding to step 5, we need to complete the merging of the data from step 1.  This is accompished by using `cbind()`.  The order or arguments to `cbind()` is chosen so that `subjects_data` is the first column and `acts_data` is the second column of the resulting data frame.


##5. Make a New Tidy Data Set
Alright, so the text of the assignment for this part is "From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."  My interpretation is that, for each variable, we are supposed to average over the values that share the same `Person_ID` and the same Activity.  So, for example, the result will contain a single row for `Person_ID=1 and Activity=LAYING`, a different row for `Person_ID=1 and Activity=STANDING`, and so on for all 180 combinations of Person_ID and Activity.
The reshape2 library made this a quick and easy 2-step process, and a quick check shows that the molten data frame "tidy" has the expected number of rows and the right format:
```
> nrow(tidy)
[1] 180
> tidy[1:10,1:2]
   Person_ID           Activity
1          1            WALKING
2          1   WALKING_UPSTAIRS
3          1 WALKING_DOWNSTAIRS
4          1            SITTING
5          1           STANDING
6          1             LAYING
7          2            WALKING
8          2   WALKING_UPSTAIRS
9          2 WALKING_DOWNSTAIRS
10         2            SITTING
```

The last step is to write "tidy" to a file named "tidy_averages.txt" in the current working directory.  The reason this data is tidy is that it meet all three criteria of Tidy Data from the lectures and from the "Tidy Data" paper by Hadley Wickham in the Journal of Statistical Software.
1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table.

We know that 1 is satisfied because there is no way to meaningfully split any of the columns into more columns (i.e. we would not create a Person1 column nor would we create a column for STANDING).  We know that 2 is satisfied because we confirmed above that each row represents means from a unique Person_ID-Activity pair, which forms our observation of that person performing that activity.  Number 3 is satisfied because, again using criteria from lectures and from the Wickham paper, there is no duplication that might suggest we need additional tables.

#Conclusion
Thanks again for your consideration!  I believe this assignment deserves full credit for being correct, descriptive, and exhaustively attentive to detail.  Even so, there is always room for improvement, so I look forward to your kind and constructive feedback.
