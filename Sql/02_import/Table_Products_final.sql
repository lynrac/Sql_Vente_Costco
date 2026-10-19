USE Vente_Costco;
GO

-- On vide la table finale AVANT d'insérer.

TRUNCATE TABLE Products;
GO

INSERT INTO Products (product_id, product_name, category, sub_category, unit_price, cogs)
SELECT
    product_id,
    product_name,
    category,
    sub_category,
    CAST(REPLACE(REPLACE(unit_price, '$', ''), ',', '') AS FLOAT) AS unit_price,
    CAST(REPLACE(REPLACE(cogs, '$', ''), ',', '') AS FLOAT) AS cogs
FROM Products_Staging;

-- tester le chargement 

SELECT  *   FROM Products