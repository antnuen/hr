select owner, TABLE_NAME, Column_name, Data_type, data_length, data_precision, NULLABLE, character_Set_Name
from all_tab_cols 
where owner = 'HRS'
