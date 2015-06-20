# courseraWriteUps

# courseraWriteUps

This folder contains two coursera writeups by now.
(1) Getting and Cleaning data: (run_Analysis.R)
   (a) There is a simple R script to read the data from .txt to the corresponding variable. The file name is used as variable name, for example  features <-read.table("features.txt");

   (b) train data and test data are handled seperately and merged together. 
   
   (c) In both files like, total_acc_z_test.csv and total_acc_z_train.csv, there are 128 observation point, and these observation points are named in order as total_acc_z_ob1, total_acc_z_ob2, ... total_acc_z_ob128. 

   (d) The following code did this: 
        body_acc_x_ob_num <- paste("body_acc_x_ob", 1:numVariables, sep="");

   (e) Then the training data and testing data are merged together to be renamed as study_data
        study_data <- rbind(train_data, test_data); 
   
   (f) The variables of the study_data is named by
       colnames(study_data) <- c('result','subject', body_acc_x_ob_num, body_acc_y_ob_num, body_acc_z_ob_num,
                          body_gyro_x_ob_num, body_gyro_y_ob_num, body_gyro_z_ob_num,
                          total_acc_x_ob_num, total_acc_y_ob_num, total_acc_z_ob_num,
                          feature_names); 

   (g) Select the subset that has just mean and std
             selectedCol <- c(grep("mean()", names(study_data)),
                             grep("std()", names(study_data))
                              )
             subset_study_data <- study_data[,selectedCol];

   (h) The tidy data is created by taking the mean on each column of the subset_study_data.

    

   

   

(2) Practical machine learning (ProjectWriteUp.Rmd and ProjectWriteUp.html)
  This submission contains two report files, the Rmarkdown file to generate the htlm and the htlm file. 
