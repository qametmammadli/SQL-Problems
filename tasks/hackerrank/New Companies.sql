
-- problem: https://www.hackerrank.com/challenges/the-company/problem

select c.company_code, c.founder, 
(select count(distinct lead_manager_code) from lead_manager where company_code=c.company_code), 
(select count(distinct senior_manager_code) from senior_manager where company_code=c.company_code),
(select count(distinct manager_code) from manager where company_code=c.company_code),
(select count(distinct employee_code) from employee where company_code=c.company_code)
from company c
group by c.company_code, c.founder
order by c.company_code;
