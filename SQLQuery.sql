A.--date) for month.
b.--GROUP BY year/month.
c.--Use SUM() for revenue.
d.--COUNT(DISTINCT order_id) for volume.
e.--Use ORDER BY for sorting.
f.--Limit results for specific time periods.

select * from SalesOrder$

--EXTRACTING,MONTH,QUARTER AND YEAR FROM SALES ORDER

select datepart(year,[order date]) as order_year,datepart( QUARTER,[order date]) as quarters,
datepart( month,[order date]) as order_month,
sum (sales) as tot_sales
from SalesOrder$
group by datepart(year,[order date]) ,datepart(quarter,[order date]),datepart( month,[order date])
order by order_year,order_month

-- DELIVERY TRACKING (LEAD TIME FOR DELIVERY)
SELECT [ORDER DATE],[SHIP DATE],
DATEDIFF( DAY, [ORDER DATE],[SHIP DATE]) AS DAYS_DIFF
FROM SALESORDER$


-- DISTINCT ORDER WISE QUANTITY AND REVENUE
SELECT DISTINCT [ORDER ID] , SUM(SALES) AS TOT_SALES , SUM(QUANTITY) AS TOTAL_QTY FROM SalesOrder$
GROUP BY [ORDER ID]
ORDER BY TOT_SALES DESC


-- TOP 5 SALES 
select TOP 5 [ORDER ID],[CUSTOMER ID], SUM(SALES) AS TOTAL_SALES, DATEPART(YEAR, [ORDER DATE]) AS ORDER_YEAR
FROM SALESORDER$
GROUP BY [ORDER ID],[CUSTOMER ID],DATEPART(YEAR, [ORDER DATE])
ORDER BY TOTAL_SALES DESC

--limiting results to specific time period -- TOTAL SALES IN 2015

SELECT COUNT(*) AS TOTAL_ORDERS, SUM(SALES) AS TOTAL_SALES
FROM SALESORDER$
WHERE DATEPART(YEAR,[ORDER DATE]) = 2015
