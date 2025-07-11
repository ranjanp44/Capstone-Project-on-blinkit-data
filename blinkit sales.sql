SELECT * FROM blinkit.`blinkit grocery data`;

use blinkit;

update `blinkit grocery data`
set `Item Fat Content`=
case 
when `Item Fat Content` in ('lf','low fat' ) then 'Low Fat'
when `Item Fat Content` = 'reg' then 'Regular'
else `Item Fat Content`
End;

select distinct(`Item Fat Content`) from  `blinkit grocery data`;

select sum(`Total Sales`) from `blinkit grocery data`;

select cast(sum(`Total Sales`)/1000000 as decimal(10,2))  as Total_sales_millions from `blinkit grocery data`
where `Item Fat Content` ='Low Fat';

select cast(avg(`Total Sales`)/1000000 as decimal(10,2))  as Avg_sales_millions from `blinkit grocery data`;

select count(*) as no_of_items from `blinkit grocery data`;

select *  from `blinkit grocery data`;

select cast(sum(`Total Sales`)/1000000 as decimal(10,2))  as Total_sales_millions from `blinkit grocery data`
where `Outlet Establishment Year` =2022;

select cast(avg(rating)  as decimal(10,2)) as 'Avg_Rating' from `blinkit grocery data`; 

select `Item Fat Content`,
			cast(sum(`Total Sales`) as decimal(10,2)) as Total_sales,
            cast(avg(`Total Sales`) as decimal(10,1)) as Avg_sales,
            count(*) as No_of_items,
            cast(avg (`rating`) as decimal(10,2)) as Avg_Rating
from `blinkit grocery data`
group by `Item Fat Content`
order by total_sales desc;
            
select `Item Fat Content`,
			cast(sum(`Total Sales`)/1000 as decimal(10,2)) as Total_sales_Thousands,
            cast(avg(`Total Sales`) as decimal(10,1)) as Avg_sales,
            count(*) as No_of_items,
            cast(avg (`rating`) as decimal(10,2)) as Avg_Rating
from `blinkit grocery data`
group by `Item Fat Content`
order by  Total_sales_Thousands desc;

select `item type`,
			cast(sum(`Total Sales`) as decimal(10,2)) as Total_sales_Thousands,
            cast(avg(`Total Sales`) as decimal(10,1)) as Avg_sales,
            count(*) as No_of_items,
            cast(avg (`rating`) as decimal(10,2)) as Avg_Rating
from `blinkit grocery data`
group by `item type`
order by  Total_sales_Thousands desc;



select `item type`,
			cast(sum(`Total Sales`) as decimal(10,2)) as Total_sales_Thousands,
            cast(avg(`Total Sales`) as decimal(10,1)) as Avg_sales,
            count(*) as No_of_items,
            cast(avg (`rating`) as decimal(10,2)) as Avg_Rating
from `blinkit grocery data`
group by `item type`
order by  Total_sales_Thousands desc;

select `Outlet Location Type`,`Item Fat Content`,
			cast(sum(`Total Sales`) as decimal(10,2)) as Total_sales,
            cast(avg(`Total Sales`) as decimal(10,1)) as Avg_sales,
            count(*) as No_of_items,
            cast(avg (`rating`) as decimal(10,2)) as Avg_Rating
from `blinkit grocery data`
group by `Outlet Location Type`,`Item Fat Content`
order by  `Total sales` desc;


SELECT 
    `Outlet Location Type`,
    ROUND(SUM(CASE WHEN `Item Fat Content` = 'Low Fat' THEN `Total sales` ELSE 0 END), 2) AS low_fat,
    ROUND(SUM(CASE WHEN `Item Fat Content` = 'Regular' THEN `Total sales` ELSE 0 END), 2) AS regular
FROM `blinkit grocery data`
GROUP BY `Outlet Location Type`
ORDER BY `Outlet Location Type`;

SELECT 
    `Outlet Size`,
    ROUND(SUM(`Total sales`), 2) AS Total_sales,
    ROUND(SUM(`Total sales`) * 100.0 / (
        SELECT SUM(`Total sales`) FROM `blinkit grocery data`
    ), 2) AS Sales_percentage
FROM `blinkit grocery data`
GROUP BY `Outlet Size`
ORDER BY Total_sales DESC;

SELECT `Outlet Establishment Year`, # year wise sales
       ROUND(SUM(`Total Sales`), 2) AS Yearly_Sales
FROM `blinkit grocery data`
GROUP BY `Outlet Establishment Year`
ORDER BY `Outlet Establishment Year`;

SELECT `Outlet Type`, #outlet type wise sales
       ROUND(SUM(`Total Sales`), 2) AS Total_Sales,
       ROUND(SUM(`Total Sales`)*100 / (SELECT SUM(`Total Sales`) FROM `blinkit grocery data`), 2) AS Sales_Percentage
FROM `blinkit grocery data`
GROUP BY `Outlet Type`;


SELECT `Outlet Identifier`, #averagesales per out
       ROUND(SUM(`Total Sales`), 2) AS Total_Sales,
       ROUND(AVG(`Total Sales`), 2) AS Avg_Sales_Per_Item,
       COUNT(*) AS No_of_Items
FROM `blinkit grocery data`
GROUP BY `Outlet Identifier`
ORDER BY Total_Sales DESC;

SELECT `Item Fat Content`,  #rating by fat content 
       ROUND(AVG(Rating), 2) AS Avg_Rating, 
       ROUND(AVG(`Total Sales`), 2) AS Avg_Sales
FROM `blinkit grocery data`
GROUP BY `Item Fat Content`;
