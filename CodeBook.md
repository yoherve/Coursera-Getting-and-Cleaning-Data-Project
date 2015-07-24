# CodeBook for Coursera Getting and Cleaning Data Project
Kyle Statham  
July 24, 2015  

## Project Description

Clean and reformat a dataset consisting of data collected from the accelerometers of the Samsung Galaxy S smartphone.

The raw data file is available for download here:

[UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

##Study design and data processing

###Collection of the raw data

See README.txt file included with the downloaded UCI HAR Dataset for details on the raw data.

##Creating the tidy_dataset.txt file

###Guide to create the tidy_dataset.txt file

1. Download and unzip the data file
2. Read activity labels and features
3. Extract only columns for mean and standard deviation and reformat names
4. Read train datasets
5. Read test datasets
6. Combine train and test datasets; add labels
7. Convert activities and subjects variables back to factors
8. Apply mean via dcast
9. Write tidy_dataset.txt file

[See run_analysis.R file for more details](https://github.com/yoherve/Coursera-Getting-and-Cleaning-Data-Project.git)

###Cleaning the data
The R Script run_analysis.R does the following:

1. Combines the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names 
5. From the dataset in step 4, creates a second, independent tidy dataset with the average of each variable for each activity and each subject 

[See README.md file for more details](https://github.com/yoherve/Coursera-Getting-and-Cleaning-Data-Project.git)

##Description of the contents of the tidy_dataset.txt file

The dataset contains 180 observations (6 measurements for each of the 30 subjects) and 81 variables. The variables are the means and standard deviations of the following measurements:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The renamed variables included in the processed dataset are as follows (all variables are numeric unless noted otherwise):

Identifiers:

* Subject - Test subject ID : int
* Activity - Type of activity : Factor with 6 levels LAYING, SITTING, STANDING, WALKING, WALKING-DOWNSTAIRS, WALKING-UPSTAIRS

Measurements:

* tBodyAcc.MEANX
* tBodyAcc.MEANY
* tBodyAcc.MEANZ
* tBodyAcc.STDX
* tBodyAcc.STDY
* tBodyAcc.STDZ
* tGravityAcc.MEANX
* tGravityAcc.MEANY
* tGravityAcc.MEANZ
* tGravityAcc.STDX
* tGravityAcc.STDY
* tGravityAcc.STDZ
* tBodyAccJerk.MEANX
* tBodyAccJerk.MEANY
* tBodyAccJerk.MEANZ
* tBodyAccJerk.STDX
* tBodyAccJerk.STDY
* tBodyAccJerk.STDZ
* tBodyGyro.MEANX
* tBodyGyro.MEANY
* tBodyGyro.MEANZ
* tBodyGyro.STDX
* tBodyGyro.STDY
* tBodyGyro.STDZ
* tBodyGyroJerk.MEANX
* tBodyGyroJerk.MEANY
* tBodyGyroJerk.MEANZ
* tBodyGyroJerk.STDX
* tBodyGyroJerk.STDY
* tBodyGyroJerk.STDZ
* tBodyAccMag.MEAN
* tBodyAccMag.STD
* tGravityAccMag.MEAN
* tGravityAccMag.STD
* tBodyAccJerkMag.MEAN
* tBodyAccJerkMag.STD
* tBodyGyroMag.MEAN
* tBodyGyroMag.STD
* tBodyGyroJerkMag.MEAN
* tBodyGyroJerkMag.STD
* fBodyAcc.MEANX
* fBodyAcc.MEANY
* fBodyAcc.MEANZ
* fBodyAcc.STDX
* fBodyAcc.STDY
* fBodyAcc.STDZ
* fBodyAcc.MEANFreqX
* fBodyAcc.MEANFreqY
* fBodyAcc.MEANFreqZ
* fBodyAccJerk.MEANX
* fBodyAccJerk.MEANY
* fBodyAccJerk.MEANZ
* fBodyAccJerk.STDX
* fBodyAccJerk.STDY
* fBodyAccJerk.STDZ
* fBodyAccJerk.MEANFreqX
* fBodyAccJerk.MEANFreqY
* fBodyAccJerk.MEANFreqZ
* fBodyGyro.MEANX
* fBodyGyro.MEANY
* fBodyGyro.MEANZ
* fBodyGyro.STDX
* fBodyGyro.STDY
* fBodyGyro.STDZ
* fBodyGyro.MEANFreqX
* fBodyGyro.MEANFreqY
* fBodyGyro.MEANFreqZ
* fBodyAccMag.MEAN
* fBodyAccMag.STD
* fBodyAccMag.MEANFreq
* fBodyBodyAccJerkMag.MEAN
* fBodyBodyAccJerkMag.STD
* fBodyBodyAccJerkMag.MEANFreq
* fBodyBodyGyroMag.MEAN
* fBodyBodyGyroMag.STD
* fBodyBodyGyroMag.MEANFreq
* fBodyBodyGyroJerkMag.MEAN
* fBodyBodyGyroJerkMag.STD
* fBodyBodyGyroJerkMag.MEANFreq

See the features_info.txt file included with the downloaded UCI HAR Dataset for more details on the variables.
