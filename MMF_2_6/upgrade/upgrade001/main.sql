SET TIME ON
SET TIMING ON
SPOOL UPGRADE_SCHEMA.LOG

DEFINE USER_NAME = &&1
connect &&USER_NAME/oracle

SET SERVEROUTPUT ON

PROMPT Username: &&USER_NAME
PROMPT
PROMPT Calling tables creating
@tables/create_product_table.sql &&USER_NAME
@tables/create_nutritions_table.sql &&USER_NAME
@tables/create_ingredients_table.sql &&USER_NAME
@tables/create_box_table.sql &&USER_NAME
@tables/create_storage_table.sql &&USER_NAME
@tables/create_transport_table.sql &&USER_NAME
@tables/create_customer_table.sql &&USER_NAME 
@tables/create_batch_table.sql &&USER_NAME
@tables/create_batch_info_table.sql &&USER_NAME
PROMPT
PROMPT Create raw data table
@test/create_raw_table.sql
PROMPT
PROMPT Delete old data in tables
@data_delete.sql
PROMPT
PROMPT Insert data in tables from raw data
@data_insert.sql
PROMPT
PROMPT Create data view of tables
@create_view.sql
PROMPT
PROMPT Count data in tables
@data_count.sql
PROMPT

SET SERVEROUTPUT OFF

UNDEFINE USER_NAME
SPOOL OFF