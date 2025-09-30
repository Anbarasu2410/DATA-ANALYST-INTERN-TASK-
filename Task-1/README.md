# Marketing Campaign Data Cleaning & Analysis

This repository contains the **data cleaning and preprocessing workflow** for the Marketing Campaign Dataset. The goal is to prepare raw customer and campaign data for **exploratory data analysis (EDA)**, reporting, and predictive modeling.

---

## Project Overview

**Objective:**  
Clean and structure customer and campaign data to ensure consistency, handle missing values, remove duplicates, and create derived features for further analysis.

**Dataset Description:**  
- Contains 2,240 customer records and 29 attributes, including:
  - Demographics: `year_birth`, `education`, `marital_status`, `income`
  - Family: `kidhome`, `teenhome`
  - Customer activity: `recency`, `numdealspurchases`, `numwebpurchases`, `mntwines`, etc.
  - Campaign responses: `acceptedcmp1` to `acceptedcmp5`, `response`
  - Miscellaneous: `dt_customer`, `z_costcontact`, `z_revenue`

**Tools & Libraries:**  
- Python 3.x  
- Pandas, NumPy  
- Google Colab / Jupyter Notebook  

---

## Data Cleaning & Preprocessing Steps

1. **Import Data**
   - Load the raw CSV file (`marketing_campaign.csv`) using Pandas with appropriate separators.
   - Inspect dataset dimensions, column types, and sample rows.

2. **Column Name Standardization**
   - Strip whitespace, convert to lowercase, and replace spaces with underscores for uniformity.

3. **Handle Missing Values**
   - Example fixes:
     - `income`: Fill missing values with median income.
     - `marital_status`: Fill missing values with `"unknown"`.
   - Ensures all columns are usable for analysis.

4. **Remove Duplicates**
   - Drop duplicate rows to maintain data integrity.

5. **Data Type Conversion**
   - Convert `dt_customer` to datetime format.
   - Ensure numeric columns (e.g., `income`) are correctly typed.

6. **Feature Engineering**
   - `age` → Calculated as `current_year - year_birth`.
   - `total_kids` → Sum of `kidhome` and `teenhome`.
   - Additional features can be derived for segmentation or modeling.

7. **Save Cleaned Dataset**
   - Save the cleaned and processed dataset as `cleaned_marketing_campaign.csv` for downstream analysis.

---

## Example Code Snippets

```python
# Load data
import pandas as pd
df = pd.read_csv("marketing_campaign.csv", sep="\t")

# Handle missing income
df['income'] = df['income'].fillna(df['income'].median())

# Convert date column
df['dt_customer'] = pd.to_datetime(df['dt_customer'], format="%d-%m-%Y")

# Feature engineering
from datetime import datetime
df['age'] = datetime.now().year - df['year_birth']
df['total_kids'] = df['kidhome'] + df['teenhome']

# Remove duplicates and save
df = df.drop_duplicates()
df.to_csv("cleaned_marketing_campaign.csv", index=False)
