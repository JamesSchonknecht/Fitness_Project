# Loading libraries
library(readxl)

########## Strong data ########## 
setwd("C:/Users/james/OneDrive/PowerBI Practice/Fitness_Project/scripts")

# Create character vector of file names and find those containg the "strong..." pattern
strong_filenames <- list.files("../data", full.names = TRUE)
strong_filenames <- grep(".*strong(?!_data)", strong_filenames, value = TRUE, perl = TRUE)

# Get strong file information
strong_file_info <- file.info(strong_filenames)

# Finding most recently created strong .csv file
most_recent_strong <- rownames(strong_file_info)[which.max(strong_file_info$ctime)]

# Renaming most recently created strong .csv file
if (length(most_recent_strong) != 0) {
  file.rename(from = most_recent_strong, to = "../data/strong_data.csv")
}

# Load data
csv_path <- "../data/strong_data.csv"
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

# Remove all instances of "Omni-Grip Lat " - the app has incorrectly appended this to "1-Arm Half Kneeling Lat Pulldown"
cleaned_lines <- gsub("1-Arm Half Kneeling Lat PulldownOmni-Grip Lat ", "1-Arm Half Kneeling Lat Pulldown", cleaned_lines)

# Update strong_data.csv to contain cleaned data
writeLines(cleaned_lines, con = "../data/strong_data.csv")

# Prompt user to delete old strong .csv files
cat("Delete all old strong .csv files? (Y/N)?")
delete_strong_files_choice <- toupper(readline())

# Delete all old strong .csv files if "y" or "Y" is entered
if (delete_strong_files_choice == "Y") {
  file.remove(strong_filenames)
}


########## MacroFactor data ##########

# Get file names matching the pattern of 'MacroFactor-...'
macrofactor_filenames <- list.files("../data", full.names = TRUE)
macrofactor_filenames <- grep("MacroFactor.+", macrofactor_filenames, value = TRUE)

# Initialise empty lists to store names of quick export and main data excel files
quick_export_file_names <- list()
main_data_file_names <- list()

# Get names of quick export and main data MacroFactor workbooks
for (file in macrofactor_filenames) {
  print(file)
  if (excel_sheets(file)[1] == 'Quick Export') {
    print('Quick Export')
    quick_export_file_names <- append(quick_export_file_names, file)
  } else {
    print('Main Data')
    main_data_file_names <- append(main_data_file_names, file)
  }
  cat('\n')
}

# Get most recent quick export file
quick_export_file_info <- file.info(unlist(quick_export_file_names))
most_recent_quick_export <- rownames(quick_export_file_info)[which.max(macrofactor_file_info$ctime)]

# Get most recent main data file
main_data_file_info <- file.info(unlist(main_data_file_names))
most_recent_main_data <- rownames(main_data_file_info)[which.max(macrofactor_file_info$ctime)]

# Rename most recent quick export file
file.rename(from=most_recent_quick_export, to='../data/MacroFactor_quick_export.xlsx')

# Rename most recent main data file
file.rename(from=most_recent_main_data, to='../data/MacroFactor_main_data.xlsx')

# Prompt user to delete all old Macrofactor data files
cat("Delete all old Macrofactor .xlsx files? (Y/N)")
delete_macrofactor_files_choice <- toupper(readline())

# Get names of old macrofactor files
old_macrofactor_filenames <- grep("MacroFactor-\\d+", macrofactor_filenames, value = TRUE)

# Delete all old Macrofactor .xlsx files if "y" or "Y" is entered
if (delete_macrofactor_files_choice == "Y") {
  file.remove(old_macrofactor_filenames)
}

cat("Script run successfully")
