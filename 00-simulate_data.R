# Set seed for reproducibility
set.seed(123)

# Generate a sequence of dates for the year 2023
dates <- seq(as.Date("2023-01-01"), as.Date("2023-12-31"), by = "month")

# Simulate the number of licenses issued using Poisson distribution
licenses_issued <- rpois(length(dates), lambda = 10)

# Create a data frame with the simulated data
simulated_data <- data.frame(date = dates, licenses_issued = licenses_issued)

# Write the simulated data to a CSV file
write.csv(simulated_data, "simulated_data.csv", row.names = FALSE)

# Print a message to confirm completion
print("Simulation completed and data saved to simulated_data.csv.")







