use global_electronics;
select * from combined;

select Country_x,count(distinct CustomerKey) as Number_of_Customers from combined
group by Country_x
order by Number_of_Customers desc;

select year(`Order Date`) AS Yearly,quarter(`Order Date`) as quarter, 
count(distinct `Order Number`) as Orders, sum(Quantity) as Quantity from combined
group by yearly,quarter
order by yearly,quarter;



select Subcategory, round(Quantity*`Unit Price USD`) as sales from combined
group by Subcategory,Quantity,`Unit Price USD`
order by sales desc;

select `Subcategory`, sum(Quantity) as quantity from combined
group by `Subcategory`
order by quantity desc;

select subcategory,count(distinct `Order Number`) as most_prefered from combined
group by Subcategory
order by most_prefered desc;

select state_x, round(Quantity*`Unit Price USD`) as sales from combined
group by state_x,Quantity,`Unit Price USD`
order by sales desc;

select Subcategory, sum(Quantity*`Unit Price USD`) as total_sales,
sum(Quantity*`Unit Cost USD` ) as total_cost,
sum(Quantity*`Unit Price USD`)-sum(Quantity*`Unit Cost USD` ) as total_profit
from combined
group by Subcategory
order by total_profit desc;

select state_x, round(Quantity*`Unit Price USD`) as sales from combined
where state_y != 'online'
group by state_x,Quantity,`Unit Price USD`
order by sales desc;

select state_y, `square Meters`,round(sum(Quantity*`Unit Price USD`)) as sales,
round(sum(Quantity*`Unit Price USD`)/`Established(Years)`) as Store_Performance
from combined
where state_y != 'online'
group by state_y, `square Meters`
order by `square Meters`desc, sales desc;

select state_y, `Established(Years)`,round(sum(Quantity*`Unit Price USD`)) as sales ,
round(sum(Quantity*`Unit Price USD`)/`Established(Years)`) as Store_Performance
from combined
where state_y != 'online'
group by state_y, `Established(Years)`
order by `Established(Years)` desc, sales desc;

select `Order Date`, Country_y, Exchange, sum(`Unit Price USD`) as Price_usd, 
sum(`Exchange Price USD`) as Exchange_price_usd
from combined
where `Currency Code` != 'USD'
group by Country_y, `Order Date`, Exchange
order by `Order Date`, Country_y ;
