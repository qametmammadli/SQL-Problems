select * from(
	select department_id, department_name
		from departments
	minus
	select d.department_id, d.department_name
		from employees e
		inner join departments d on d.department_id = e.department_id
		where extract(year from e.hire_date) >= extract(year from current_timestamp) - 1
		and extract(year from e.hire_date) <= extract(year from current_timestamp)
);