SET SERVEROUTPUT ON;

WITH t AS (
    SELECT 'PRODUCT' AS tablename, COUNT(*) data_num
    FROM PRODUCT group by 'PRODUCT'
    
    UNION ALL
    
    SELECT 'BOX' AS, COUNT(*) AS data_num
    FROM BOX group by 'BOX'
    
    UNION ALL
    
    SELECT 'STORAGE', COUNT(*) AS data_num
    FROM STORAGE group by 'STORAGE'
    
    UNION ALL
    
    SELECT 'TRANSPORT', COUNT(*) AS data_num
    FROM TRANSPORT group by 'TRANSPORT'
    
    UNION ALL
    
    SELECT 'BATCH', COUNT(*) AS data_num
    FROM BATCH group by 'BATCH'
    
    UNION ALL
    
    SELECT 'BATCH_INFO', COUNT(*) AS data_num
    FROM BATCH_INFO group by 'BATCH_INFO'
    
    UNION ALL
    
    SELECT 'CUSTOMER', COUNT(*) AS data_num
    FROM CUSTOMER group by 'CUSTOMER'
    
    UNION ALL
    
    SELECT 'INGREDIENTS', COUNT(*) AS data_num
    FROM INGREDIENTS group by 'INGREDIENTS'
)
SELECT t.tablename || ' - number of values: ' || t.data_num AS tables
FROM t;

SET SERVEROUTPUT OFF;