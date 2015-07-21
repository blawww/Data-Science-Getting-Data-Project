run_analysis.R is an R script that requires 7 data files from this link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script reads data files from the UCI HAR Dataset and out puts tidy.txt.
The script should be in the same directory as the UCI HAR Dataset folder.

Before running the script, install the R package plyr.  The script depends on this package.

The script:
 1) reads data into dataframes, 
 2) combines the data into one dataframe, 
 3) adds column labels and subject and activitiy factors.
 4) subsets the dataframe to take features that are means and standard deviations
 5) calculates the means of these features for every subject/activity pair.
 6) writes the output data to a file called tidy.txt