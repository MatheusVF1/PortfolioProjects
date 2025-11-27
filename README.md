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

**View the Live Report:**  
👉 [Click here to explore the interactive Power BI dashboard](https://app.powerbi.com/view?r=eyJrIjoiNzVmMzkwMTctNTNiNC00ODY4LThjOWUtMGNjYjMzNzI4ZDJkIiwidCI6IjFjYmJiNDZmLWFhNjItNDYzOC04OWI5LTNlMTg0MzU4YjI3MCJ9)  

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

---

## Project 3 - Nashville Housing Data Cleaning (SQL)

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

## Project 4 - EDA Budget and Gross Correlation (Python/Pandas)

**Description:**
This project focuses on a **Exploratory Data Analysis (EDA)** of the movie industry dataset (`movies.csv`) to identify the key financial and audience factors that drive a film's success. The entire cleaning, imputation, and analysis process was executed in **Python** using **Pandas and Seaborn**.

**Objectives:**
- Clean and impute missing data using **statistical justification** (Median, Mode, Conditional Imputation).
- Analyze the correlation between financial metrics (`budget`, `gross_income`) and audience engagement (`votes`, `imdb_score`).
- Visualize the **distribution of key metrics** (e.g., IMDb Score) and compare performance across categorical features (`genre`, `rating`, `country`).
- Identify optimal investment strategies based on genre and rating performance.

**Main Skills Used:**
- Python (Pandas, NumPy, Matplotlib, Seaborn)
- Advanced Data Imputation (Median by Group, Conditional Mode)
- Correlation Analysis (Pearson, Spearman)
- Data Visualization (Box Plots, Scatter Plots, Histograms, Logarithmic Scales)
- Feature Engineering (Numerical Encoding of categorical variables)

**Files Included:**
- 📓 `Movie_Data_EDA_Correlation_Analysis.ipynb` → Full Python notebook with all cleaning, analysis, and visualization steps.
- 🎬 `movies.csv` → The original dataset used for the project.

**Key Insights:**
- **Financial Drivers:** Correlation analysis confirmed that **Budget** (linear) and **Votes** (rank-based popularity) are the strongest predictors of **Gross Income**.
- **Critical Threshold:** Identification of a **10,000-vote threshold** as the critical point for movies transitioning into higher revenue tiers.
- **Budget Allocation:** Confirmed that **Animation** and **Action** are the highest-budget genres, while **Horror** remains a low-budget niche.
- **Market Viability:** **PG-13** was identified as the most commercially viable rating, consistently showing a high median income and strong potential for blockbusters.

---

## Project 5 - Sales Vs Budget Analysis (SQL & Power BI)

**View the Live Report:**
👉 [Click here to explore the interactive Power BI dashboard](https://app.powerbi.com/view?r=eyJrIjoiNmE5OGRjY2UtNThlZi00ZTBiLWJlYTQtYTliZWFjMTgwNGEwIiwidCI6IjFjYmJiNDZmLWFhNjItNDYzOC04OWI5LTNlMTg0MzU4YjI3MCJ9)

**Description:**
This end-to-end project focuses on creating a **Sales Performance Dashboard** in **Power BI** for the Sales Manager, Steven, based on the **AdventureWorksDW2019** Data Warehouse. The project covered the full lifecycle: from data preparation in **SQL** (ETL) to advanced visualization and KPI tracking.

The main objective was to transform static sales data into an **interactive BI solution** that tracks actual **Sales against Budget**.

**Objectives:**
- Cleanse and transform data from the `AdventureWorksDW2019` database using **T-SQL** to create analysis-ready tables.
- Update historical dates to recent years (2020-2021) for timely reporting.
- Implement a **Star Schema** data model in Power BI, integrating external **Budget** data (`SalesBudget.xlsx`) with core sales data (`FactInternetSales`).
- Create a dynamic dashboard with three pages (**Overview, Customer Details, Product Details**) to meet specific **User Stories** from the Sales Team.
- Track performance against budget using key financial metrics.

**Data Preparation & Modeling:**
- **SQL (T-SQL) Scripts:** Used to cleanse dimensions (`DimDate`, `DimCustomer`, `DimProduct`) and the fact table (`FactInternetSales`), ensuring data quality and relevance.
- **Data Model:** Created a Star Schema linking two fact tables (`FACT_InternetSales` and `FACT_Budget`) through shared dimensions (`DIM_Calendar`, `DIM_Customers`, `DIM_Products`).
- **Data Sources:** Combined the large-scale DW data with smaller, manually created budget data.

**Key DAX Measures & KPIs:**
- **`Sales`** (Total Revenue from Internet Sales)
- **`Budget_Amount`** (Total Allocated Budget)
- **`Sales - Budget`** (Performance Variance against Budget)
- **`Sales / Budget_Amount`** (Percentage of Budget Achieved)

**Main Visuals & Insights:**
- **Sales Overview:** High-level performance tracking using a **Dynamic KPI Card** and a **Line Chart** showing Sales vs. Budget trend.
- **Customer Details:** Tactical analysis using a **Matrix** to display monthly sales history for the **Top 10 Customers**.
- **Product Details:** Tactical analysis using a **Matrix** with hierarchy (**Category > Product**) to show monthly sales performance, enabling focus on high-performing products.
- **Slicers:** Implemented comprehensive filters (Year, Month, City, Product Hierarchy) to support user-driven data exploration and filtering capabilities for Sales Representatives.

**Files Included:**
- 📄 `Business Demand Overview & User Stories (Filled Out).docx` → Documentation of business requirements and scope.
- 💻 `P5 - Sales Report.pbix` → The final Power BI interactive report.
- 💾 `DIM_Calendar.csv`, `DIM_Customers.csv`, `DIM_Products.csv`, `FACT_InternetSales.csv` → Cleansed CSV exports.
- 🧾 `SalesBudget.xlsx` → External budget data source.
- 📜 `Script - DIM_Calendar.sql`, `Script - DIM_Customers.sql`, `Script - DIM_Products.sql`, `Script - FACT_InternetSales.sql` → SQL scripts used for data cleansing.

---

📘 **More projects coming soon!**  
Each new project will be added in its own folder inside this repository with detailed documentation and analysis steps.
