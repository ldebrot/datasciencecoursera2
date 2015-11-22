## Coursera class : Introduction into data science - Process Data Assignment

## The content of this repository:
- The old data set (in the data folder)
- The analysis script (run_analysis.R)
- A new dataset produced by the analysis script (newdataset.txt)
- The code book to the new dataset (codebook.txt)

## The analysis script run_analysis.R

The filename of the analysis script is run_analysis.R

The analysis script loads the run_analysis function.
Run the run_analysis() function without any arguments to produce a new dataset.

# What the analysis script does :
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement
  (therefore the separate datasets in the original "Inertial Signals" folders 
  are not included during the process). 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- Based on the dataset created above, generates a second, 
independent tidy data set with the average of each variable 
for each activity and each subject. The new data set is saved in a file
called "newdataset.txt" located in the working directory.

--> The script loads and, if necessary, installs any required R package to run the code.
    See script code for detailed description of data processing.