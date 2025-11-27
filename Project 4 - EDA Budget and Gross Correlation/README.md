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
