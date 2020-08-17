
### This document is a codebook that describes the variables, the data, and any transformations that I performed to tidy up the data.


**The Data**

The data is accesible [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

It is provided by the Machine Learning Repository of the University of California - Irvine.

Date: 2012-12-10

It is a characterized as multivariate, time-series data with 10,299 instances and 561 attributes.

Their given description of the data collection process is as follows:
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

**The Variables**

Thankfully, the UCI MLR also describes their attributes:
>For each record in the dataset it is provided: 
> - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
> - Triaxial Angular velocity from the gyroscope. 
> - A 561-feature vector with time and frequency domain variables. 
> - Its activity label. 
> - An identifier of the subject who carried out the experiment.

**The Transformations**

1) The training and tests sets were merged to create one data set.
2) The mean and standard deviation measurements were extracted.
3) Descriptive activity names were added to the data set via labels.
4) A new tidy data set was created with the average for each variable, activity, and subject.
