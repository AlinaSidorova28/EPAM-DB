SET TIME ON
SET TIMING ON
SPOOL UPGRADE_SCHEMA.LOG

DEFINE USER_NAME = &&1

SET SERVEROUTPUT ON

PROMPT Username: &&USER_NAME
connect &&USER_NAME/oracle 
-- there are no upgrade scripts for now

SET SERVEROUTPUT OFF

UNDEFINE USER_NAME
SPOOL OFF