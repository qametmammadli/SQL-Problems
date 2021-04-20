
-- The name and amount of the top 10 best-selling products in each country

-- her olke uzre, top 10 en cox satilan mehsulun adi, meblegi

select * from(
	select c.country_name, pr.prod_name, count(s.prod_id) as sale_count, sum(s.amount_sold) as amount,
	rank() over(partition by c.country_name order by count(s.prod_id) desc) as rank from sales s  
	inner join products pr on pr.prod_id = s.prod_id
	inner join customers cus on cus.cust_id = s.cust_id
	inner join countries c on c.country_id = cus.country_id
	group by pr.prod_name, c.country_name order by count(s.prod_id) desc
)
where rank<=10;