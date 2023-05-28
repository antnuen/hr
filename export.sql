declare
  cursor table_cur is
    select table_name 
    from   all_tables
    where  owner = 'HR';
    
  table_name all_tables.table_name%type;
  
  rows_num natural := 2;
  sql_stmt clob;
  
  type json_nt is table of clob;
  json_rows json_nt;
begin
  open table_cur;
  loop
    fetch table_cur into table_name;
    exit when table_cur%notfound;
    
    sql_stmt := 
      'select json_object(*) from hr.' || table_name || ' where rownum <= :rows_num';
    
    execute immediate sql_stmt 
      bulk collect 
      into json_rows 
      using rows_num;
    
    dbms_output.put_line ( table_name );
    for rec in 1 .. json_rows.count loop
      dbms_output.put_line( json_rows(rec) );
    end loop;
  end loop;
  close table_cur;
end;
/