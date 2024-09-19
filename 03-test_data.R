library(testthat)

# Load the simulated data
data <- read.csv("simulated_data.csv")

test_that("Data has the correct number of rows", {
  expect_equal(nrow(data), length(data$licenses_issued))  # Check the number of rows matches licenses issued
})

test_that("All licenses issued are non-negative", {
  expect_true(all(data$licenses_issued >= 0))
})
