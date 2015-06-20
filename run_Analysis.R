features <-read.table("features.txt");
feature_names <- as.character(features[,2]); 
activity_labels <- read.table("activity_labels.txt");
activity_label_names <- activity_labels[,2];

X_train <- read.table("./train/X_train.txt")
Y_train <- read.table("./train/Y_train.txt")
subject_train <- read.table("./train/subject_train.txt")
body_acc_x_train <- read.table("./train/Inertial Signals/body_acc_x_train.txt")
body_acc_y_train <- read.table("./train/Inertial Signals/body_acc_y_train.txt")
body_acc_z_train <- read.table("./train/Inertial Signals/body_acc_z_train.txt")
body_gyro_x_train<- read.table("./train/Inertial Signals/body_gyro_x_train.txt")
body_gyro_y_train<- read.table("./train/Inertial Signals/body_gyro_y_train.txt")
body_gyro_z_train<- read.table("./train/Inertial Signals/body_gyro_z_train.txt")
total_acc_x_train<- read.table("./train/Inertial Signals/total_acc_x_train.txt")
total_acc_y_train<- read.table("./train/Inertial Signals/total_acc_y_train.txt")
total_acc_z_train<- read.table("./train/Inertial Signals/total_acc_z_train.txt")
train_data <- cbind(Y_train, subject_train, 
                         body_acc_x_train, body_acc_y_train, body_acc_z_train, 
                         body_gyro_x_train, body_gyro_y_train, body_gyro_z_train, 
                         total_acc_x_train, total_acc_y_train, total_acc_z_train,
                         X_train);

X_test <- read.table("./test/X_test.txt")
Y_test <- read.table("./test/Y_test.txt")
subject_test <- read.table("./test/subject_test.txt")
body_acc_x_test <- read.table("./test/Inertial Signals/body_acc_x_test.txt")
body_acc_y_test <- read.table("./test/Inertial Signals/body_acc_y_test.txt")
body_acc_z_test <- read.table("./test/Inertial Signals/body_acc_z_test.txt")
body_gyro_x_test<- read.table("./test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_y_test<- read.table("./test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_z_test<- read.table("./test/Inertial Signals/body_gyro_z_test.txt")
total_acc_x_test<- read.table("./test/Inertial Signals/total_acc_x_test.txt")
total_acc_y_test<- read.table("./test/Inertial Signals/total_acc_y_test.txt")
total_acc_z_test<- read.table("./test/Inertial Signals/total_acc_z_test.txt")
test_data <- cbind(Y_test, subject_test, 
                         body_acc_x_test, body_acc_y_test, body_acc_z_test, 
                         body_gyro_x_test, body_gyro_y_test, body_gyro_z_test, 
                         total_acc_x_test, total_acc_y_test, total_acc_z_test,
                         X_test);

numVariables = 128; 
body_acc_x_ob_num <- paste("body_acc_x_ob", 1:numVariables, sep="");
body_acc_y_ob_num <- paste("body_acc_y_ob", 1:numVariables, sep="");
body_acc_z_ob_num <- paste("body_acc_z_ob", 1:numVariables, sep="");
body_gyro_x_ob_num <- paste("body_gyro_x_ob", 1:numVariables, sep="");
body_gyro_y_ob_num <- paste("body_gyro_y_ob", 1:numVariables, sep="");
body_gyro_z_ob_num <- paste("body_gyro_z_ob", 1:numVariables, sep="");
total_acc_x_ob_num <- paste("total_acc_x_ob", 1:numVariables, sep="");
total_acc_y_ob_num <- paste("total_acc_y_ob", 1:numVariables, sep="");
total_acc_z_ob_num <- paste("total_acc_z_ob", 1:numVariables, sep="");

study_data <- rbind(train_data, test_data); 
colnames(study_data) <- c('result','subject', body_acc_x_ob_num, body_acc_y_ob_num, body_acc_z_ob_num,
                          body_gyro_x_ob_num, body_gyro_y_ob_num, body_gyro_z_ob_num,
                          total_acc_x_ob_num, total_acc_y_ob_num, total_acc_z_ob_num,
                          feature_names); 

#subset that has just mean and std
selectedCol <- c(grep("mean()", names(study_data)),
                 grep("std()", names(study_data))
                 )
subset_study_data <- study_data[,selectedCol];

col_num_tidy <- length(colnames(subset_study_data));
tidy_data <- data.frame(1);

for (i in 1:col_num_tidy)
{
  tidy_data[i] = mean(study_data[,i])
}
colnames(tidy_data) <- colnames(subset_study_data)

write.table(tidy_data, file = "tidy_data.txt", row.names = TRUE);
