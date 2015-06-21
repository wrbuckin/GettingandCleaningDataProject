Cleaning and Getting Data course project code book
Analysis process

The analysis script, run_analysis.R reads in the processed experiment data and performs a number of steps to get it into summary form.

Both the processed test and training datasets are read in and merged into one data frame.
The data columns are then given names based on the features.txt file.
Columns that hold mean or standard deviation measurements are selected from the dataset, while the other measurement columns are excluded from the rest of the analysis.
The activity identifiers are replaced with the activity labels based on the activity_labels.txt file.
Invalid characters (() and - in this case) are removed from the column names. Also, duplicate phrase BodyBody in some columns names is replaced with Body.
The data is then grouped by subject and activity, and the mean is calculated for every measurement column.
Finally, the summary dataset is written to a file, SamsungSummaryData.txt.


Columns in output file

The columns included in the output file are listed below:

subjectID - The id of the experiment participant.
activityID - The name of the activity that the measurements correspond to, like RUNNING or WALKING.
All of the following fields represent the mean (-mean) or the standard deviation (-std) of recorded data points for the given subject and activity. The detailed description of the different measurement types can be found in the features_info.txt file included in the data zip file.
   
 timeBodyAccelerometer-mean()-X   
 timeBodyAccelerometer-mean()-Y   
 timeBodyAccelerometer-mean()-Z   
 timeBodyAccelerometer-std()-X   
 timeBodyAccelerometer-std()-Y   
 timeBodyAccelerometer-std()-Z   
 timeGravityAccelerometer-mean()-X   
 timeGravityAccelerometer-mean()-Y   
 timeGravityAccelerometer-mean()-Z   
 timeGravityAccelerometer-std()-X   
 timeGravityAccelerometer-std()-Y   
 timeGravityAccelerometer-std()-Z   
 timeBodyAccelerometerJerk-mean()-X   
 timeBodyAccelerometerJerk-mean()-Y   
 timeBodyAccelerometerJerk-mean()-Z   
 timeBodyAccelerometerJerk-std()-X   
 timeBodyAccelerometerJerk-std()-Y   
 timeBodyAccelerometerJerk-std()-Z   
 timeBodyGyroscope-mean()-X   
 timeBodyGyroscope-mean()-Y   
 timeBodyGyroscope-mean()-Z   
 timeBodyGyroscope-std()-X   
 timeBodyGyroscope-std()-Y   
 timeBodyGyroscope-std()-Z   
 timeBodyGyroscopeJerk-mean()-X   
 timeBodyGyroscopeJerk-mean()-Y   
 timeBodyGyroscopeJerk-mean()-Z   
 timeBodyGyroscopeJerk-std()-X   
 timeBodyGyroscopeJerk-std()-Y   
 timeBodyGyroscopeJerk-std()-Z   
 timeBodyAccelerometerMagnitude-mean()   
 timeBodyAccelerometerMagnitude-std()   
 timeGravityAccelerometerMagnitude-mean()   
 timeGravityAccelerometerMagnitude-std()   
 timeBodyAccelerometerJerkMagnitude-mean()   
 timeBodyAccelerometerJerkMagnitude-std()   
 timeBodyGyroscopeMagnitude-mean()   
 timeBodyGyroscopeMagnitude-std()   
 timeBodyGyroscopeJerkMagnitude-mean()   
 timeBodyGyroscopeJerkMagnitude-std()   
 frequencyBodyAccelerometer-mean()-X   
 frequencyBodyAccelerometer-mean()-Y   
 frequencyBodyAccelerometer-mean()-Z   
 frequencyBodyAccelerometer-std()-X   
 frequencyBodyAccelerometer-std()-Y   
 frequencyBodyAccelerometer-std()-Z   
 frequencyBodyAccelerometerJerk-mean()-X   
 frequencyBodyAccelerometerJerk-mean()-Y   
 frequencyBodyAccelerometerJerk-mean()-Z   
 frequencyBodyAccelerometerJerk-std()-X   
 frequencyBodyAccelerometerJerk-std()-Y   
 frequencyBodyAccelerometerJerk-std()-Z   
 frequencyBodyGyroscope-mean()-X   
 frequencyBodyGyroscope-mean()-Y   
 frequencyBodyGyroscope-mean()-Z   
 frequencyBodyGyroscope-std()-X   
 frequencyBodyGyroscope-std()-Y   
 frequencyBodyGyroscope-std()-Z   
 frequencyBodyAccelerometerMagnitude-mean()   
 frequencyBodyAccelerometerMagnitude-std()   
 frequencyBodyAccelerometerJerkMagnitude-mean()   
 frequencyBodyAccelerometerJerkMagnitude-std()   
 frequencyBodyGyroscopeMagnitude-mean()   
 frequencyBodyGyroscopeMagnitude-std()   
 frequencyBodyGyroscopeJerkMagnitude-mean()   
 frequencyBodyGyroscopeJerkMagnitude-std() 

Detailed information on the experiment and the data can be found in the README.txt and features_info.txt files included in the experiment data zip file or find more information on the dataset homepage.