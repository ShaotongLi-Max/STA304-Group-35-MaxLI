library(testthat)
library(lubridate)

# Load the gathered data
data <- read.csv("marriage_licenses_toronto.csv")

# Trim whitespace from column names (optional)
colnames(data) <- trimws(colnames(data))

# Test that the data has been loaded correctly
test_that("Data is loaded correctly", {
  expect_false(is.null(data))
  expect_true(nrow(data) > 0)  # Check that there are rows in the dataset
})

# Test that required columns are present
test_that("Data contains required columns", {
  required_columns <- c("X_id", "CIVIC_CENTRE", "MARRIAGE_LICENSES", "TIME_PERIOD")
  expect_true(all(required_columns %in% colnames(data)))
})

# Test that all values in 'MARRIAGE_LICENSES' are non-negative
test_that("All marriage license numbers are non-negative", {
  expect_true(all(data$MARRIAGE_LICENSES >= 0, na.rm = TRUE))
})

# Test that 'X_id' column has unique values
test_that("IDs are unique", {
  expect_true(length(unique(data$X_id)) == nrow(data))
})

# Test that 'TIME_PERIOD' is formatted correctly
test_that("Time period is in 'YYYY-MM' format", {
  parsed_dates <- lubridate::ym(data$TIME_PERIOD, quiet = TRUE)
  # Check if all dates are successfully parsed (no NAs)
  expect_true(all(!is.na(parsed_dates)))
  
  # Optionally, assign the parsed dates back to the dataframe if needed
  data$parsed_dates <- parsed_dates
})

# Print out the first few rows of the data for debugging purposes
print(head(data))
