# SQL Sales Analysis Project

## Project Overview
This project analyzes sales data using SQL.

## Tables
1. Customers
2. Products
3. Sales

## SQL Concepts Used
- CREATE TABLE
- INSERT INTO
- SELECT
- INNER JOIN
- GROUP BY
- ORDER BY
- SUM
- COUNT
- Revenue Analysis

## Business Questions Solved

### Total Revenue
```sql
SELECT
SUM(Products.price * Sales.quantity) AS Total_Revenue
FROM Sales
INNER JOIN Products
ON Sales.product_id = Products.product_id;
```

### Top Selling Products

### Customer-wise Purchase Analysis

### Revenue Analysis
