SET SERVEROUTPUT ON

INSERT INTO PRODUCT(name, price, energy_value, weight, shelf_life)
    SELECT DISTINCT product_name, product_price, food_energy, product_weight, shelf_life
    FROM RAW_DATA;
    
INSERT INTO NUTRITIONS(fats, proteins, carbohydrates, cocoa, product_id)
	SELECT DISTINCT fats, protein, carbonohydrates, cocoa, (
			SELECT p.product_id
			FROM PRODUCT p
			WHERE p.name = product_name AND p.weight = product_weight
		) AS product_id
	FROM RAW_DATA;

INSERT INTO BOX(weight, type, price, count, product_id)
	SELECT DISTINCT box_weight, box_type, box_price, box_count, (
			SELECT p.product_id
			FROM PRODUCT p
			WHERE p.name = product_name AND p.weight = product_weight
		) as product_id
	FROM RAW_DATA;


INSERT INTO TRANSPORT(type)
	SELECT DISTINCT transport
	FROM RAW_DATA;

	
INSERT INTO CUSTOMER(name, address)
	SELECT DISTINCT customer_name, address
	FROM RAW_DATA;


INSERT INTO BATCH(customer_id, transport_id, status)
	SELECT DISTINCT (
        SELECT c.customer_id
        FROM CUSTOMER c
        WHERE c.name = rd.customer_name AND c.address = rd.address
    ) AS customer_id
    ,(
        SELECT t.transport_id
        FROM TRANSPORT t
        WHERE t.type = rd.transport
    ) AS transport_id
    ,rd.batch_status
    
	FROM RAW_DATA rd
    ORDER BY rd.batch_status DESC;
	

INSERT INTO BATCH_INFO(batch_id, box_id)
	SELECT (
			SELECT b.batch_id
			FROM batch b
			WHERE b.customer_id = ( 
					SELECT c.customer_id
					FROM customer c
					WHERE c.name = rd.customer_name AND c.address = rd.address
				) 
		) AS batch_id 
		,( 
			SELECT b.box_id
			FROM BOX b
			WHERE b.weight = rd.box_weight
				AND b.type = rd.box_type
				AND b.price = rd.box_price
				AND b.count = rd.box_count
				AND b.product_id = (
						SELECT p.product_id
						FROM PRODUCT p
						WHERE p.name = rd.product_name AND p.weight = rd.product_weight
					)
		) AS box_id
	FROM RAW_DATA rd;



SET SERVEROUTPUT OFF