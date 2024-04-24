# Data Preprocessing and Quality Assurance in R

This R script performs data preprocessing and quality assurance tasks on a dataset using various techniques and libraries.

## Overview

The script performs the following tasks:

1. **Loading Data:** Reads a CSV file containing supermarket sales data into R.

2. **Duplicate Removal:** Identifies and removes duplicate rows from the dataset.

3. **Missing Value Handling:** Detects missing values and replaces them with the mean value of the respective column.

4. **Outlier Detection and Removal:** Detects outliers using the interquartile range (IQR) method and removes them from the dataset.

5. **Data Validation and Quality Assurance:**
   - Checks the new dataset for identity with the original dataset.
   - Visualizes the original and preprocessed data using histograms.
   - Checks for missing values and duplicates in the preprocessed data.
   - Calculates summary statistics after preprocessing.
   - Validates data using custom rules and confronts the dataset against these rules using the `validate` package.

## Libraries Used

The script utilizes the following R libraries:

- `readr`: For reading CSV files.
- `validate`: For data validation and quality assurance.

## Usage

To use the script:

1. Install the required packages by running the following commands in R:

