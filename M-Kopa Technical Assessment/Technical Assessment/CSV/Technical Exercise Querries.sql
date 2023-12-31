USE mkopa;
SELECT * FROM payments;
SELECT * FROM sales;

/* Question 4:
Write the SQL query that picks the results from the different Excel sheets and creates a summary table */

-- Payment Table --
-- QUESTION 1. Which Payment Plan had the highest sales in a particular month --

SELECT DISTINCT(`Month`) FROM payments;

SELECT `Payment Plan Name`, MAX(`Total Top Ups`) AS Highest_Sales
FROM payments
WHERE `Month` = 'Aug'
GROUP BY `Payment Plan Name`
ORDER BY Highest_Sales  DESC
LIMIT 1;

-- QUESTION 2. What is the total revenue generated by each Product Sub Category? --

SELECT `Product Sub Category`, SUM(`Total Top Ups`) AS `Total_Revenue`
FROM payments
GROUP BY `Product Sub Category`
ORDER BY Total_Revenue DESC;

-- QUESTION 3 Which Product Type had the highest average daily top up?

SELECT `Product Type`, AVG(`Daily Top Up`) AS 'Average_Daily_TopUp'
FROM payments
GROUP BY `Product Type`
ORDER BY 2 DESC
LIMIT 1;

-- QUESTION 4 How does the sales trend of a particular Model change over time?

SELECT DISTINCT(`Model`) FROM payments;
-- Taking the M-KOPA 6000 Model as desired model 

SELECT `Model`, `Created At Date`, `Total Top Ups`
FROM payments
WHERE `Model` = 'M-KOPA 6000'
ORDER BY `Created At Date`;

-- QUESTION 5 What is the monthly revenue trend for a particular Masterbrand

SELECT DISTINCT(`Masterbrand`) FROM payments;
-- We have one master brand "Solar"

SELECT `Month`, SUM(`Total Top Ups`) AS `Monthly_Revenue`
FROM payments
WHERE `Masterbrand` = 'Solar'
GROUP BY `Masterbrand`, `Month`
ORDER BY 2 DESC;


-- Sales Table --

-- QUESTION 1 - A chart that shows the sales trend of a selected Model over time.
SELECT DISTINCT(`Model`) FROM sales; 

-- Desired model = M-KOPA 6000
SELECT `Local Sold At Month`, `Sales`
FROM sales
WHERE `Model` = 'M-KOPA 6000'
ORDER BY `Local Sold At Month`;

-- QUESTION 2 - Monthly revenue trend of a selected Masterbrand

SELECT `Month`, SUM(`Revenue`) AS Monthly_Revenue
FROM sales
WHERE `Masterbrand` = 'Solar'
GROUP BY `Month`
ORDER BY 2 DESC ;

-- QUESTION 3 - Total revenue generated by each Product Sub Category.

SELECT `Product Sub Category`, SUM(`Revenue`) AS Total_Revenue
FROM sales
GROUP BY `Product Sub Category`
ORDER BY 2 DESC ;

-- QUESTION 4 - The daily top-up trend of each Product Type

SELECT `Local Sold At Month`, `Product Type`, AVG(`Daily Top Up`) AS Average_Daily_Top_Up
FROM sales
GROUP BY `Local Sold At Month`, `Product Type`
ORDER BY `Local Sold At Month`;

-- QUESTION 5 - The Payment Plan with the highest sales in a particular month.

SELECT `Payment Plan Name`, MAX(`Sales`) AS Highest_Sales
FROM sales
WHERE `Month` = 'Aug'
GROUP BY `Payment Plan Name`
ORDER BY Highest_Sales DESC
LIMIT 1;

SELECT DISTINCT(`Product Category`) FROM payments;

