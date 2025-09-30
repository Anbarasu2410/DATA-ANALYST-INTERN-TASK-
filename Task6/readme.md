# AdventureWorks Monthly Sales Analysis

## Project Overview
This project analyzes **monthly revenue and order volume** using the AdventureWorks sample database in Microsoft SQL Server. The goal is to demonstrate how to extract meaningful insights from sales data by aggregating orders over time, calculating revenue, and identifying trends.

The analysis covers the following key operations:

- **Extracting Year and Month**: Breaking down the `OrderDate` to identify the time periods covered by the dataset.  
- **Calculating Revenue**: Summing the `TotalDue` for orders to measure total revenue and track monthly performance.  
- **Counting Orders**: Counting distinct `SalesOrderID` values to determine order volume per month.  
- **Aggregating by Time Period**: Grouping data by year and month to generate a summary of monthly revenue and order counts.  
- **Sorting Results**: Ordering the output chronologically to visualize trends over time.  
- **Filtering Specific Periods**: Using a date range to focus the analysis on specific months or quarters.

By combining these operations, the project provides a clear view of **monthly sales trends**, enabling better understanding of business performance, seasonality, and growth patterns.

---

## Key Takeaways
- Extracting time components from dates allows **temporal analysis**.  
- Aggregating revenue and order counts helps quantify **business performance**.  
- Limiting analysis to specific periods provides **targeted insights**.  
- Chronologically ordered results are useful for **visualization and reporting**.

---

## Tools Used
- Microsoft SQL Server  
- SQL Server Management Studio (SSMS)  
- Optional: Power BI or Excel for visualization

