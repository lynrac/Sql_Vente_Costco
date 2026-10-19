USE Vente_Costco;
GO

-- On vide la table finale avant d'insérer

TRUNCATE TABLE customers;
GO

INSERT INTO customers (customer_id, customer_name, segment, Country_City, Etat, Postal_Code, Region)
SELECT
    customer_id,
    customer_name,
    segment,
    Country_City,
    Etat,
    Postal_Code,
    Region
FROM customers_staging;
GO

-- Tester le chargement 

SELECT *  FROM customers
