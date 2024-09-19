library(testthat)

# Load the gathered data
data <- read.csv("marriage_licenses_toronto.csv")

# Trim whitespace from column names (optional)
colnames(data) <- trimws(colnames(data))

# Test that the data has been loaded correctly
test_that("Data is loaded correctly", {
  expect_false(is.null(data))
  expect_true(nrow(data) > 0)  # Check that there are rows in the dataset
})

# Update required columns based on actual data
required_columns <- c("actual_column_name1", "actual_column_name2")  # Use actual column names here

test_that("Data contains required columns", {
  expect_true(all(required_columns %in% colnames(data)))
})

# Test that all values in 'licenses_issued' are non-negative
test_that("All licenses issued are non-negative", {
  expect_true(all(data$licenses_issued >= 0, na.rm = TRUE))
})

# Optionally, test that dates are in the correct format if you have a 'date' column
if ("date" %in% colnames(data)) {
  test_that("Dates are in the correct format", {
    expect_true(all(lubridate::ymd(data$date, quiet = TRUE) == data$date))
  })
}
