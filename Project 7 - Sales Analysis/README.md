## Project 7 - Sales Analysis (Power BI)

**View the Live Report:**
👉 [Click here to explore the interactive Power BI dashboard](https://app.powerbi.com/view?r=eyJrIjoiOTlmZTU3YTctMGY2Zi00MDMwLWE5YTQtZTEzMTY1MzllNjhkIiwidCI6IjFjYmJiNDZmLWFhNjItNDYzOC04OWI5LTNlMTg0MzU4YjI3MCJ9)

**Description:** This project delivers a **comprehensive Sales & Profitability analysis**. It involves consolidating multiple monthly sales records and a product catalog to monitor commercial health. The final solution features a highly interactive, dual-themed dashboard (Dark & Light modes) designed to identify top-performing categories and evaluate sales representative efficiency.

**Objectives:**
- Consolidate 11 separate monthly Excel sheets into a single, unified sales fact table.
- Calculate key financial metrics including **Revenue**, **Total Cost**, and **Gross Margin**.
- Compare performance across different product lines (**Alimentos vs. Bebidas**) and groups.
- Enable granular sales monitoring by linking **Supervisors** to their respective **Sales Representatives**.
- Provide a user-friendly interface with a dynamic **Dark/Light theme** toggle and monthly slicers.

**Data Modeling & Transformation:**
- **Power Query (ETL):** - Performed a stacking of monthly tables into a single `Vendas` table.
  - Merged separate Day, Month, and Year columns into a standardized **Date** format.
  - Automated data type detection and created a custom **Revenue** column.
- **Star Schema:** Established a `1:N` relationship between the `Produto` (Dimension) and `Vendas` (Fact) tables using the product code as the primary key.

**Key DAX Measures:**
- **`R$ Receita`**: Calculated as the sum of total sales revenue.
- **`R$ Custo`**: Developed using `SUMX` and `RELATED` to pull unit costs from the Product table based on quantities sold.
- **`R$ Margem`**: Measure-based calculation subtracting total costs from revenue to determine profit.

**Main Visuals:**
- **Dual-Themed UI:** Implementation of a "Theme Switcher" using buttons for **Dark** and **Light** modes.
- **Area Chart:** Visualizing the temporal evolution of revenue from January to November.
- **Matrix Hierarchy:** A drill-down table showing **Supervisor > Sales Rep** performance for Revenue and Cost.
- **Top 5 Analysis:** Bar charts identifying the most profitable **Product Groups** (e.g., Cachaça, Farinhas de Trigo).
- **Donut Chart:** Breakdown of margin contribution by **Product Line** (Alimentos vs. Bebidas).

**Files Included:**
- 💻 `P7 - Sales Report.pbix` → The final Power BI file containing both Dark and Light dashboard versions.
- 🧾 `BaseVendasCompleta.xlsx` → Source file containing the monthly sales data.
- 🧾 `CadastroProdutos.xlsx` → Dimension table with product details and unit costs.
