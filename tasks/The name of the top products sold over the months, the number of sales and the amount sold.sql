
-- The name of the top products sold over the months, the number of sales and the amount sold

 -- aylar uzre top satilan mehsulin adi, satis sayi ve meblegi

select * from(
	select pr.prod_name, to_char(s.time_id, 'Month'), count(s.prod_id) as sale_count, sum(s.amount_sold),
		dense_rank() over(partition by to_char(s.time_id, 'Month') order by count(s.prod_id) desc) as rank 
	from sales s
	inner join products pr on pr.prod_id = s.prod_id
	group by pr.prod_name, to_char(time_id, 'Month') 
)
where rank = 1
order by sale_count desc;
