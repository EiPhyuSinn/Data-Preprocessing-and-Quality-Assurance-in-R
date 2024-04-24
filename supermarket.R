install.packages("readr")
install.packages('bit')

library(readr)

#Loading csv file 
Dataset = read_csv('C:/Users/47/Desktop/R Codes/Assignment/supermarket_sale.csv')
View(Dataset)


# Check for duplicates in a data frame and Remove duplicates from a data frame
duplicates <- duplicated(Dataset) | duplicated(Dataset, fromLast = TRUE)
num_duplicates <- sum(duplicates)
duplicate_rows <- Dataset[duplicates, ]
unique_dataset <- unique(Dataset)

#detect missing values
is.na(unique_dataset)
sum(is.na(unique_dataset))
missing_rows <- !complete.cases(unique_dataset)
missing_data <- unique_dataset[missing_rows, ]
View(missing_data)

#Replace missing values with mean value 
unique_dataset[, columns_with_missing] <- lapply(unique_dataset[, columns_with_missing], as.numeric)
means <- colMeans(unique_dataset[, columns_with_missing], na.rm = TRUE)
for (col in columns_with_missing) {
  unique_dataset[is.na(unique_dataset[, col]), col] <- means[col]
}
sum(is.na(unique_dataset))
View(unique_dataset)

#Detect and Remove outliers
boxplot(unique_dataset$`Unit price`,outline = TRUE)

q1 <- quantile(unique_dataset$`Unit price`, 0.25)
q3 <- quantile(unique_dataset$`Unit price`, 0.75)
iqr <- q3 - q1
lower_bound <- q1 - 1.5 * iqr
upper_bound <- q3 + 1.5 * iqr
outliers <- unique_dataset$`Unit price` < lower_bound | unique_dataset$`Unit price` > upper_bound

dataset_no_outliers <- unique_dataset[!outliers, ]
boxplot(dataset_no_outliers$`Unit price`)

#Validating and Quality Assurance 

#1.Checking the new dataset is identical to original dataset
identical(Dataset, dataset_no_outliers)

#2.Visualize original and preprocessed data using histograms
hist(Dataset$`Unit price`, main = "Original Data")
hist(dataset_no_outliers$`Unit price`, main = "Preprocessed Data")

#3.Check for missing values and duplicates in preprocessed data 
anyNA(dataset_no_outliers)
anyDuplicated(dataset_no_outliers)
 
#4.Calculate summary statistics after preprocessing
summary(dataset_no_outliers)

#5.Data validation and overall dataset validation
install.packages("validate")
library(validate)
myrules <- validator(! is.na(dataset_no_outliers$`Invoice ID`)
                     , dataset_no_outliers$Quantity >= 0 & dataset_no_outliers$Quantity <= 10
                     , ! is.na(dataset_no_outliers$`Invoice ID`)
                     , dataset_no_outliers$`Customer type` %in% c ('Member','Normal')
                     , dataset_no_outliers$Gender %in% c ('Male','Female')
                     , dataset_no_outliers$Rating >= 0 & dataset_no_outliers$Rating <= 10 )
dataset_no_outliers <- as.data.frame(dataset_no_outliers)
output <- confront(dataset_no_outliers, myrules)
print(output)



