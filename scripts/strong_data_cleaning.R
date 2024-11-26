# Load data
setwd("C:/Users/james/OneDrive/PowerBI Practice")
file_path <- "C:/Users/james/OneDrive/PowerBI Practice/strong965753607026263731.csv"
strong_data <- readLines(file_path)

# Initialise vector with header row to store lines
cleaned_lines <- c(strong_data[1])

# Iterate through each line
for (line in strong_data[2:length(strong_data)]) {
  # If current line starts with date, then add it to cleaned lines vector
  if (grepl("^\\d{4}-\\d{2}-\\d{2}", line)) {
    cleaned_lines <- c(cleaned_lines, line)
  # If current line does not start with date (incorrect format), replace previous line with current line appended to it
  } else {
      line <- paste0(cleaned_lines[length(cleaned_lines)], line)
      cleaned_lines[length(cleaned_lines)] <- line
  }
}

# Create a csv file with cleaned data
writeLines(cleaned_lines, con = "cleaned_strong965753607026263731.csv")

