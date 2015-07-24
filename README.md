# Coursera-Getting-and-Cleaning-Data-Project
Contains the script, markup and codebook files for the class project

The run_analysis.R script does the following:

1.  Download and unzip the data file
2.  Read activity labels and features
3.  Extract only columns for mean and standard deviation and reformat names
4.  Read train datasets
5.  Read test datasets
6.  Combine train and test datasets; add labels
7.  Convert activities and subjects variables back to factors
8.  Apply mean via dcast
9.  Write tidy_dataset.txt file

To view the tidy_dataset.txt file in R, download the file from this GitHub repo into your working directory and run the following code:

data <- read.table("tidy_dataset.txt", header = TRUE)

View(data)


See the run_analysis.R file in this GitHub repo for more details.
