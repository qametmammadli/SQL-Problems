
-- Display how many employees joined in each month of the current year.

-- Cari ilde her ay neche iscinin qosuldugunu tapin.


select month_display, (
	    select Count(*) from employees 
	    where extract(year from hire_date) = extract(year from current_timestamp) and 
	    to_char(hire_date, 'Month') = m.month_display
	) as isci_sayi 
from WWV_FLOW_MONTHS_MONTH m
group by month_display
order by 2;

