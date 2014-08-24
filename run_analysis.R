library(reshape2)
#library(sqldf)
#read in all data
#subject ID data
test_sub <- read.table("subject_test.txt", col.names=c("subject"))
train_sub <- read.table("subject_train.txt", col.names=c("subject"))
#feature data
test_feature <- read.table("X_test.txt")
train_feature <- read.table("X_train.txt")
#activities data
test_activities <- read.table("Y_test.txt")
train_activities <- read.table("Y_train.txt")
#feature labels
feature_labels <- read.table("features.txt", col.names=c("index", "labels"))

#merge the test and train data
sub <- rbind(train_sub, test_sub)
feature <- rbind(test_feature, train_feature)
act_number <- rbind(test_activities, train_activities)

#I never got the below section to correctly change the activity numbers to activity names
#change activity file lines to names from activity_labels.txt
#name column in activities for later merge
colnames(act_number) <- "number"
#read in activity_labels.txt
#act_labels <- read.table("activity_labels.txt", col.names=c("number", "activity"))
#join activites into one df
#activity <- merge(x = act_number, y = act_labels, by = "number", all.X = TRUE)
#leave only activity names
#activity$number <- NULL

#Work with feature_labels. 
feature_vector <- feature_labels$labels
#Check Mean and stdev columns
feature_mean_stdev <- grepl('mean\\(\\)|std\\(\\)',feature_vector)
#make a vector of only features with mean/stdev
feature_vector2 <- as.character(feature_vector[feature_mean_stdev])


#merge all data into one dataframe
everything <- cbind(sub, feature, act_number)


#melt data (this does not work and I am now out of time)
tidy <- melt(everything, id = c("subject", "number") measure.vars = feature_vector2)


write.table(tidy, file = "tidy.txt", row.names = FALSE)
