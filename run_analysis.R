# Top-level function that outputs tidy data from a local unzipped
# copy of the UCI HAR Dataset. Various assumptions and pre-conditions
# are indicated in the accompanying README.md.
# Descriptions of variables in the output file are included in
# the CodeBook.md.
run_analysis <- function() {
    require(reshape2)
    #0. Read Data from Files
    message("Reading data from files...")
    X_test<-read.table("UCI\ HAR\ Dataset/test/X_test.txt")
    message("...X_test done!")
    X_train<-read.table("UCI\ HAR\ Dataset/train/X_train.txt")
    message("...X_train done!")
    acts_test<-read.table("UCI\ HAR\ Dataset/test/y_test.txt")
    acts_train<-read.table("UCI\ HAR\ Dataset/train/y_train.txt")
    subject_test<-read.table("UCI\ HAR\ Dataset/test/subject_test.txt")
    subject_train<-read.table("UCI\ HAR\ Dataset/train/subject_train.txt")
    message("Done reading data!")
    
    #1. Merge Test and Training Sets
    message("Row binding test sets to training sets...")
    X_data<-rbind(X_test, X_train) #Merge raw data
    rm(X_test, X_train)
    
    acts_data<-rbind(acts_test, acts_train) #Merge activities
    rm(acts_test, acts_train)
        
    subject_data<-rbind(subject_test, subject_train) #Merge subjects
    rm(subject_test, subject_train)
    message("Done!")
    
    #Convert to factor vectors
    acts_data$V1<-as.factor(acts_data$V1)
    subject_data$V1<-as.factor(subject_data$V1)
    
    #Note that we postpone merging X_data, acts_data, and
    #subject_data until the end of step 4.
    
    
    #2. Extract mean() and std() for Each Measurement
    feature_names<-read.table("UCI\ HAR\ Dataset/features.txt")
    mean_std_cols<-grep("mean\\(|std", feature_names$V2)
    X_data<-X_data[, mean_std_cols]
    
    #Prep for step 4 by setting initial column names
    message("Naming things...")
    names(X_data)<-feature_names$V2[mean_std_cols]
    rm(feature_names, mean_std_cols)
    
    
    #3. Set Descriptive Activity Names
    acts_labels<-read.table("UCI\ HAR\ Dataset/activity_labels.txt")
    levels(acts_data$V1)<-as.character(acts_labels$V2)
    rm(acts_labels)
    
    
    #4. Set Descriptive Variable Names
    #Set names for non-merged variables
    names(acts_data)<-"Activity"
    names(subject_data)<-"Person_ID"
    #Clean up names for the big data set
    names(X_data)<-makeGoodNames(names(X_data))
    message("Done!")
    
    #With everything named, combine the data to complete
    #the merge from step 1.
    all_data<-cbind(subject_data, acts_data, X_data)
    rm(subject_data, acts_data, X_data)
    
    #5. Make a New Tidy Data Set    
    tidy<-melt(all_data,id=c("Person_ID","Activity"))
    tidy<-dcast(tidy, Person_ID + Activity ~ variable, mean)
    
    #Write New Data Set to File
    message("Writing 'tidy_averages.txt' file...")
    write.table(tidy, file="tidy_averages.txt", row.names=FALSE)
    message("Done!")
}

#Given names(X_data), makeGoodNames() returns a character
#vector of descriptive names.
#For extended description, see section ##4 of README.md.
makeGoodNames <- function(names) {
    #First, fix error in original data where "Body" is duplicated
    #for some variables.
    names<-sub("BodyBody","Body", names)
    
    #Add Descriptions for mean() and std()
    names<-sub("(.*)-mean\\(\\)","Mean.of.the.\\1", names)
    names<-sub("(.*)-std\\(\\)","Standard.Deviation.of.the.\\1", names)
    
    #Insert Fourier Transform (or not) descriptions
    names<-sub("(.*of\\.the\\.)f","\\1Fourier.Transform.of.the.", names)
    names<-sub("(.*of\\.the\\.)t","\\1", names)
    
    #Add descriptions for axes and magnitudes
    names<-sub("(.*of\\.the\\.)(.*)-(X|Y|Z)",
                "\\1\\3.axis.of.the.\\2",
                names)
    names<-sub("(.*of\\.the\\.)(.*)Mag",
               "\\1Magnitude.of.the.\\2",
               names)
    
    #Add linear and angular rate descriptions
    names<-sub("(.*of\\.the\\.)(Body)AccJerk",
               "\\1Linear.Jerk.\\2",
               names)
    names<-sub("(.*of\\.the\\.)(Body|Gravity)Acc",
               "\\1Linear.Acceleration.\\2",
               names)
    names<-sub("(.*of\\.the\\.)(Body)GyroJerk",
               "\\1Angular.Acceleration.\\2",
               names)
    names<-sub("(.*of\\.the\\.)(Body)Gyro",
               "\\1Angular.Velocity.\\2",
               names)
    
    #Finally, add the descriptions for "Body" and "Gravity."
    names<-sub("Gravity$","of.the.phone.due.to.Gravity", names)
    names<-sub("Body$",
               "of.the.phone.due.to.Body.Movement.of.Person",
               names)
    names #Return the descriptive names
}