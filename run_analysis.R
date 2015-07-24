# Getting and Cleaning Data Project
# For additional info, see associated README.md and codebook

# Load libraries
library(reshape2)

# Download and unzip the data file:
filename <- "getdata-projectfiles-UCI HAR Dataset.zip"
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "

if (!file.exists(filename)){
        download.file(fileURL, filename, method="curl") 
        #method not needed for Windows users
}  
if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}
date.downloaded <- date()

# Read activity labels and features
activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity.labels[, 2] <- as.character(activity.labels[, 2])
features <- read.table("UCI HAR Dataset/features.txt")
features[, 2] <- as.character(features[, 2])

# Extract only columns for mean and standard deviation and reformat names
features.extract <- grep(".*mean.*|.*std.*", features[, 2])
features.extract.newnames <- features[features.extract, 2]
features.extract.newnames <- gsub('-mean', '.MEAN', features.extract.newnames)
features.extract.newnames <- gsub('-std', '.STD', features.extract.newnames)
features.extract.newnames <- gsub('[-()]', '', features.extract.newnames)

# Read train datasets
train <- read.table("UCI HAR Dataset/train/X_train.txt")[features.extract]
train.activities <- read.table("UCI HAR Dataset/train/Y_train.txt")
train.subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(train.subjects, train.activities, train)

# Read test datasets
test <- read.table("UCI HAR Dataset/test/X_test.txt")[features.extract]
test.activities <- read.table("UCI HAR Dataset/test/Y_test.txt")
test.subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(test.subjects, test.activities, test)

# Combine train and test datasets; add labels
tidy.data <- rbind(train, test)
colnames(tidy.data) <- c("Subject", "Activity", features.extract.newnames)

# Convert activities and subjects variables back to factors
tidy.data$Activity <- factor(tidy.data$Activity, levels = activity.labels[, 1], 
                             labels = activity.labels[, 2])
tidy.data$Subject <- as.factor(tidy.data$Subject)

# Apply mean via dcast
tidy.data.melt <- melt(tidy.data, id = c("Subject", "Activity"))
tidy.data.mean <- dcast(tidy.data.melt, Subject + Activity ~ variable, mean)

# Write tidy_dataset.txt file
write.table(tidy.data.mean, "tidy_dataset.txt", 
            row.names = FALSE, quote = FALSE)

