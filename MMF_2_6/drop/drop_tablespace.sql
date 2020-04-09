DEFINE USER_NAME = &&1

SET SERVEROUTPUT ON
DECLARE
    d_sql VARCHAR2(4000);
	i_sql VARCHAR2(4000);
    d_tbs_name VARCHAR2(500) := '&&USER_NAME'||'_DATA';
	i_tbs_name VARCHAR2(500) := '&&USER_NAME'||'_INDEX';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Dropping data tablespace "'||d_tbs_name||'" and index "'||i_tbs_name||'"');
    d_sql:='DROP TABLESPACE '||d_tbs_name||' INCLUDING CONTENTS AND DATAFILES';
	i_sql:='DROP TABLESPACE '||i_tbs_name||' INCLUDING CONTENTS AND DATAFILES';
    EXECUTE IMMEDIATE d_sql;
    EXECUTE IMMEDIATE i_sql;
END;
/ 
SET SERVEROUTPUT OFF

UNDEFINE USER_NAME
