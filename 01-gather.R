# Load necessary libraries
library(opendatatoronto)
library(dplyr)

# Search for marriage licence statistics packages
marriage_licence_packages <- search_packages("Marriage Licence Statistics")

# List the resources available in the found packages
marriage_licence_resources <- marriage_licence_packages %>%
  list_package_resources()

# Check the resources (you can view this in the console)
print(marriage_licence_resources)

# Assuming you want to use the first resource
resource_id <- marriage_licence_resources$id[1]

# Fetch the dataset using the resource ID
marriage_data <- get_resource(resource_id)

# Check if the data is not empty
if (nrow(marriage_data) == 0) {
  stop("The fetched data is empty.")
}

# Save the data to a CSV file
write.csv(marriage_data, "marriage_licenses_toronto.csv", row.names = FALSE)

print("Data fetched and saved to marriage_licenses_toronto.csv.")
