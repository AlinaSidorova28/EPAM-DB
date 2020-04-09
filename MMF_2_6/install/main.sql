-- This file is main file to create schema.
-- This file should be run under SYSTEM user.
--
-- Input: 1 - User name
--        2 - File location
-- Example of run: SQL> @main.sql MMF_120_0 D:\Oracle\Base\oradata\ORCL\DATAFILE\

--my

SET TIME ON
SET TIMING ON
SPOOL INSTALL_SCHEMA.LOG

DEFINE USER_NAME_ = &&1
DEFINE TBS_LOCATION_ =  &&2

SET SERVEROUTPUT ON

PROMPT
PROMPT Username: &&USER_NAME_
PROMPT Path: &&TBS_LOCATION_
PROMPT
PROMPT Calling data and index creation
@create_tablespace.sql &&USER_NAME_ &&TBS_LOCATION_
PROMPT
PROMPT Calling user creation
@create_user.sql &&USER_NAME_
PROMPT
PROMPT Giving grants to user
@grants.sql &&USER_NAME_
PROMPT

SET SERVEROUTPUT OFF

UNDEFINE USER_NAME_
UNDEFINE TBS_LOCATION_

SPOOL OFF