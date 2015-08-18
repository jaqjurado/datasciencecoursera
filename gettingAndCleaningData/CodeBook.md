# The Raw Data

The raw data was obtained from from accelerometers from the Samsung Galaxy S smartphone. This was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

There are 2 sources for the raw data, the test data set and the training dataset. For each set, there features, activity id and subject id data are stored in 3 seperate files. These data has generic column names (e.g. V1, V2... etc)

Two sets of inertial signals data is also available but not used in this analysis.

Features metrics are in **Hz**

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

More detailed information of the raw data is provided in the source zip in the link above.

# The Merged Data

The merging the test and train dataset would generate 10326 rows with 563 columns(561 feature + subject + activity)

# The Summarized Data

The summarized data only uses a subset of the merged dataset. For the summarized data we just used all features metrics that are mean() or std(). This was obtained by looking at the features.txt files to reference which features are means and standard deviation. Instead of using the column vector value as the column name, we referenced the features.txt file and uses the features name there as the column name. We also used the activity information in the activity_labels file to tranform the value of the activity IDs. The summarized data is the average of mean and standard deviation feature metrics  for each subject and activity combination.


