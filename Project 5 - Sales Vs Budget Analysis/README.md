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
