DEFINE USER_NAME = &&1
DEFINE TBSP_LOCATION = &&2

SET SERVEROUTPUT ON

DECLARE
    d_sql VARCHAR2(4000);
    i_sql VARCHAR2(4000);
    d_tbs_name VARCHAR2(500):= '&&USER_NAME' ||'_DATA';
    d_file_name VARCHAR2(500):= '&&TBSP_LOCATION' || '\' ||d_tbs_name||'.dbf';
    i_tbs_name VARCHAR2(500) := '&&USER_NAME'||'_INDEX';
    i_file_name VARCHAR2(500) := '&&TBS_LOCATION'||'\'||i_tbs_name||'.dbf';
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('Creating new data tablespace "'||d_tbs_name||'" and index "'||i_tbs_name||'"');
    d_sql:='CREATE SMALLFILE TABLESPACE '||d_tbs_name||' DATAFILE '''||d_file_name||''' SIZE 10M AUTOEXTEND ON NEXT 10M MAXSIZE 1G EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO';
    index_sql:='CREATE SMALLFILE TABLESPACE '||i_tbs_name||' DATAFILE '''||i_file_name||''' SIZE 10M AUTOEXTEND ON NEXT 10M MAXSIZE 1G EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO';
    DBMS_OUTPUT.PUT_LINE('Script to create tablespace: '||d_sql);
    EXECUTE IMMEDIATE d_sql;
    DBMS_OUTPUT.PUT_LINE('Script to create index: '||i_sql);
    EXECUTE IMMEDIATE i_sql;
END;
/ 
    
/*CREATE SMALLFILE TABLESPACE &&DATA_TBSP_NAME
DATAFILE '&&INDEX_TBSP_NAME'
SIZE 10M AUTOEXTEND ON NEXT 10M
MAXSIZE 1G EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;*/

SET SERVEROUTPUT OFF

UNDEFINE USER_NAME;
UNDEFINE TBSP_LOCATION;
