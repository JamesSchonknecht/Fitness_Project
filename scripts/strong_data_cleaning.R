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
cleaned_csv_name <- paste0("CLEANED_", "strong_data", ".csv")
writeLines(cleaned_lines, con = paste0("data/", cleaned_csv_name))

# Prompt user to delete or keep original data
cat("Delete original (uncleaned) data: ", csv_file_name, ".csv", " (Y/N)?", sep = "")
delete_file_choice <- toupper(readline())

# Delete original data if user enters "Y" or "y"
if (delete_file_choice == "Y") {
  file.remove(csv_path)
  cat(csv_file_name, ".csv", " DELETED", sep = "")
}


# MacroFactor data

# Create character vector of file names and find those matching the MacroFactor... pattern
macrofactor_filenames <- list.files("../data", full.names = TRUE)
macrofactor_filenames <- grep("MacroFactor-\\d+", macrofactor_filenames, value = TRUE)

# Macrofactor file information
macrofactor_file_info <- file.info(macrofactor_filenames)

# Finding most recently created macrofactor .xlsx file
most_recent_macrofactor <- rownames(macrofactor_file_info)[which.max(macrofactor_file_info$ctime)]

# Updating file name of most recent macrofactor .xlsx file
file.rename(from = most_recent_macrofactor, to = "../data/MacroFactor_data.xlsx")

# Prompt user to delete all old Macrofactor data files
cat("Delete all old Macrofactor .xlsx files? (Y/N)")
delete_macrofactor_files_choice <- toupper(readline())

# Delete all old Macrofactor .xlsx files if "y" or "Y" is entered
if (delete_macrofactor_files_choice == "Y") {
  file.remove(macrofactor_filenames)
}


