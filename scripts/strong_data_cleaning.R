# Prompt user for file name to load
cat("Enter name of csv file: ")
csv_file_name <- readline()
csv_file_name <- gsub("\\.csv", "", csv_file_name)

# Load data
setwd("C:/Users/james/OneDrive/PowerBI Practice/Fitness_Project")
csv_path <- paste0("data", "/", csv_file_name, ".csv")
strong_data <- readLines(csv_path)

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
cleaned_csv_name <- paste0("CLEANED_", csv_file_name, ".csv")
writeLines(cleaned_lines, con = paste0("data/", cleaned_csv_name))

# Prompt user to delete or keep original data
cat("Delete original (uncleaned) data: ", csv_file_name, ".csv", " (Y/N)?", sep = "")
delete_file_choice <- toupper(readline())

# Delete original data if user enters "Y" or "y"
if (delete_file_choice == "Y") {
  file.remove(csv_path)
  cat(csv_file_name, ".csv", " DELETED", sep = "")
}
