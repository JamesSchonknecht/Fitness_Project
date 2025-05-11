# Power BI Fitness and Nutrition Project
## 🔎 Project Overview
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
4. The data from both data sources was imported into Power BI and further cleaned and reformatted using Power Query. Some of the transformations included:
    - Removal of unneccessary columns.
    - Changing column data types.
    - Reformatting of workout duration from text format (e.g. 2h 30m) to numeric value in hours (e.g. 2.50).
    - Detection of anomalous values (very high number of reps, very high weights, very long workout durations). Rows with abnormally high number of reps or weight were removed. Abnormally long workout durations were replaced with the median workout duration.
    - Creating a surrogate key column to uniquely identify each exercise in the exercise dimension table, and to create a relationship between this dimension table and the workout fact table.
6. The data model was built with fact and dimension tables, with relationships between these tables as shown below:
![data_model drawio](https://github.com/user-attachments/assets/c8e56687-137f-4275-a4f6-effddd82ad10)
8. Further checks for anomalous weight and repetition measurements were performed using custom DAX measures which calculated upper and lower thresholds using average daily maximum volume (weight * repetitions) and standard deviation of volume. Anomalous measurements could then be filtered from visualisations.
9. Visualisations were created within Power BI, utilising a large number of custom DAX measures and calculated columns. For example, one measure calculates the moving average body weight using multiple scale weight measurements. The number of days included in this calculation can be dynamically changed using a slider.



