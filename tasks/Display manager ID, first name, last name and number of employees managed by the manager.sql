


-- Display manager ID, first name, last name and number of employees managed by the manager.

-- Menecerin id, ad, soyad ve ona tabe olan iscilerin siyahisini cixarin.


select m.employee_id, m.first_name, m.last_name, Count(e.employee_id) as isci_sayi
from employees m 
inner join employees e on m.employee_id = e.manager_id
group by m.employee_id, m.first_name, m.last_name
order by 1;