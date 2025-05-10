# Power BI Fitness and Nutrition Project
## 🗂️ Project Overview
This project analyses my personal workout and nutrition data to uncover trends over time. The goal is to demonstrate skills in data cleaning, visualization, and deriving actionable insights from health-related data.

## 📁 Project Contents
- Data Files:
  - data/MacroFactor_data.xlsx - Nutrition and body weight data imported from the 'Macrofactor' application as an Excel workbook. Contains data such as daily number of calories and grams of macronutrients (i.e. protein, fat, carbohydrates) consumed and body weight measurements
  - data/strong_data.csv - Workout data imported from the 'Strong' application as a csv file. Contains data such as exercise names, weight lifted, number of repetitions, and workout duration
- Documentation:
  - docs/data_model.drawio - draw.io file showing illustration of the data model created in Power BI
  - docs/data_model.drawio.png - png image showing illustration of the data model created in Power BI
- Scripts:
  - strong_macrofactor_data_cleaning.R - R script that performs initial cleaning of the raw data from 'Strong' and 'Macrofactor' apps prior to importing the data into Power BI
- Power BI Report:
  - Fitness and Nutrition Report.pbix - The final Power BI report file containing the final data model with cleaned data and visualisations
 
## 📋 Project Steps Taken:
1. Exported data from 'Strong' (as a csv file) and 'Macrofactor' (as an Excel workbook) apps from my Android phone and transferred to my PC.
2. Imported data from these two sources into Power BI and assessed data quality using Power Query. Data inconsistencies were identified with the 'Strong' workout data which could not be cleaned using Power Query.
3. An interactive R script (strong_macrofactor_data_cleaning.R) was created that fixed the identified data inconsistencies. The script also finds the most recent data files from both sources, renames the files, and prompts the user to delete or keep any older data files.
