SET SERVEROUTPUT ON

CREATE VIEW Dolce_Vita AS (
    SELECT BA.BATCH_ID AS Batch_Number
    , BA.STATUS AS Batch_Status
    , C.NAME AS Customer_Name
    , C.ADDRESS as Address
    , T.TYPE AS Transport
    , B.WEIGHT AS Box_Weight
    , B.TYPE AS Box_Type
    , B.PRICE AS Box_Price 
    , B.COUNT AS Box_Count
    , P.NAME AS Product_Name
    , P.PRICE AS Product_Price
    , P.WEIGHT AS Product_Weight
    , P.SHELF_LIFE AS Shelf_Life
    , P.ENERGY_VALUE AS Food_Energy
    , N.PROTEINS AS Protein
    , N.FATS AS Fats
    , N.CARBOHYDRATES AS Carbohydrates
    , N.COCOA AS Cocoa
    
    FROM BATCH BA
    JOIN BATCH_INFO BI ON BA.BATCH_ID = BI.BATCH_ID
    JOIN BOX B ON B.BOX_ID = BI.BOX_ID
    JOIN PRODUCT P ON P.PRODUCT_ID = B.PRODUCT_ID
    JOIN NUTRITIONS N ON N.PRODUCT_ID = P.PRODUCT_ID
    JOIN CUSTOMER C ON BA.CUSTOMER_ID = C.CUSTOMER_ID
    JOIN TRANSPORT T ON T.TRANSPORT_ID = BA.TRANSPORT_ID
);

SET SERVEROUTPUT OFF