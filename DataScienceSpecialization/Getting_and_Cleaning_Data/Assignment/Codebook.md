## Code Book

### Data Source

The data is collected from the accelerometers from the smartphone and gyroscope under the activity specified below.

- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

#### Activity (Labeled in activity_labels.txt)
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

#### Features (Labeled in features.txt and Descrived in features_info.txt)
The features come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

After some processing the signals, the feature vectors were calculated:

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

1. tBodyAcc-XYZ
2. tGravityAcc-XYZ
3. tBodyAccJerk-XYZ
4. tBodyGyro-XYZ
5. tBodyGyroJerk-XYZ
6. tBodyAccMag
7. tGravityAccMag
8. tBodyAccJerkMag
9. tBodyGyroMag
10. tBodyGyroJerkMag
11. fBodyAcc-XYZ
12. fBodyAccJerk-XYZ
13. fBodyGyro-XYZ
14. fBodyAccMag
15. fBodyAccJerkMag
16. fBodyGyroMag
17. fBodyGyroJerkMag

The set of variables that were estimated from these signals are:

In them, Mean value and Standard deviation will be extracted in the following process.

1. mean(): Mean value
2. std(): Standard deviation
3. mad(): Median absolute deviation 
4. max(): Largest value in array
5. min(): Smallest value in array
6. sma(): Signal magnitude area
7. energy(): Energy measure. Sum of the squares divided by the number of values. 
8. iqr(): Interquartile range 
9. entropy(): Signal entropy
10. arCoeff(): Autorregresion coefficients with Burg order equal to 4
11. correlation(): correlation coefficient between two signals
12. maxInds(): index of the frequency component with largest magnitude
13. meanFreq(): Weighted average of the frequency components to obtain a mean frequency
14. skewness(): skewness of the frequency domain signal 
15. kurtosis(): kurtosis of the frequency domain signal 
16. bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
17. angle(): Angle between to vectors.

### Data Processing

#### Step 1. Read Data and Merge them
1. Read train and test data files
- X_train.txt
- X_test.txt
- y_train.txt
- y_test.txt
2. Merge them to process in later at once
3. Name "ds1" to the marged data

#### Step 2. Extract mean and standard deviation from the columns of measurement
1. Read features file (features.txt) and set to vector
2. Extract the strings contains "mean" and "std" from the vector and set to the new vector named "extract"
3. Extract the columns form dataframe "ds1" by the vecter "extract" added TRUE as last element (that is for Activity labels)

#### Step 3. Set the labels to the activities
1. Read activity_labels file (activity_labels.txt) and create the dataframe to relate activity labels and names
2. Join dataframe "ds1" and activity by label to map the activity labels to names
3. Drop the activity label column

#### Step 4. Set features to the columns of data set
1. Set features (the vector named "extract" created above) to columns' name of the dataframe ds1
2. Write the dataframe "ds1" to DataSet1.csv

#### Step 5.  Summarize by mean for Subject and Activity
1. Read subject files
- subject_train.txt
- subject_test.txt
2. Add subject column maned subid to "ds1"  and names "ds2"
2. Group the dataframe "ds2" by subject and activity
3. Summarize each columns to get mean
4. Write the dataframe "ds2" to DataSet2.csv
