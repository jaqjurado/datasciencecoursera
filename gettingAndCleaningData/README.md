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
   # Read test files into data tables
   # Read train files into data tables
   # Read feature file into a data table

# The Output

blah

