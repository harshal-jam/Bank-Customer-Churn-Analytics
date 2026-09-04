Bank Customer Churn & Value Risk Analytics

Project Overview

This project analyzes bank customer churn using MySQL and Power BI.

The objective is to identify customers and customer segments with high churn risk, understand the factors associated with churn, and determine where the bank has the highest customer value at risk.

The analysis follows a business-focused approach:

Business Problem → SQL Analysis → Risk Identification → Customer Value Analysis → Power BI Dashboard → Business Recommendations


Business Problem

Management wants to understand:

- Why customers are leaving the bank
- Which customer segments are most likely to churn
- Which products and regions have higher churn risk
- Whether inactive and high-value customers are more likely to churn
- Where the highest customer value is exposed to churn
- Which customer segments should be prioritized for retention


Dataset

The dataset contains 10,000 bank customers.

It includes customer information such as:

- Credit Score
- Geography
- Gender
- Age
- Tenure
- Balance
- Number of Products
- Credit Card Ownership
- Active Membership
- Estimated Salary
- Customer Churn Status


Tools Used

MySQL

Used for data cleaning, exploration, customer segmentation, churn-rate analysis, financial analysis, and identifying high-risk customer segments.

Power BI

Used to build an interactive dashboard for executive reporting, churn-driver analysis, customer-value risk analysis, and retention recommendations.


SQL Analysis

The SQL analysis covers:

- Overall customer churn
- Churn rate by geography
- Churn rate by product
- Churn rate by gender
- Churn rate by age group
- Churn rate by credit score
- Churn rate by tenure
- Churn rate by credit card ownership
- Churn rate by active and inactive customers
- Customer balance analysis
- High-value churned customers
- Geography and activity analysis
- Geography and product analysis
- Age and activity analysis
- Product, gender, and activity analysis


Key Findings

The dataset contains 10,000 customers, of which 2,037 customers have churned.

The overall customer churn rate is 20.37%.

Germany has the highest observed churn rate among the analyzed countries.

Inactive customers have a higher observed churn rate than active customers.

Product 4 is the most critical observed risk segment, with 60 out of 60 customers having churned, resulting in a 100% observed churn rate.

Product 3 also has a significantly high observed churn rate of 82.71%.

Customers with balances above 200K have an observed churn rate of 55.88%.

Churned customers have a higher average balance than retained customers, indicating that customer churn also represents a customer-value risk.

Germany has the largest churned customer balance among the analyzed regions.


Power BI Dashboard

The Power BI report contains four pages.

Page 1: Executive Overview

Provides an overall view of customer churn, customer distribution, churn rate, customer balance, geography, products, and activity status.

Page 2: Churn Drivers

Analyzes the customer characteristics associated with higher churn, including geography, age, gender, credit score, tenure, products, credit card ownership, and activity status.

Page 3: Customer Value Risk

Focuses on the financial value exposed to churn by analyzing customer balances, churned customer balances, geography, and active or inactive customer status.

Page 4: Retention Strategy

Converts the analytical findings into business-focused retention priorities and recommended actions.


Business Recommendations

Product 4 should be investigated immediately because of its 100% observed churn rate in the dataset.

Product 3 should also be investigated because of its significantly elevated churn rate.

Germany should be prioritized for deeper regional investigation and targeted retention activities.

Inactive customers should be targeted through re-engagement campaigns and personalized communication.

High-balance customers showing multiple churn-risk indicators should receive higher retention priority because their potential business impact is greater.

Further customer feedback and operational data should be analyzed to identify the actual root causes behind the observed churn patterns.


Management Takeaway

Customer churn is not evenly distributed across the customer base.

The strongest observed risk signals are concentrated around Product 4, Product 3, Germany, inactive customers, older customers, high-balance customers, and lower credit-score segments.

The key business takeaway is that churn should be evaluated using both customer risk and customer value.

This allows the bank to prioritize retention efforts toward customers and segments where potential business impact is highest.


Project Structure

Bank-Customer-Churn-Analytics

├── README.md
├── SQL
│   └── Bank_Customer_Churn_Analysis.sql
├── PowerBI
│   └── Bank_Customer_Churn_Analytics.pbix
└── Dashboard
    ├── Page1_Executive_Overview.png
    ├── Page2_Churn_Drivers.png
    ├── Page3_Customer_Value_Risk.png
    └── Page4_Retention_Strategy.png


Skills Demonstrated

SQL
MySQL
Data Cleaning
Data Analysis
Customer Segmentation
Churn Analysis
Risk Analysis
Customer Value Analysis
Power BI
Dashboard Development
Business Intelligence
Business Insights
Data-driven Recommendations