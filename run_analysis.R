# run_analysis.R
# Instructions:: You should create one R script called run_analysis.R that does
# the following.

# 1 Merges the training and the test sets to create one data set.
# 2 Extracts only the measurements on the mean and standard deviation for each measurement.
# 3 Uses descriptive activity names to name the activities in the data set
# 4 Appropriately labels the data set with descriptive variable names.
# 
# 5 From the data set in step 4, creates a second, independent tidy data set with
# the average of each variable for each activity and each subject.
# Location for development: # .../DataCleaningCourseProject/RProgs"

# Assignment deliveribles:
# A) Please upload the tidy data set created in step 5 of the instructions. Please
# upload your data set as a txt file created with write.table() using
# row.name=FALSE (do not cut and paste a dataset directly into the text box, as
# this may cause errors saving your submission).

# B) Please submit a link to a Github repo with the code for performing your
# analysis. The code should have a file run_analysis.R in the main directory
# that can be run as long as the Samsung data is in your working directory. The
# output should be the tidy data set you submitted for part 1. You should
# include a README.md in the repo describing how the script works and the code
# book describing the variables. Note make sure to setwd() to directory where
# run_analysis.R is located


require(data.table)
require(tidyr)
require(dplyr)
DEVEL=TRUE # Set to TRUE for development, FALSE for 'production'

masterDataDir='./UCI HAR Dataset/'




# checkSummariesAlternateWay ----------------------------------------------

checkSummariesAlternateWay<- function () {
# This is a development function to check summarization via another route
    # This checks the results another way.....
    # From answer to this:
    # http://stackoverflow.com/questions/13919587/summarize-based-on-two-grouping-variables-in-r-using-data-table
    
    # 5 From the data set in step 4, creates a second, independent tidy data set with
    # the average of each variable for each activity and each subject.
    # 
    # Try setting your key to both "Group" and "SiteNo":
    #     
    #     From the example under ?key:
    #     
    #     keycols <- c("SiteNo", "Group")
    # setkeyv(e.dt, keycols)
    # 
    # Then, use by as:
    #     
    #     e.dt[, lapply(.SD,mean), by = key(e.dt)]
    # 
    # Alternatively, you can use:
    #     
    #     e.dt[, lapply(.SD,mean), by = "SiteNo,Group"]
    # 
    # or
    # 
    # e.dt[, lapply(.SD, mean), by = list(SiteNo, Group)]
    
    tmpDataTable=data.table(data.frame(selectedXySubject[,1:(ncol(selectedXySubject)-1)])) # we have to not include the last variable (testOrTrain)
    
    keyCols=c("subject","activity")
    setkeyv(tmpDataTable,keyCols)
    summaryDf2=data.frame(tmpDataTable[, lapply(.SD,mean),by=key(tmpDataTable)])
    
    for (icol in 1:ncol(summaryDf)){
        if (is.numeric(summaryDf[,icol])){
            if (all.equal(summaryDf[,icol],summaryDf2[,icol])){
                cat('close enough', names(summaryDf)[icol],'\n')
            }else{
                tdev= mean(abs(summaryDf[,icol]-summaryDf2[,icol]))
                cat('MAD:',tdev)
                cat('   NOT IDENT', names(summaryDf)[icol],'\n')
            }
        }
    }
} # check summaries alternate way



# camelCase function ------------------------------------------------------
camelCase <- function (labels,sep=c('[\\W_]'),perl=TRUE,...){
    # Convert character class separated strings to camelCase.. but leave first letter alone
    # So banana_slug -> bananaSlug ...
    # By default separatore (sep) that get eaten (but trigger toupper() of next letter) are 
    # all perl-ish nonword characters and underscore
    camelCaseOneString <-function(oneLabel,perl=perl){
        splitted <- strsplit(oneLabel, sep,perl=perl,...)[[1]]
        camelCased=paste(toupper(substring(splitted, 1,1)), substring(splitted, 2),
                         sep="", collapse="")
        # Restore first letter
        camelCased=paste0(substring(oneLabel,1,1),substring(camelCased,2))
        return (camelCased)
    }
    camelCasedLabels=c('')
    for (i in 1:length(labels)){
        camelCasedLabels[i]=camelCaseOneString(labels[i],perl=perl)       
    }        
    return(camelCasedLabels)
}

