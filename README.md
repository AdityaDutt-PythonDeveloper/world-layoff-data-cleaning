# World Layoffs Data Cleaning Project

This project demonstrates a complete **SQL data cleaning** workflow on the World Layoffs dataset.

## Dataset
- **Source**: World Layoffs dataset
- **File**: `layoffs.csv`
- **Columns**: company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions

## Project Goal
Clean the raw data so it is ready for Exploratory Data Analysis (EDA).

## Data Cleaning Steps

| Step | Description | Script |
|------|-------------|--------|
| 1 | Create staging table (preserve original data) | `01_Intro_to_data_cleaning.sql` |
| 2 | Remove duplicate rows | `02_Removing_duplicates.sql` |
| 3 | Standardize data (trim, fix industry names, convert date) | `03_Standardizing_data.sql` |
| 4 | Handle null / blank values | `04_Handling_null_values.sql` |
| 5 | Remove unnecessary columns | `05_Removing_columns.sql` |

## How to Run

1. Create a MySQL database and import the CSV:
   ```sql
   CREATE DATABASE world_layoffs;
   USE world_layoffs;
   -- Then import layoffs.csv into a table named `layoffs`

Run the SQL scripts in order (01 → 05).
After running all scripts, the clean table will be:SQLSELECT * FROM layoffs_staging2;

Tools Used

MySQL
MySQL Workbench (or any SQL client)

Key Techniques Used

Staging tables
Window functions (ROW_NUMBER())
Common Table Expressions (CTE)
Self-join to fill missing industry values
STR_TO_DATE() + MODIFY COLUMN for date conversion
TRIM() and pattern matching for standardization

Next Steps
Perform Exploratory Data Analysis (EDA) on the cleaned layoffs_staging2 table.
