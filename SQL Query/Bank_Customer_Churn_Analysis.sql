/* ============================================================
   PROJECT: BANK CUSTOMER CHURN & VALUE RISK ANALYTICS
   DATABASE: Bank_Churn
   TOOL: MySQL Workbench

   OBJECTIVE:
   Identify customer segments with high churn risk and
   understand the relationship between geography, activity,
   products, credit score, age, tenure and customer balance.

   KEY BUSINESS QUESTION:
   Why are customers leaving the bank, which segments are
   most at risk, and where should retention efforts focus?
   ============================================================ */


/* ============================================================
   1. DATABASE & TABLE SETUP
   ============================================================ */

CREATE DATABASE Bank_Churn;

USE Bank_Churn;

CREATE TABLE Customer_Churn (
    CustomerId INT PRIMARY KEY,
    Surname VARCHAR(50),
    CreditScore INT,
    Geography VARCHAR(50),
    Gender VARCHAR(15),
    Age INT,
    Tenure INT,
    Balance DECIMAL(15,2),
    NumOfProducts INT,
    HasCrCard INT,
    IsActiveMember INT,
    EstimatedSalary DECIMAL(15,2),
    Exited INT
);


/* ============================================================
   2. DATA VALIDATION
   ============================================================ */

-- View all records
SELECT *
FROM Customer_Churn;

-- Check total number of unique customers
SELECT COUNT(DISTINCT CustomerId) AS Total_Customers
FROM Customer_Churn;


/* ============================================================
   3. OVERALL CUSTOMER CHURN ANALYSIS
   ============================================================ */

-- Customer distribution: Stayed vs Churned
SELECT
    Exited,
    COUNT(CustomerId) AS Customer_Count
FROM Customer_Churn
GROUP BY Exited;


-- Overall churn rate
SELECT
    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Overall_Churn_Rate
FROM Customer_Churn;


/* ============================================================
   4. GEOGRAPHY ANALYSIS
   ============================================================ */
-- Churn rate by geography
SELECT
    Geography,
    COUNT(CustomerId) AS Total_Customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM Customer_Churn
GROUP BY Geography
ORDER BY Churn_Rate DESC;


/* ============================================================
   5. CUSTOMER BALANCE ANALYSIS
   ============================================================ */

-- Overall average balance
SELECT
    ROUND(AVG(Balance), 2) AS Average_Balance
FROM Customer_Churn;


-- Average balance: Stayed vs Churned
SELECT
    Exited,
    ROUND(AVG(Balance), 2) AS Average_Balance
FROM Customer_Churn
GROUP BY Exited;


-- Total balance held by churned customers
SELECT
    ROUND(SUM(Balance), 2) AS Total_Churned_Customer_Balance
FROM Customer_Churn
WHERE Exited = 1;


-- Maximum customer balance
SELECT
    MAX(Balance) AS Maximum_Balance
FROM Customer_Churn;


/* ============================================================
   6. ESTIMATED SALARY ANALYSIS
   ============================================================ */

-- Overall average estimated salary
SELECT
    ROUND(AVG(EstimatedSalary), 2) AS Average_Estimated_Salary
FROM Customer_Churn;


-- Average salary: Stayed vs Churned
SELECT
    Exited,
    ROUND(AVG(EstimatedSalary), 2) AS Average_Estimated_Salary
FROM Customer_Churn
GROUP BY Exited;


/* ============================================================
   7. ACTIVE vs INACTIVE CUSTOMER ANALYSIS
   ============================================================ */

-- Total customers by membership status
SELECT
    IsActiveMember,
    COUNT(CustomerId) AS Total_Customers
FROM Customer_Churn
GROUP BY IsActiveMember;


-- Churned customers by membership status
SELECT
    IsActiveMember,
    COUNT(CustomerId) AS Churned_Customers
FROM Customer_Churn
WHERE Exited = 1
GROUP BY IsActiveMember;


-- Churn rate by membership status
SELECT
    IsActiveMember,
    COUNT(CustomerId) AS Total_Customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM Customer_Churn
GROUP BY IsActiveMember
ORDER BY Churn_Rate DESC;


/* ============================================================
   8. PRODUCT ANALYSIS
   ============================================================ */

-- Customer distribution by number of products
SELECT
    NumOfProducts,
    COUNT(CustomerId) AS Total_Customers
FROM Customer_Churn
GROUP BY NumOfProducts
ORDER BY NumOfProducts;


-- Churned customers by number of products
SELECT
    NumOfProducts,
    COUNT(CustomerId) AS Churned_Customers
FROM Customer_Churn
WHERE Exited = 1
GROUP BY NumOfProducts
ORDER BY NumOfProducts;


-- Churn rate by number of products
SELECT
    NumOfProducts,
    COUNT(CustomerId) AS Total_Customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM Customer_Churn
GROUP BY NumOfProducts
ORDER BY Churn_Rate DESC;


/* ============================================================
   9. CREDIT CARD OWNERSHIP ANALYSIS
   ============================================================ */

SELECT
    HasCrCard,
    COUNT(CustomerId) AS Total_Customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM Customer_Churn
GROUP BY HasCrCard
ORDER BY Churn_Rate DESC;


/* ============================================================
   10. GENDER ANALYSIS
   ============================================================ */

SELECT
    Gender,
    COUNT(CustomerId) AS Total_Customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM Customer_Churn
GROUP BY Gender
ORDER BY Churn_Rate DESC;


/* ============================================================
   11. AGE GROUP ANALYSIS
   ============================================================ */

SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 55 THEN '26-55'
        ELSE '55+'
    END AS Age_Group,

    COUNT(CustomerId) AS Total_Customers,

    SUM(
        CASE WHEN Exited = 1 THEN 1 ELSE 0 END
    ) AS Churned_Customers,

    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate

FROM Customer_Churn
GROUP BY Age_Group
ORDER BY Churn_Rate DESC;


/* ============================================================
   12. CREDIT SCORE ANALYSIS
   ============================================================ */

SELECT
    CASE
        WHEN CreditScore < 600 THEN '<600'
        WHEN CreditScore BETWEEN 600 AND 699 THEN '600-699'
        WHEN CreditScore BETWEEN 700 AND 799 THEN '700-799'
        ELSE '800+'
    END AS Credit_Score_Group,

    COUNT(CustomerId) AS Total_Customers,

    SUM(
        CASE WHEN Exited = 1 THEN 1 ELSE 0 END
    ) AS Churned_Customers,

    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate

FROM Customer_Churn
GROUP BY Credit_Score_Group
ORDER BY Churn_Rate DESC;


/* ============================================================
   13. TENURE ANALYSIS
   ============================================================ */

SELECT
    CASE
        WHEN Tenure BETWEEN 0 AND 2 THEN '0-2 Years'
        WHEN Tenure BETWEEN 3 AND 5 THEN '3-5 Years'
        WHEN Tenure BETWEEN 6 AND 8 THEN '6-8 Years'
        ELSE '9-10 Years'
    END AS Tenure_Group,

    COUNT(CustomerId) AS Total_Customers,

    SUM(
        CASE WHEN Exited = 1 THEN 1 ELSE 0 END
    ) AS Churned_Customers,

    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate

FROM Customer_Churn
GROUP BY Tenure_Group
ORDER BY Churn_Rate DESC;


/* ============================================================
   14. BALANCE SEGMENT ANALYSIS
   ============================================================ */

SELECT
    CASE
        WHEN Balance < 50000 THEN '0-50K'
        WHEN Balance < 100000 THEN '50K-100K'
        WHEN Balance < 150000 THEN '100K-150K'
        WHEN Balance < 200000 THEN '150K-200K'
        ELSE '200K+'
    END AS Balance_Group,

    COUNT(CustomerId) AS Total_Customers,

    SUM(
        CASE WHEN Exited = 1 THEN 1 ELSE 0 END
    ) AS Churned_Customers,

    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate

FROM Customer_Churn
GROUP BY Balance_Group
ORDER BY Churn_Rate DESC;


/* ============================================================
   15. HIGH-VALUE CHURNED CUSTOMERS
   ============================================================ */

-- Customers who churned while holding above-average balance

SELECT
    CustomerId,
    Gender,
    Age,
    Geography,
    Balance,
    NumOfProducts,
    IsActiveMember,
    EstimatedSalary

FROM Customer_Churn

WHERE Exited = 1
  AND Balance > (
      SELECT AVG(Balance)
      FROM Customer_Churn
  )

ORDER BY Balance DESC;


/* ============================================================
   16. GEOGRAPHY × ACTIVE STATUS ANALYSIS
   ============================================================ */

SELECT
    Geography,
    IsActiveMember,

    COUNT(CustomerId) AS Total_Customers,

    SUM(
        CASE WHEN Exited = 1 THEN 1 ELSE 0 END
    ) AS Churned_Customers,

    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate

FROM Customer_Churn

GROUP BY Geography, IsActiveMember

ORDER BY Churn_Rate DESC;


/* ============================================================
   17. GEOGRAPHY × PRODUCT ANALYSIS
   ============================================================ */

SELECT
    Geography,
    NumOfProducts,

    COUNT(CustomerId) AS Total_Customers,

    SUM(
        CASE WHEN Exited = 1 THEN 1 ELSE 0 END
    ) AS Churned_Customers,

    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate

FROM Customer_Churn

GROUP BY Geography, NumOfProducts

ORDER BY Churn_Rate DESC;


/* ============================================================
   18. AGE × ACTIVE STATUS ANALYSIS
   ============================================================ */

SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 55 THEN '26-55'
        ELSE '55+'
    END AS Age_Group,

    IsActiveMember,

    COUNT(CustomerId) AS Total_Customers,

    SUM(
        CASE WHEN Exited = 1 THEN 1 ELSE 0 END
    ) AS Churned_Customers,

    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate

FROM Customer_Churn

GROUP BY Age_Group, IsActiveMember

ORDER BY Churn_Rate DESC;


/* ============================================================
   19. PRODUCT PERFORMANCE SUMMARY
   ============================================================ */

SELECT
    NumOfProducts,

    COUNT(CustomerId) AS Total_Customers,

    SUM(
        CASE WHEN Exited = 1 THEN 1 ELSE 0 END
    ) AS Churned_Customers,

    SUM(
        CASE WHEN Exited = 0 THEN 1 ELSE 0 END
    ) AS Retained_Customers,

    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate

FROM Customer_Churn

GROUP BY NumOfProducts

ORDER BY Churn_Rate DESC;


/* ============================================================
   20. ADVANCED CUSTOMER RISK ANALYSIS
   ============================================================ */

-- Identify high-risk customers based on multiple observed
-- characteristics from the analysis.

SELECT
    CustomerId,
    Geography,
    Gender,
    Age,
    CreditScore,
    Balance,
    NumOfProducts,
    IsActiveMember,
    EstimatedSalary,
    Exited

FROM Customer_Churn

WHERE
    Exited = 1

ORDER BY Balance DESC;