# readTrainOrTestData Data -----------------------------------------------------
readTrainOrTestData<- function (trainOrTest){
    # Given one of the strings 'test' or 'train', 
    # this program
    # 1) Reads appropriate (test or train) versions of the x (smartphone measurements), y (activity type)
    #     into 3 data tables
    # 2) Reads (for x-data) or supplies (for y- and subject-data) the appropriate labels to the column variables
    #   and
    # 3) cbinds the columns into a single data.table
    # 4) Returns the resulting data table
    # NOTES
    # A) The function knows about -- and relies on-- the relative subdirectory
    #       structure of the data as unpacked from the zip file (downloaded from
    #   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
    # B) The format of x-data files (x\_train.txt and y\_train.txt) stymied my attempts
    #   to fast read via *{data.table} fastread()*.
    #   Although *read.table()* works, it is slow. As a workaround during development
    #   and debugging, provided the global variable *DEVEL* is set to *TRUE*, the 
    #   function *readTrainOrTest()* stores temporary files with reserved names in the
    #   base directory. These are read if they exist, otherwise, *read.table()* is
    #   executed and an appropriate file (x_train_temp.RDat or y_train_temp.RDat) is stored in the base directory.
    
    
    if(trainOrTest=='train'|| trainOrTest=='test'){
        tXFile=paste0(masterDataDir,trainOrTest,'/X_',trainOrTest,'.txt')
        tYFile=paste0(masterDataDir,trainOrTest,'/y_', trainOrTest,'.txt')
        tSubjectFile=paste0(masterDataDir,trainOrTest,'/subject_', trainOrTest,'.txt')
    }
    # Can't read this file with data.table::fread 
    # So I've read it with trad.table which works fine
    # trainX=fread(trainXFile,header=FALSE,sep=" ",sep2=NULL,autostart=200L,showProgress=T)#  Couldn't get fread to work but read.table does
    # To sp
    if (DEVEL){ # DEVELOPMENT run
        tmpRDataFile=paste0("./x_", trainOrTest,'_temp.RData')
        if ( file.exists(tmpRDataFile)){
            load(tmpRDataFile)
        }else{
            tX=data.table(read.table(tXFile,header=FALSE))
            save(tX,file=tmpRDataFile) # Save temporary file to speed development
            cat('Saving ',tmpRDataFile,'\n')
        }
    }else{ # production run
        tX=data.table(read.table(tXFile,header=FALSE))
    }
    setnames(tX,names(tX),featureLabels)
    tY=fread(tYFile,header=FALSE)
    setnames(tY,"V1","activity")
    # There seems to be some version volatility in {data.table}fread's 
    # converson of char to factor. See:
    # http://stackoverflow.com/questions/17691050/data-table-still-converts-strings-to-factors
    # So let's make sure
    if (!is.factor(tY$activity)){ tY$activity=as.factor(tY$activity)}
    # rename the activities
    levels(tY$activity)=activitiesLabels
    tSubject=fread(tSubjectFile,header=FALSE)
    setnames(tSubject,"V1","subject")
    if (!is.factor(tSubject$subject)){ tSubject$subject=as.factor(tSubject$subject)}
    
    tXYSubject=cbind(tX,tY,tSubject)
    if (DEVEL)
        print(summary(tXYSubject))
    return(tXYSubject)  
}

# -------------------------------------------------------------
# Take care of the labels 
## IN: masterDataDir DIRECTORY
# The following fies are in masterDataDir ... they describe the variables
# Required for step 4
featureLabelsFile=paste0(masterDataDir,"features.txt")
# variables will be automatically labeled
featureLabels=fread(featureLabelsFile,header=FALSE)$V2

# This file is small enough to encode by hand. It has factor labels for the y-activities variable
# "activity_labels.txt"
# actLabelsFile=paste0(masterDataDir,'activity_labels.txt')
activitiesLabels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS",
                   "SITTING", "STANDING", "LAYING")

# More info is available here
"features_info.txt"
"README.txt"
# -------------------------------------------------------------
# -------------------------------------------------------------
# readTrainingOrTestData 

# read the X, y and subject data into a single data.table append test or train as an extra variable
# This knows about the location of the data sets.

# Read0 _Name3And4_Merge1_ TestAndTraining -----------------------------------------
# -------------------------------------------------------------
# Read the TRAINING data X and Y X are measurements, Y are activity labels (one column)
# 1 Merges the training and the test setsx to create one data set.
# 4 Appropriately labels the data set with descriptive variable names.



# Can't read this file with data.table::fread 
# So I've read it with trad.table which works fine
# trainX=fread(trainXFile,header=FALSE,sep=" ",sep2=NULL,autostart=200L,showProgress=T)#  Couldn't get fread to work but read.table does

trainXySubject=readTrainOrTestData('train')
nrowTrainXySubject=nrow(trainXySubject)
ncolTrainXySubject=ncol(trainXySubject)
origVarNames=names(trainXySubject)
#--------------
testXySubject=readTrainOrTestData('test')

nrowTestXySubject=nrow(testXySubject)
ncolTestXySubject=ncol(testXySubject)

# Make sure names match
stopifnot(identical(names(testXySubject),names(trainXySubject)))

