--SELECT owner, table_name FROM all_tables
--order by owner;

select * 
from all_tables 
where owner = 'HRS';