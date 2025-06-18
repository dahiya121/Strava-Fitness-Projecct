# Strava-Fitness-Projecct

---

## 📚 Datasets Overview

The datasets include daily, hourly, and minute-level metrics collected from over 30 Fitbit users.

### Main Datasets:

- **dailyActivity_merged.csv** – Steps, distance, calories, activity levels
- **sleepDay_merged.csv** – Total sleep time, time in bed
- **weightLogInfo_merged.csv** – Weight (kg), BMI, manual log flag
- **minuteCaloriesNarrow.csv**, **minuteIntensitiesNarrow.csv** – Detailed minute-wise activity

---

## 🔍 Exploratory Data Analysis (EDA)

Python was used to explore the following:

- Steps vs. Calories burned correlation
- Average Calories burned per weekday
- Sleep Time vs. Time in Bed visualization
- Weight vs. BMI trend
- Activity Intensity patterns

### Sample Visuals:
- 📈 Line charts for sleep patterns
- 📊 Bar plots of calories burned by day
- 📉 Scatter plots between active minutes and calories
- 🌡 Heatmaps for correlation analysis

---

## 📊 Power BI Dashboard

An interactive dashboard was created using Power BI to help users explore:

- Daily steps and calories
- Sleep trends over time
- Weight and BMI progress
- User-level filters and slicers

---

## 💡 Key Insights

- **Active users tend to burn more calories even with fewer steps** due to intensity.
- **Weekends show higher average calorie burn**.
- **Many users are getting less sleep than time spent in bed**, indicating possible sleep issues.
- **Some users show strong correlation between BMI and sedentary lifestyle**.

---

## 🚀 How to Use This Project

1. Clone this repository or download the ZIP.
2. Run the SQL scripts in any SQL IDE (like MySQL Workbench).
3. Open `analysis_notebook.ipynb` in Jupyter or Google Colab to explore Python EDA.
4. Open the Power BI file `FitbitDashboard.pbix` for a dynamic visual dashboard.

---

## 📦 Future Improvements

- Add heart rate analysis from minute-level heart rate data
- Build a machine learning model to predict calorie burn
- Integrate real-time data with Fitbit API
- Add user segmentation and clustering

---

## 📜 License

This project is for educational and portfolio use. Data is synthetic and anonymized for privacy.

---

## 🤝 Contact

If you'd like to collaborate or have questions, feel free to reach out:

**Author:** Praveen Dahiya 
**Email:** dhaiyapraveen4@gmail.com
**LinkedIn:** (https://linkedin.com/in/dahiya121)
"""
