
USE Vente_Costco;
GO

-- On vide la table finale avant d'insérer

TRUNCATE TABLE orders;
GO

INSERT INTO orders (order_id, order_date, ship_date, ship_mode, customer_id, product_id, qty, discount)
SELECT
    CAST(order_id AS INT),
    CAST(order_date AS DATE),      -- Adapter le format de la date pour qu'il soit au format dd/mm/yyyy
    CAST(ship_date AS DATE),
    ship_mode,
    customer_id,
    product_id,
    CAST(qty AS INT),
    CAST(discount AS FLOAT)
FROM orders_staging;
GO

-- Tester le chargement 

SELECT  *  FROM orders

SELECT  COUNT(*) FROM  orders