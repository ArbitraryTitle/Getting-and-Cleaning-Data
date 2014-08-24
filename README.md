Getting-and-Cleaning-Data
=========================

Getting and Cleaning Data class project

This script is supposed to take the fitbit data that was provided in separate files and produce a tidy data file. I did not accomplish this goal but I will outline what I had planned to do here and what I actually did finish. 
The basic plan was to 1) read in the test and train data from the various sources, 2) merge the test and train data with an rbind, 3) change the number data in the activity data to plain text using the activity_data.txt that provides that information, 4) work with the features file to correctly identify what data needs to be included for the means and standard deviation, 5) cbind the three merged train/test data into one dataframe, 6) use the reshape2 package to the data into tidy and finally 7) write the data to a text file. 
I accomplished parts 1, 2, 5 and 7. I ran out of time to effectively finish parts 3, 4 and 6. 
