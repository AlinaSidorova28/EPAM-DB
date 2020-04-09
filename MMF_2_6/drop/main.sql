SET TIME ON
SET TIMING ON
SPOOL DROP_SCHEMA.LOG

DEFINE USER_NAME = &&USER_NAME
SET SERVEROUTPUT ON

PROMPT
PROMPT Username: &&USER_NAME
PROMPT
PROMPT Dropping user
@drop_user.sql &&USER_NAME
PROMPT
PROMPT Dropping tablespace
@drop_tablespace.sql &&USER_NAME
PROMPT

SET SERVEROUTPUT OFF
UNDEFINE USER_NAME

SPOOL OFF