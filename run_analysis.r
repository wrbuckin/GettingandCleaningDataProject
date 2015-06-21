# download the files
if(!file.exists("./GCRdata")){dir.create("./GCRdata")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")
#unzip the download
unzip(zipfile="./GCRdata/Dataset.zip",exdir="./GCRdata")
#list the files in the zip and set the path
path_wearable <- file.path("./GCRdata" , "UCI HAR Dataset")
files<-list.files(path_wearable, recursive=TRUE)
files
#read the data
activityTestData  <- read.table(file.path(path_wearable, "test" , "Y_test.txt" ),header = FALSE)
activityTrainingData <- read.table(file.path(path_wearable, "train", "Y_train.txt"),header = FALSE)

subjectTrainingData <- read.table(file.path(path_wearable, "train", "subject_train.txt"),header = FALSE)
subjectTestData  <- read.table(file.path(path_wearable, "test" , "subject_test.txt"),header = FALSE)

featuresTestData  <- read.table(file.path(path_wearable, "test" , "X_test.txt" ),header = FALSE)
featuresTrainingData <- read.table(file.path(path_wearable, "train", "X_train.txt"),header = FALSE)
#Examine the data properties for each variable
str(activityTestData)
str(activityTrainingData)
str(subjectTrainingData)
str(subjectTestData)
str(featuresTestData)
str(featuresTrainingData)
#Bind the tables by row
dataSubject <- rbind(subjectTrainingData, subjectTestData)
dataActivity<- rbind(activityTrainingData, activityTestData)
dataFeatures<- rbind(featuresTrainingData, featuresTestData)
#establish the names for the variables
names(dataSubject)<-c("subjectID")
names(dataActivity)<- c("activityID")
dataFeaturesHeads <- read.table(file.path(path_wearable, "features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesHeads$V2
#bind the columns and produce a new data frame
dataCombine <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeatures, dataCombine)
#features by mean and std dev of each measure
subdataFeaturesHeads<-dataFeaturesHeads$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesHeads$V2)]
#subset by the selected names of each feature
selectedNames<-c(as.character(subdataFeaturesHeads), "subjectID", "activityID" )
Data<-subset(Data,select=selectedNames)

str(Data)
#read in the activity names from the file
activityLabels <- read.table(file.path(path_wearable, "activity_labels.txt"),header = FALSE)
head(Data$activity,30)
#adjust the names in the dataset
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

names(Data)
#using plyr create the tidy dataset for output
library(plyr);
Data2<-aggregate(. ~subjectID + activityID, Data, mean)
Data2<-Data2[order(Data2$subjectID,Data2$activityID),]
#write the output table for the tidy dataset
write.table(Data2, file = "SamsungSummaryData.txt",row.name=FALSE)

