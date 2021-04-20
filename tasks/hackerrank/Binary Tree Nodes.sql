
-- problem: https://www.hackerrank.com/challenges/binary-search-tree-1/problem

select n, 
    case
        when bs.p is null then 'Root'
        when (select count(*) from bst where p = bs.n)>0 then 'Inner'
        else 'Leaf'
        end
from bst bs
order by n;