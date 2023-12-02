# Introduction to R

This introduktion will Wall you through The following content: 

- Basic R Operations
    1. Basic syntax, arithmetic operations.
    2. Data types and structures (vectors, matrices, data frames, lists).
    3. Reading and writing data (CSV, Excel).
    4. Basic data manipulation (subsetting, merging, sorting).
- Data Exploration
    1. Summary statistics (mean, median, standard deviation).
    2. Basic plotting (histograms, scatter plots, line graphs).
- Transition to data.table
    - Introduction to data.table
    - Why data.table? (Efficiency with large datasets).
    - Installing and loading the data.table package.
    - Converting data frames to data.table objects.
    - Basic data.table syntax (key setting, indexing, j, i, by).
- Data Manipulation with data.table
    - Advanced subsetting.
    - Fast aggregation and grouping.
    - Joining tables.
- Simulated Economic Panel Data
    - Creating Simulated Data
    - Generating a data frame with firm revenue, number of employees, location (city/non-city).
    - Inserting random missing values.
- Data Cleaning Techniques
    - Handling missing data (imputation, removal).
    - Conditional operations (e.g., different operations for city and non-city firms).
- Data Analysis with data.table
    - Calculating summary statistics by group (e.g., average revenue by city/non-city).
    - Time-based operations (if time-series data is involved).


## Data cleaning

# Handling missing values
firm_data[is.na(revenue), revenue := mean(revenue, na.rm = TRUE)] # impute missing revenue with mean




# 'data.table' Tasks 

Run the following code in an R script of your own.

# Example: Creating and Cleaning Simulated Data

Here is an example of how to start with a simple data simulation and cleaning in R using data.table:

'''{R}
# Install and load data.table
install.packages("data.table")
library(data.table)
'''

'''{}
# Simulate some data
set.seed(123) # for reproducibility
n <- 100 # number of firms
firm_data <- data.table(
  firm_id = 1:n,
  revenue = rnorm(n, mean=100000, sd=20000), # random revenue
  employees = sample(20:200, n, replace = TRUE), # random number of employees
  is_city = sample(c(TRUE, FALSE), n, replace = TRUE) # city or non-city
)

# Introduce missing values
firm_data[sample(n, 10), revenue := NA] # randomly assign NAs to revenue
'''

## Data cleaning

Objective: Impute missing values with mean

'''{r}
firm_data[is.na(revenue), revenue := mean(revenue, na.rm = TRUE)] # impute missing revenue with mean
'''


## Task 1: Data Cleaning and Preparation

Objective: Handle missing values and filter firms based on certain criteria.

'''{R}
# Handling missing values in 'revenue'
firm_data[is.na(revenue), revenue := mean(revenue, na.rm = TRUE)]

# Filtering firms with more than 50 employees
large_firms <- firm_data[employees > 50]

# Removing firms with anomalously high revenue (potential outliers)
firm_data <- firm_data[revenue < 200000]
'''


## Task 2: Aggregation and Grouped Operations

Objective: Calculate summary statistics for different groups.

'''{R}
# Average revenue for firms in the city vs. outside the city
avg_revenue_by_location <- firm_data[, .(average_revenue = mean(revenue)), by = .(is_city)]

# Counting the number of firms in each category
firm_count_by_location <- firm_data[, .N, by = .(is_city)]
'''

## Task 3: Joining Data

Objective: Merge the firm data with another dataset, such as industry classification.

'''{R}
# Simulating an industry classification dataset
industry_data <- data.table(firm_id = 1:n, industry = sample(c("Tech", "Retail", "Manufacturing"), n, replace = TRUE))

# left join industry data onto firm_data, keeping all rows in firm_data
firm_data_left <- merge(firm_data, industry_data, on = "firm_id", all.x = T)
firm_data_left

# inner join industry data onto firm_data, keeping all shared rows
firm_data_inner <- merge(firm_data, industry_data, on = "firm_id")
firm_data_inner

# right join firm_data onto industry data, keeping all rows in firm_data
firm_data_right <- merge(firm_data, industry_data, on = "firm_id", all.y = T)
firm_data_right
'''


## Task 4: Time-Based Operations

Objective: If the dataset includes time-series data, perform time-based aggregation.

'''{R}
# Assuming 'year' column exists in firm_data
# Calculating average number of employees per year
avg_employees_by_year <- firm_data[, .(average_employees = mean(employees)), by = .(year)]
'''

## Task 5: Advanced Filtering

Objective: Use complex conditions to filter data.

'''{R}
# Firms with revenue greater than the median and located in a city
high_revenue_city_firms <- firm_data[revenue > median(revenue) & is_city]
'''

## Task 6: Data Export

Objective: Export the cleaned and manipulated data to a CSV and a parquet file.

'''{R}
# Writing the final data to a CSV and parquet file
library(rio) # package to import() and export() almost any filetype
export(firm_data, file = "cleaned_firm_data.csv"). 
export(firm_data, file = "cleaned_firm_data.parquet"). 
'''

