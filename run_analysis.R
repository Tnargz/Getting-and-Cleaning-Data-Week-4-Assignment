fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "Folder URL")
unzip(zipfile = "Folder URL")
list.files("Folder URL")
pathdata = file.path("./data", "UCI HAR Dataset")
files = list.files(pathdata, recursive = TRUE)
files

xtrain = read.table(file.path(pathdata, "train", "X_train.txt"), header = FALSE)
ytrain = read.table(file.path(pathdata, "train", "y_train.txt"), header = FALSE)
subject_train = read.table(file.path(pathdata, "train", "subject_train.txt"), header = FALSE)
xtest = read.table(file.path(pathdata, "test", "X_test.txt"), header = FALSE)
ytest = read.table(file.path(pathdata, "test", "y_test.txt"), header = FALSE)
subject_test = read.table(file.path(pathdata, "test", "subject_test.txt"), header = FALSE)
features = read.table(file.path(pathdata, "features.txt"), header = FALSE)
activityLabels = read.table(file.path(pathdata, "activity_labels.txt"), header = FALSE)

colnames(xtrain) = features[,2]
colnames(ytrain) = "activityID"
colnames(subject_train) = "subjectID"
colnames(xtest) = features [,2]
colnames(ytest) = "activityID"
colnames(subject_test) = "subjectID"
colnames(activityLabels) <- c('activityID','activityType')

mrg_train = cbind(ytrain, subject_train, xtrain)
mrg_test = cbind(ytest, subject_test, xtest)
FinalTable = rbind(mrg_train, mrg_test)

colNames = colnames(FinalTable)
meanstd = (grepl("activityID" , colNames) | grepl("subjectID" , colNames) | grepl("mean.." , colNames)| grepl("std.." , colNames))
Finalmeanstd <- FinalTable [ , meanstd == TRUE]

activityNames = merge(Finalmeanstd, activityLabels, by = 'activityID', all.x = TRUE)

CleanData <- aggregate(. ~subjectID + activityID, activityNames, mean)
CleanData <- CleanData[order(CleanData$subjectID, CleanData$activityID),]
write.table(CleanData, "CleanData.txt", row.name = FALSE)

CleanData