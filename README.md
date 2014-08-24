run_analysis
============

run_analysis takes the raw data from the Human Activity Recognition using Smartphones dataset and
outputs two files.

##File 1: totaldata_meanstd.txt

The first file is all observations for all subjects and all positions. It is pruned down to only the means and standard deviations of the observations in the original dataset.

This file contains 81 columns.
"subject" is an integer from 1 to 30 that denotes which human subject the observations are attached to.

"activity" is a character that denotes what activity the particular human subject was observed to be doing for the relavant  observations. There are 6 activities: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", and "LAYING".

The rest of the columns are features described in the features_info.txt file contained in the original raw dataset. Again, these have been pruned down from the original dataset to only reflect the means and standard deviations of the observations.


##File 2: AggregateAverageData

The second file aggregates the first file down to mean of all observations for certain subject-activity pairings.
Since there are 30 subjects, and 6 activities, this means that there are 180 rows, each corresponding to a specific subject-activity pairing.

The columns are identical to those in File 1 (totaldata_meanstd.txt), the only difference is that they represent means of their columns subjected to subject-activity pairings rather than discrete observations.
