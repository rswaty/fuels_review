


# Set the directory containing the CSV files
data_directory <- "data"

# Initialize an empty list to store column headers
all_column_headers <- c()

# Iterate over each file in the data directory
for (filename in list.files(data_directory, pattern = "\\.csv$", full.names = TRUE)) {
  df <- read.csv(filename)
  all_column_headers <- c(all_column_headers, colnames(df))
}

# Create a data frame with unique column headers
unique_column_headers <- data.frame("Column Headers" = unique(all_column_headers))

# Print the unique column headers
print(unique_column_headers)

