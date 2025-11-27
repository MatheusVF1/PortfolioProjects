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
