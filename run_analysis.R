
# Load the necessary packages
library(data.table, reshape2)

# Download the data
path1 <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,file.path(path1, "data.zip"))
unzip(zipfile="data.zip")

# Load the features
features <- fread(file.path(path1, "UCI HAR Dataset/features.txt"), col.names = c("index", "featureNames"))

# Load the activity labels
actlabs <- fread(file.path(path1, "UCI HAR Dataset/activity_labels.txt"), col.names = c("classLabels", "activityName"))

# Pull only means and standard deviations
wantfeats <- grep("(mean|std)\\(\\)", features[, featureNames])
measurements <- features[wantfeats, featureNames]
measurements <- gsub('[()]', '', measurements)

#Load test datasets
test <- fread(file.path(path1, "UCI HAR Dataset/test/X_test.txt"))[,wantfeats, with = FALSE]
data.table::setnames(test, colnames(test), measurements)
testacts <- fread(file.path(path1, "UCI HAR Dataset/test/Y_test.txt"), col.names = c("Activity"))
testsubs <- fread(file.path(path1, "UCI HAR Dataset/test/subject_test.txt"), col.names = c("SubjectNum"))
test <- cbind(testsubs, testacts, test)

#Load train datasets
train <- fread(file.path(path1, "UCI HAR Dataset/train/X_train.txt"))[, wantfeats, with = FALSE]
data.table::setnames(train, colnames(train), measurements)
trainacts <- fread(file.path(path1, "UCI HAR Dataset/train/Y_train.txt")
                         , col.names = c("Activity"))
trainsubs <- fread(file.path(path1, "UCI HAR Dataset/train/subject_train.txt")
                       , col.names = c("SubjectNum"))
train <- cbind(trainsubs, trainacts, train)

# Merge datasets
all <- rbind(train,test)

# Properly labeling the combined dataset
all[["Activity"]] <- factor(all[,Activity], levels = actlabs[["classLabels"]], 
                            labels = actlabs[["activityName"]])
all[["SubjectNum"]] <- as.factor(all[,SubjectNum])
all <- reshape2::melt(data = all, id = c("SubjectNum", "Activity"))
all <- reshape2::dcast(data = all, SubjectNum + Activity ~ variable, fun.aggregate = mean)

#Write the tidy data set
data.table::fwrite(x = all, file = "tidy.csv", quote = FALSE)
