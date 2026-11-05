# Olist E-Commerce SQL Analysis

## Project Overview

This project analyzes the Olist Brazilian E-Commerce Public Dataset using SQLite to explore customer order patterns, monthly order growth, payment trends, product category performance, and data quality.

The analysis focuses on orders placed between January 2017 and August 2018 to avoid misleading comparisons caused by sparse data in the dataset's earliest and latest months.

## Tools Used

- **SQLite:** Data querying and analysis
- **DB Browser for SQLite:** Database management and query execution
- **Visual Studio Code:** SQL script organization and documentation
- **GitHub:** Portfolio publication

## Business Questions

This project investigates five key questions:

1. **Order Fulfillment:** What percentage of orders were delivered, canceled, or unavailable?
2. **Geographic Distribution:** Which Brazilian states generated the highest number of orders?
3. **Order Trends:** How did monthly order volume change between January 2017 and August 2018?
4. **Payment Trends:** How did monthly payment values and average payment per order change over time?
5. **Product Performance:** Which product categories generated the highest item sales value, and how did missing category information affect the analysis?

## Key Findings

### 1. Order Fulfillment and Geographic Distribution

- **97.02% of orders were delivered:** Of 99,441 orders, 96,478 had a `delivered` status.
- **Canceled and unavailable orders represented 1.24% of all orders:** Together, these statuses accounted for 1,234 orders.
- **São Paulo generated the most orders:** Customers in São Paulo (SP) accounted for 41,746 orders (42.0%), followed by Rio de Janeiro (RJ) with 12,852 and Minas Gerais (MG) with 11,635.
- **775 orders had no matching order-item records:** Of these, 767 were canceled or unavailable, highlighting an important data-quality consideration when joining orders to order items.

These findings describe order activity and recorded fulfillment statuses. They do not establish why individual orders were canceled or unavailable.

### 2. Monthly Order Trends

- **Order volume increased substantially during 2017:** Monthly orders rose from 800 in January 2017 to 5,673 in December 2017, although growth fluctuated between months.
- **November 2017 recorded the highest monthly order count in the analysis period:** Orders increased from 4,631 in October to 7,544 in November.
- **Month-over-month growth reached 62.90% in November 2017:** This represented an increase of 2,913 orders compared with October.
- **Order volume declined by 24.80% in December 2017:** Monthly orders decreased from 7,544 in November to 5,673 in December.

The November spike suggests a period of unusually high purchasing activity. However, the dataset alone does not establish the cause of this increase.

Monthly comparisons use January 2017 through August 2018, excluding sparse boundary months.

### 3. Payment Trends

- **Monthly payment value increased by 53.25% in November 2017:** Total recorded payment value rose from R$779,677.88 in October to R$1,194,882.80 in November.
- **Order volume grew faster than payment value:** Orders increased by 62.90% during the same period, compared with 53.25% growth in payment value.
- **Average payment value per order decreased:** The average fell from R$168.36 in October to R$158.39 in November, a decrease of R$9.97 per order.

These findings suggest that November's increase in total payment value was driven primarily by higher order volume rather than higher average payment value per order.

Payment values were calculated by summing all payment records associated with each order. Because some orders have multiple payment records, average payment value was calculated using distinct order IDs.

**Important limitation:** Recorded payment value should not automatically be interpreted as recognized business revenue.

### 4. Product Category Performance and Data Quality

- **Health & Beauty generated the highest item sales value:** The category recorded R$1,253,993.86 across 9,619 purchased item records.
- **Watches & Gifts ranked second:** The category generated R$1,201,645.44 across 5,986 purchased item records.
- **Bed, Bath & Table had the highest item count among the top five categories by sales value:** It recorded 11,107 purchased item records and R$1,036,509.69 in item sales value.
- **Missing product categories affected 1.43% of purchased item records:** Of 112,279 purchased item records analyzed, 1,601 lacked a category name.
- **Missing categories represented 1.33% of total item sales value:** These records accounted for R$179,469.39 of the R$13,541,712.78 total.

To preserve data quality, missing product categories were labeled `Unknown` rather than excluded. English category translations were used where available, while two untranslated Portuguese categories retained their original names.

**Important limitation:** Item sales value was calculated using product selling prices (`price`) and excludes freight charges. It should not be confused with total payment value or recognized revenue.

## Dataset

**Source:** [Olist Brazilian E-Commerce Public Dataset (Kaggle)](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

The dataset contains anonymized Brazilian e-commerce records from 2016–2018. This project uses six tables:

| Table | Description |
|---|---|
| `olist_orders_dataset` | Order IDs, customer IDs, purchase timestamps, and order statuses |
| `olist_customers_dataset` | Customer information, including geographic state |
| `olist_order_items_dataset` | Products purchased within orders, including item prices |
| `olist_order_payments_dataset` | Payment records and payment values |
| `olist_products_dataset` | Product information and Portuguese category names |
| `product_category_name_translation` | English translations of product category names |

**Analysis period:** January 2017 through August 2018.

The analysis excludes sparse boundary months to provide more meaningful monthly comparisons. The original data is not modified by the analytical queries.

## How to Run the Analysis

1. Download the [Olist Brazilian E-Commerce Public Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) from Kaggle.
2. Open **DB Browser for SQLite** and create a new SQLite database.
3. Import the following CSV files as tables, keeping the table names shown below:
   - `olist_orders_dataset`
   - `olist_customers_dataset`
   - `olist_order_items_dataset`
   - `olist_order_payments_dataset`
   - `olist_products_dataset`
   - `product_category_name_translation`
4. Open the **Execute SQL** tab in DB Browser for SQLite.
5. Open a `.sql` file from this repository, then execute its queries to reproduce the analysis.

## SQL Files

| File | Contents |
|---|---|
| `01_order_analysis.sql` | Order statuses, geographic distribution, and missing order items |
| `02_monthly_trends.sql` | Monthly order volume and month-over-month growth |
| `03_payment_analysis.sql` | Monthly payment values and average payment per order |
| `04_product_category_analysis.sql` | Product category sales with English translations and missing-category handling |

The SQL scripts use SQLite syntax and can be run independently once the required tables have been imported.