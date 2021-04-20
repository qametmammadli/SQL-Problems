
-- Sales dynamics of product sales over the years

-- mehsul satislarinin iller uzre satis dinamikasi (mehsul adi, il, satis sayi, satis meblegi, say ferq, mebleg ferq)

select pr.prod_name, extract(year from s.time_id), count(s.prod_id) as sale_count, sum(s.amount_sold) as amount,
	count(s.prod_id)  - lag(count(s.prod_id)) over(partition by pr.prod_name order by 1 asc) as prev_sale_count_diff, 
	sum(s.amount_sold) - lag(sum(s.amount_sold)) over(partition by pr.prod_name order by 1 asc) as prev_amount_diff  
	from sales s 
	inner join products pr on pr.prod_id = s.prod_id
	group by pr.prod_name, extract(year from s.time_id)
 order by 1 as;