# The Raw Data

The raw data was obtained from from accelerometers from the Samsung Galaxy S smartphone. This was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

There are 2 sources for the raw data, the test data set and the training dataset. For each set, there features, activity id and subject id data are stored in 3 seperate files. These data has generic column names (e.g. V1, V2... etc)

Two sets of inertial signals data is also available but not used in this analysis.

Detailed description of the the raw data used:

A) Test Data - subset of the complete dataset that was used for testing the model
   * subject_test.txt - this has 2947 rows with single columnn containing subject ID used for the experiment 
   * X_test.txt - this has 2947 rows with 561 columns. Each column represent is a calculated feature
   * y_test.txt - this has 2947 rows with single columnn containing activity ID used for the experiment 

B) Train Data - subset of the complete dataset that was used to train the model
   * subject_train.txt - this has 7352 rows with single columnn containing subject ID used for the experiment 
   * X_train.txt -  this has 7352 rows with 561 columns. Each column represent is a calculated feature
   * y_train.txt - this has 7352 rows with single columnn containing activity ID used for the experiment

C) Supporting Data - additional information used 
   * features.txt - this contains the descriptive name of all the 561 computed features that represents the columns of the 'X' dataset 
   * activity_labels.txt - this contains the list of the aciticty names that is represented by the activity id column in the 'Y' dataset

# The Script

The script aims to merge these training and test dataset into a single tidy dataset with descriptive column and summarize ONLY mean() and std() features by subject and activity.

*Data Processing Steps*
   * Read test files into data tables (feature (x), activity(y) and subject)
   * Read train files into data tables (feature (x), activity(y) and subject)
   * Read feature file into a data table
   * Merge the test and train features data
   * Merge the test and train activitiy ID data
   * Merge the test and train subject data
   * Get the index of the features.txt that has mean() and std() information
   * Get the names of those index that has mean() and std() information
   * Get subset of the merged feature data with only the mean() and std() information
   * Rename subject column name to 'Subject'
   * Rename activity column nam to 'Activity'
   * Rename the feature columns with the feature name that you obtain from the features dataset
   * Merge the subject, activit and features data
   * Rename activity column values with the corresponding activity name from the activity labels file
   * Order the combined dataset by Subject and Activity
   * Summarize the data by getting the mean for each feature per Subject per Activity
   * Return the summarized data

*Running the script*
   * Make sure the data folder is located in the working directory
   * Make sure that the plyr and data.table package is installed
   * Source the script
   * Run the script and assign the output to a variable - you can inspect the output
   * Optionally you can write the output to a text or a csv file
   
   Example
  ```
   source('~/workspace/datasciencecoursera/gettingAndCleaningData/run_analysis.R')
   output <- run_analysis()
   write.table(output, file="output.text", row.names=FALSE)
   write.csv(output, file="output.csv", row.names=FALSE)
   ```


# The Output

The output of the analysis will have a mean summary of all the 79 mean() and std() features for each 30 subject and 6 activity. The ouput would have a dimension of 180 rows (30 dubject X 6 activity) and 81 columns (subject, activity and the 79 features)

