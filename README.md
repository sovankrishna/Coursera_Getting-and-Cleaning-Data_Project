#------project: coursera "getting and cleaning the data"--------#
-----------------------------------------------------------------

-------------------
Brief introduction
-------------------
Data set downloaded for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 I have created one R script called run_analysis.R that does the following.
 
1. Merges the training and the test sets to create one data set.
	> The similar data is merged using the rbind() function.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	> output file is called Averages_data.txt which is uploaded to this repository.

--------------------------------------------
Variables described over here in the project
--------------------------------------------
1. Train_X, Train_Y, Test_X, Test_Y, Sub_Train and Sub_Test contain the data from the downloaded files.
2. Data_X, Data_Y and Sub_Data merge the previous datasets to further analysis.
3. Full_Data merges Data_X, Data_Y and Sub_Data into a bigger dataset.
4. The second independant tidy data set is named as "Average_Data" which contains the average of each variable for each activity and each subject.

