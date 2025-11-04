# 💼 Portfolio Projects

Welcome to my **Portfolio Projects** repository!  
Here I store all my data analysis projects — each one contained in its own folder, with all datasets, SQL queries, notebooks, and other resources used during development.

This repository is a collection of studies and end-to-end projects created to explore **real-world data**, improve my **data analysis, SQL, and visualization** skills, and demonstrate my **problem-solving approach** using data.

---

## Project 1 - COVID Data Analysis (SQL)

**Description:**  
This project explores the impact of COVID-19 worldwide using real data from **Our World in Data**.  
The analysis was performed in **SQL Server**, combining two datasets:
- `CovidDeaths.xlsx`
- `CovidVaccinations.xlsx`

**Objectives:**
- Understand infection and death trends across countries and continents  
- Analyze the relationship between population, total cases, and total deaths  
- Evaluate global vaccination progress over time  
- Generate insights through queries using aggregate functions, CTEs, temporary tables, and window functions

**Main Skills Used:**
- SQL (CTEs, Joins, Aggregations, Views, Temp Tables, Window Functions)  
- Data cleaning and exploration  
- Analytical thinking and data storytelling  

**Files Included:**
- `COVID - Data Exploration.sql` → Main SQL script with all analyses  
- `CovidDeaths.xlsx` → Dataset containing daily COVID death and case records  
- `CovidVaccinations.xlsx` → Dataset containing global vaccination data  

**Key Insights:**
- Identification of countries with the highest infection and death rates  
- Comparison of vaccination progress by country and continent  
- Global trends showing correlations between cases, deaths, and vaccination rates  
- Temporal evolution of COVID-19 metrics over time  

---

## Project 2 - Sales Performance Dashboard (Power BI)

**Description:**  
This project focuses on building a **fully dynamic and interactive Power BI dashboard** to analyze global sales performance using the dataset **Plant_DTS.xls**.  
It showcases DAX calculations, dynamic visuals, and conditional formatting for a clean and professional business insight report.

**Objectives:**
- Analyze key metrics such as **Sales**, **Gross Profit**, and **Quantity** over time  
- Compare **YTD (Year-to-Date)** vs **PYTD (Previous Year-to-Date)** results  
- Identify bottom-performing countries and visualize account profitability  
- Create dynamic visuals and titles based on slicer selections and filters  

**Data Modeling:**
- Renamed and structured tables into a star schema:  
  - `Fact_Sales` (formerly Plant_FACT)  
  - `Dim_Product` (formerly Plant_Hierarchy)  
  - `Dim_Account` (formerly Accounts)  
  - `Dim_Date` (created via DAX using CALENDAR function)  
- Added a helper table `Slc_Values` for dynamic slicer selection  
- Ensured data consistency through column renaming, deduplication, and data type adjustments  

**Key DAX Measures:**
- Core KPIs:  
  - `Sales`, `Quantity`, `Gross Profit`  
- Time Intelligence:  
  - `YTD_Sales`, `PYTD_Sales`, `YTD_Quantity`, `PYTD_Quantity`, etc.  
- Dynamic Measures for slicers:  
  - `S_YTD`, `S_PYTD`, and `YTD vs PYTD`  
- Dynamic titles for all visuals (Report, Column Chart, Waterfall, Scatter)  

**Main Visuals:**
- **Waterfall Chart:** Year-over-year performance by month and product  
- **Combo Chart:** YTD vs PYTD trend analysis  
- **Treemap:** Bottom 10 countries by performance  
- **Scatter Plot:** Profitability segmentation by account  
- **Dynamic Titles:** Automatically update based on selected metric and year  

**View the Live Report:**  
👉 [Click here to explore the interactive Power BI dashboard](https://app.powerbi.com/view?r=eyJrIjoiNzVmMzkwMTctNTNiNC00ODY4LThjOWUtMGNjYjMzNzI4ZDJkIiwidCI6IjFjYmJiNDZmLWFhNjItNDYzOC04OWI5LTNlMTg0MzU4YjI3MCJ9)  

---

### Project 3 - Nashville Housing Data Cleaning (SQL)

**Description:**  
This project focuses on **data cleaning and preprocessing using SQL Server**, based on the Nashville Housing dataset.  
The goal was to transform a raw and inconsistent dataset into a well-structured and analysis-ready table through a series of **SQL transformations and best practices**.

**Objectives:**
- Standardize date formats  
- Populate missing address values using joins  
- Split complex address fields into individual columns (Address, City, State)  
- Normalize categorical values (e.g., converting "Y"/"N" to "Yes"/"No")  
- Identify and remove duplicate records  
- Drop unused columns safely using a temporary table  

**Files Included:**
- 📄 `Nashville Housing Data Cleaning Queries.sql` → Full SQL script with all cleaning steps  
- 🧾 `Nashville Housing Data.xlsx` → Original dataset used in this project  

---

📘 **More projects coming soon!**  
Each new project will be added in its own folder inside this repository with detailed documentation and analysis steps.
