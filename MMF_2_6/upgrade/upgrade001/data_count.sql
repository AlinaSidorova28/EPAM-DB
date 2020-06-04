SET SERVEROUTPUT ON;

WITH t AS (
    SELECT 'PRODUCT' AS tablename, COUNT(*) AS data_num
    FROM PRODUCT group by 'PRODUCT'
    
    UNION ALL
    
    SELECT 'BOX'  AS tablename, COUNT(*) AS data_num
    FROM BOX group by 'BOX'
    
    UNION ALL
    
    SELECT 'STORAGE'  AS tablename, COUNT(*) AS data_num
    FROM STORAGE group by 'STORAGE'
    
    UNION ALL
    
    SELECT 'TRANSPORT' AS tablename, COUNT(*) AS data_num
    FROM TRANSPORT group by 'TRANSPORT'
    
    UNION ALL
    
    SELECT 'BATCH' AS tablename, COUNT(*) AS data_num
    FROM BATCH group by 'BATCH'
    
    UNION ALL
    
    SELECT 'BATCH_INFO' AS tablename, COUNT(*) AS data_num
    FROM BATCH_INFO group by 'BATCH_INFO'
    
    UNION ALL
    
    SELECT 'CUSTOMER' AS tablename, COUNT(*) AS data_num
    FROM CUSTOMER group by 'CUSTOMER'
    
    UNION ALL
    
    SELECT 'INGREDIENTS' AS tablename, COUNT(*) AS data_num
    FROM INGREDIENTS group by 'INGREDIENTS'
    
    UNION ALL
    
    SELECT 'NUTRIOTIONS' AS tablename, COUNT(*) AS data_num
    FROM NUTRIOTIONS group by 'NUTRIOTIONS'
    
)
SELECT t.tablename || ' - number of values: ' || t.data_num AS tables
FROM t;

SET SERVEROUTPUT OFF;