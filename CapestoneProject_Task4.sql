/*Database Creation*/
CREATE DATABASE SalesAnalysis;
/*Create a table named "sales_sample"*/
CREATE TABLE sales_sample (
    Product_Id INT,
    Region VARCHAR(50),
    Date DATE,
    Sales_Amount NUMERIC
); 
Select*From sales_sample;

/*Data Creation-inserting 10 sample data for sales_sample table representing sales data*/
INSERT INTO sales_sample (Product_Id, Region, Date, Sales_Amount) VALUES
(1, 'East', '2024-01-01', 100),
(2, 'West', '2024-01-02', 150),
(3, 'North', '2024-01-03', 200),
(4, 'South', '2024-01-04', 250),
(5, 'East', '2024-01-05', 300),
(1, 'West', '2024-02-01', 350),
(2, 'North', '2024-02-02', 400),
(3, 'South', '2024-02-03', 450),
(4, 'East', '2024-02-04', 500),
(5, 'West', '2024-02-05', 550);

Select*From sales_sample;

/*Drill Down-Analyze sales data at a more detailed level. Write a query to perform drill down
from region to product level to understand sales performance*/

SELECT 'Drill Down' AS Operation, Region, Product_Id, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region, Product_Id
ORDER BY Region, Product_Id;

/*Rollup- To summarize sales data at different levels of granularity. Write a query to perform
roll up from product to region level to view total sales by region*/

SELECT 'Roll Up' AS Operation, Region, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region
ORDER BY Region;

/*Cube - To analyze sales data from multiple dimensions simultaneously. Write a query to
Explore sales data from different perspectives, such as product, region, and date*/

SELECT 'Cube' AS Operation, Product_Id, Region, Date, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY CUBE (Product_Id, Region, Date)
ORDER BY Product_Id, Region, Date;



/*Slice- To extract a subset of data based on specific criteria. Write a query to slice the data to
view sales for a particular region or date range*/

SELECT 'Slice' AS Operation, *
FROM sales_sample
WHERE Region = 'East';

SELECT 'Slice' AS Operation, *
FROM sales_sample
WHERE Date BETWEEN '2024-01-01' AND '2024-01-31';

/*Dice - To extract data based on multiple criteria. Write a query to view sales for specific
combinations of product, region, and date*/
SELECT 'Dice' AS Operation, *
FROM sales_sample
WHERE Product_Id IN (1, 2) AND Region IN ('East', 'West') AND Date BETWEEN '2024-01-01' AND '2024-01-31';
