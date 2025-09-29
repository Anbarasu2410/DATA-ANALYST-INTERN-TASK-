# Titanic EDA Report

## Overview
This project performs a complete **Exploratory Data Analysis (EDA)** on the Titanic dataset (`train.csv`) using Python, Pandas, Matplotlib, and Seaborn. It also generates a **PDF report** containing all visuals and observations.

## Features

### 1. Data Loading and Overview
* Uploaded dataset in Google Colab.
* Displayed `head()`, `info()`, `describe()`, and checked for missing values.

### 2. Visualizations and Observations
* **Survival Count:** Count of survivors vs non-survivors.
* **Gender vs Survival:** Females had higher survival.
* **Pclass vs Survival:** Higher-class passengers survived more.
* **Age Distribution & Boxplot:** Most passengers aged 20-40; younger passengers survived more.
* **Fare Distribution & Boxplot by Class:** Fare is right-skewed; higher classes paid more.
* **Correlation Heatmap:** Numeric correlations, including Fare vs Pclass.
* **Pairplot:** Trends between Age, Fare, Pclass, and Survival.

### 3. PDF Report Generation
* All plots are saved into a single PDF report using `PdfPages`.
* Heatmap only uses numeric columns to avoid conversion errors.

### 4. Summary of Findings
* ~38% of passengers survived.
* Women and first-class passengers had higher survival rates.
* Younger passengers and those paying higher fares had better chances.
* `Age` and `Cabin` have missing values, which can be handled in preprocessing.

## How to Run
1. Open `titanic_eda_notebook.ipynb` in Google Colab.
2. Upload `train.csv` when prompted.
3. Run all cells to generate visuals and download the PDF report.

## Requirements
* Python 3.x
* Pandas
* Matplotlib
* Seaborn
* NumPy
* Google Colab (for file upload and PDF download)

## Notes
* Observations are written below each plot for clarity.
* Heatmap only uses numeric columns to avoid errors.
