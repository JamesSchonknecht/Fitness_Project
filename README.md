# Power BI Fitness and Nutrition Project
## 🔎 Project Overview
This project analyses my personal workout and nutrition data to uncover trends and insights over time. The goal is to demonstrate skills in data cleaning, visualization, and deriving actionable insights from health-related data.

---

## 📁 Project Contents
- Data Files:
  - `data/MacroFactor_data.xlsx` - Nutrition and body weight data imported from the 'Macrofactor' application as an Excel workbook. Contains data such as daily number of calories and grams of macronutrients (i.e. protein, fat, carbohydrates) consumed and body weight measurements
  - `data/strong_data.csv` - Workout data imported from the 'Strong' application as a csv file. Contains data such as exercise names, weight lifted, number of repetitions, and workout duration
- Documentation:
  - `docs/data_model.drawio` - draw.io file showing illustration of the data model created in Power BI
  - `docs/data_model.drawio.png` - png image showing illustration of the data model created in Power BI
- Scripts:
  - `strong_macrofactor_data_cleaning.R` - R script that performs initial cleaning of the raw data from 'Strong' and 'Macrofactor' apps prior to importing the data into Power BI
- Power BI Report:
  - `Fitness and Nutrition Report.pbix` - The final Power BI report file containing the final data model with cleaned data and visualisations

---

## 🛠️ Tools & Technologies
- Power BI (Power Query, M Language, DAX, Data Modeling)
- R (Data Cleaning Automation)
- Microsoft Excel
- CSV / XLSX data handling

---
 
## 📋 Project Steps:
1. Exported data from *Strong* (CSV) and *Macrofactor* (Excel) apps from Android and transferred to PC.
2. Assessed and imported both datasets into Power BI using Power Query. Found inconsistencies in *Strong* data that required external handling.
3. Developed an R script to:
   - Fix inconsistencies in the raw data.
   - Automatically find and rename the latest data files.
   - Prompt user to manage (delete or retain) outdated files.
4. Performed Power Query transformations:
     - Removed unnecessary columns.
     - Converted column data types.
     - Reformatted workout duration (e.g., `2h 30m` → `2.5` hours).
     - Detected and handled outliers in reps, weights, and duration.
     - Calculated volume in distinct ways for different exercises as appropriate:
       - Exercises with a weight and number of reps: `volume = weight x reps`
       - Exercises with no weight and number of reps (body weight only exercises): `volume = reps`
       - Exercises with assistive weight (e.g. Assisted Chin-Ups): `volume = (body weight - assistive weight) * reps`
     - Created surrogate keys to link dimension and fact tables.
5. Built a data model using fact and dimension tables as shown below:
![data_model drawio](https://github.com/user-attachments/assets/c8e56687-137f-4275-a4f6-effddd82ad10)
6. Used custom DAX measures to identify anomalies by calculating dynamic upper/lower thresholds based on standard deviation from average volume (weight × repetitions).
7. Created dynamic visualisations in Power BI, alongside creation of measures and calculated columns using DAX, including:
    - Moving average body weight over time and rate of change over different windows of time.
    - Daily macronutrient and calorie consumption in comparison to targets.
    - Number of workouts, total and average duration of workouts over time.
    - Most frequently performed exercises.
    - Maximum daily volume and weight lifted over time for every exercise.

---