# Add trainOrTest variable to end so we can separate later if necessary
trainXySubject$testOrTrain='train'
testXySubject$testOrTrain='test'
# Merge (stack) the training and testing data.
allXySubject=rbind(trainXySubject,testXySubject)


summary(allXySubject)
# Section SelectMeanAndStdMeasures Stage2 ------------------------------------------
# 2 Extracts only the measurements on the mean and standard deviation for each measurement.
varNames=names(allXySubject)
nvars=length(varNames)
# Last 2 names are not meaurement variables they are 'activity' and 'subject'
xvarNames=varNames[1:(nvars-2)]
# Note stdFreq() does note exist-- only means of frequency domain measures are given
inxMeanStd=grep('mean\\(\\)|meanFreq\\(\\)|std\\(\\)',xvarNames,perl=TRUE)
# Paste on col numbers of activity and subject (nvars-1,nvars)
# Now tame the names
# Tame the names Camel case and get rid of precedin dash
setnames(allXySubject,gsub('-mean()','Mean',names(allXySubject),fixed="TRUE"))
setnames(allXySubject,gsub('-Std()','Std',names(allXySubject),fixed="TRUE"))
setnames(allXySubject,gsub('-meanFreq()','MeanFreq',names(allXySubject),fixed="TRUE"))
setnames(allXySubject,camelCase(names(allXySubject)))
inxSelectedVarCols=c(inxMeanStd,nvars-2,nvars-1,nvars)
selectedVarNames=varNames[inxSelectedVarCols]
# all but last 3 columens are xCols
inx_xCols=1:length(inxMeanStd);
print(selectedVarNames)
# Print out a name substitution list to variablesRenamed.txt
for(i in 1:length(inxMeanStd))
    cat(origVarNames[inxMeanStd[i]]," --> ", selectedVarNames[i],'\n')

# Indexing didnt work on data.table so we'll convert to data frame than b


selectedXySubject=as.data.frame(allXySubject)[ ,inxSelectedVarCols]
selectedVNames=names(selectedXySubject)


# Step 5 Produce by subject, by activity means summary --------------------

# Summarizing by two variables 

# One strategy...
# paste together
# So this works
varSummaryString='';
# The dplyr 'summarise' function requires names of variables in the output 
# i.e, summarise(<groupifiedDataFrame>, outoutName=mean(inputName))
# Doing this by hand would be rediculus. But R is an interpreted language  and
# R lets us feed its interpreter  parsed strings
# We can do this with pasting together long lists of variable names and feed to dplyr::summarise
# via eval(parse(text= <pasted together string>))
# An alternate way is shown in the development function checkSummariesAlternateWay() above.

nxCols=length(inx_xCols)
# var summary string will have names like  
#  "tBodyAccMeanX = mean(tBodyAccMeanX), tBodyAccMeanY = mean(tBodyAccMeanY),...
for (i in 1:nxCols){ 
    print(i)
    tsep=ifelse(i==nxCols, '\n',',\n')
    varSummaryString=paste0(varSummaryString,selectedVNames[inx_xCols[i]],' = mean(',
                            selectedVNames[inx_xCols[i]],')', tsep);

}
if(DEVEL) cat(varSummaryString) # show the string

    # Our desired data frame will be in 
 summarizeCommandString=paste0('summaryDf=summarize(group_by(selectedXySubject,subject,activity),' ,
                      varSummaryString,')' )
if(DEVEL) cat(summarizeCommandString)
eval(parse(text=summarizeCommandString))

# This works
# summarize(group_by(selectedXySubject,subject,activity),tBodyGyroJerkMeanY=mean(tBodyGyroJerkMeanY))
# summarize(group_by(selectedXySubject,subject,activity),tBodyAccMeanX=mean(tBodyAccMeanX))
# names(selectedXySubject)

# Assignment deliveribles:
# A) Please upload the tidy data set created in step 5 of the instructions. Please
# upload your data set as a txt file created with write.table() using
# row.name=FALSE (do not cut and paste a dataset directly into the text box, as
# this may cause errors saving your submission).
# 
# write.table(x, file = "", append = FALSE, quote = TRUE, sep = " ",
#             eol = "\n", na = "NA", dec = ".", row.names = TRUE,
#             col.names = TRUE, qmethod = c("escape", "double"),
#             fileEncoding = "")
write.table(summaryDf,file="SmartphoneMeanStdevSummary.txt",row.names=FALSE)
# B) Please submit a link to a Github repo with the code for performing your
# analysis. The code should have a file run_analysis.R in the main directory
# that can be run as long as the Samsung data is in your working directory. The
# output should be the tidy data set you submitted for part 1. You should
# include a README.md in the repo describing how the script works and the code
# book describing the variables. Note make sure to setwd() to directory where
# run_analysis.R is located

if (DEVEL){
    checkSummariesAlternateWay()
}
 
                    
