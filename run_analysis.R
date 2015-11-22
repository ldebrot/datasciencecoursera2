run_analysis <- function()
{

# Check whether data set is correctly located
if (!file.exists("./data/readme.txt")) stop ("Set your working directory to the folder where the run_analysis.R file is located. This folder should also contain the original dataset. Try again.")

# Check whether dplyr package is installed, installs it if not, load 
if(!require(dplyr)) {
      install.packages("dplyr")
}
library(dplyr)

# Check whether plyr package is installed, installs it if not, load 
if(!require(plyr)) {
      install.packages("plyr")
}
library(plyr)
      
# Check whether reshape package is installed, installs it if not, load 
if(!require(reshape)) {
      install.packages("reshape")
}
library(reshape)
      
# Check whether reshape2 package is installed, installs it if not, load 
if(!require(reshape2)) {
      install.packages("reshape2")
}
library(reshape2)
           
# READ THE FILES
train_labels <- read.table("./data/train/y_train.txt") #shows to which activity each record refers
train_set  <- read.table("./data/train/x_train.txt") #actual data (561 vectors)
train_subjects <- read.table("./data/train/subject_train.txt") #shows which subject is behind each observation

test_labels <- read.table("./data/test/y_test.txt") #shows to which activity each record refers
test_set  <- read.table("./data/test/x_test.txt") #actual data (561 vectors)
test_subjects <- read.table("./data/test/subject_test.txt") #shows which subject is behind each observation

activity_labels <- read.table("./data/activity_labels.txt")
vector_labels <- read.table("./data/features.txt")

# Make valid columnnames out of the vector labels
vector_labels <- make.names(vector_labels[,2],unique=TRUE)

# Appropriate labelling of vector columns
colnames(train_set) <- vector_labels
colnames(test_set) <- vector_labels

# Only select mean and std measurements as indicated in Coursera instructions
train_set <- select(train_set,contains(".std.."), contains(".mean.."))
test_set <- select(test_set,contains(".std.."), contains(".mean.."))

#appropriate labelling of activities, added as new column
ftrain_labels = factor(train_labels[,1])
train_set$activity_id <- factor(train_labels[,1], labels=activity_labels[,2])
ftest_labels = factor(test_labels[,1])
test_set$activity_id <- factor(test_labels[,1], labels=activity_labels[,2])

#remind where observation comes from before merging sets
#train_set$tablename <- "train"
#test_set$tablename <- "test"

#Add subject_id to both tables
train_set$subject_id <- train_subjects[,1]
test_set$subject_id <- test_subjects[,1]

#Merge the clean sets into the master set
master_set <- join(train_set,test_set)

#rearrange data into new tidy dataset according to Coursera instructions --> save it in new txt file
melted <- melt(master_set, id.vars= c("activity_id","subject_id"), na.rm =TRUE)
new_dataset <- cast(data=melted,subject_id + activity_id ~ variable, fun.aggregate=mean)
write.table(new_dataset,file="newdataset.txt",row.name=FALSE)

}