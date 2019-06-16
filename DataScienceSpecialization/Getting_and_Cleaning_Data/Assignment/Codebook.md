## Cockbook

### Preperation
Load library for process the dataframes and character strings.

### Step 1. Read Data and Merge them
1. Read train and test data files
2. Merge them to preprocess in later at once
3. Name "ds1" to the marged data

### Step 2. Extract mean and std
1. Read features file and set to vector
2. Exstact the strings contains "mean" and "std" from the vector and set to the vector named "extract"
3. Exstact the cloumns form dataframe "ds1" by the vecter "extract" added TRUE as last element (that is for Activity labels)

### Step 3. Name the activities
1. Read activity_labels file and create the dataframe to relate activity labels and names
2. Join dataframe "ds1" and activity by label to map the activity labels to names
3. Drop the activity label column

### Step 4.  Labels the data set
1. Set to column's names of the dataframe ds1
2. Write the dataframe "ds1" to DataSet1.csv

### Step 5.  Summarize by Subject and Activity
1. Read subject files
2. Add subject column maned subid to "ds2"
2. Group the dataframe "ds2" by subject and activity
3. Get means of each columns
4. Write the dataframe "ds2" to DataSet2.csv
