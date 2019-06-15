library(tidyverse)

#============================
# Step 1. Read Data and Merge them

train <- read_table('UCI HAR Dataset/train/X_train.txt', col_types=str_dup('d',561), col_names=F)
test  <- read_table('UCI HAR Dataset/test/X_test.txt',   col_types=str_dup('d',561), col_names=F)

ytrain <- read_table('UCI HAR Dataset/train/y_train.txt', col_types='i', col_names='actid')
ytest  <- read_table('UCI HAR Dataset/test/y_test.txt',   col_types='i', col_names='actid')

train <- bind_cols(train, ytrain)
test  <- bind_cols(test,  ytest)

ds1 <- bind_rows(train, test)

#============================
# Step 2. Extract mean and std

features <- read_delim('UCI HAR Dataset/features.txt', delim=' ', col_names=F)
features <-features$X2

extract <- str_detect(features, 'mean|std')

ds1 <- ds1[,c(extract, T)]

#============================
# Step 3. Name the activities

act <- read_table('UCI HAR Dataset/activity_labels.txt', col_types='ic', col_names=c('actid','activity'))
act <- act %>% mutate(activity=factor(activity,levels=act$activity))

ds1 <- ds1 %>% inner_join(act, by='actid') %>% select(-actid)

#============================
# Step 4.  Labels the data set
#
colnames(ds1) <- c(features[extract], colnames(ds1)[ncol(ds1)])

write.csv(ds1, 'DataSet1.csv', quote=T, row.names=F)

#============================
# Step 5.  Summarize by Subject and Activity

strain <- read_table('UCI HAR Dataset/train/subject_train.txt', col_types='i', col_names='subid')
stest  <- read_table('UCI HAR Dataset/test/subject_test.txt',   col_types='i', col_names='subid')

ds2 <- ds1 %>% bind_cols(bind_rows(strain, stest))

ds2 <- ds2 %>% group_by(subid,activity) %>% summarize_all(funs(mean))

write.csv(ds2, 'DataSet2.csv', quote=T, row.names=F)
