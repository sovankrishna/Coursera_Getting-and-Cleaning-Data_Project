install.packages("plyr") # Installing the package "plyr"
library(plyr) # Loading the package "plyr"

#==========================================================================================#
# Task 1 (Merging the training and test sets to create one data set)
#------------------------------------------------------------------------------------------#
Train_X <- read.table("train/X_train.txt")
Train_Y <- read.table("train/y_train.txt")
Sub_Train <- read.table("train/subject_Train.txt")

Test_X <- read.table("test/x_test.txt")
Test_Y <- read.table("test/y_test.txt")
Sub_Test <- read.table("test/subject_test.txt")

x_data <- rbind(Train_X, Test_X) # creating 'x' data set

y_data <- rbind(Train_Y, Test_Y) # creating 'y' data set

Sub_Data <- rbind(Sub_Train, Sub_Test) # creating 'subject' data set
#==========================================================================================#

#==========================================================================================#
# Task 2 (Extracting only the measurements on the mean and standard deviation for each measurement)
#------------------------------------------------------------------------------------------#
Features <- read.table("features.txt")

# geting the only columns with mean() or std() in their names
Mean_std_Features <- grep("-(mean|std)\\(\\)", Features[, 2])

# subseting the desired columns
x_data <- x_data[, Mean_std_Features]

# correcting the column names
names(x_data) <- Features[Mean_std_Features, 2]
#==========================================================================================#


#==========================================================================================#
# Task 3 (Using descriptive activity names to name the Actsivities in the data set)
#------------------------------------------------------------------------------------------#
Actsivities <- read.table("activity_labels.txt")

# updating values with correct activity names
y_data[, 1] <- Actsivities[y_data[, 1], 2]

# correcting column name
names(y_data) <- "activity"

#==========================================================================================#
# Task 4 (Labeling the data set with descriptive variable names appropriately)
#------------------------------------------------------------------------------------------#
names(Sub_Data) <- "subject" # correcting column name

Full_data <- cbind(x_data, y_data, Sub_Data)# binding all the data into a single data set

# =========================================================================================#
# Task 5 (Creating a second independant tidy data set called "Average_Data" with the average of each variable)
#------------------------------------------------------------------------------------------#
Avg_Data <- ddply(Full_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(Avg_Data, "Average_Data.txt", row.name=FALSE)
