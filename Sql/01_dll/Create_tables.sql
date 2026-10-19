USE Vente_Costco;
GO
------------------------------------------------------------
-- Tables finales (production)
------------------------------------------------------------
DROP TABLE IF EXISTS orders;        -- dépend de customers et products
DROP TABLE IF EXISTS products;      
DROP TABLE IF EXISTS customers;     

-------------------------------------------------------------
-- Tables staging (brutes, sans contraintes)
-------------------------------------------------------------

DROP TABLE IF EXISTS orders_staging;
DROP TABLE IF EXISTS products_staging;
DROP TABLE IF EXISTS customers_staging;
GO

-----------------------------------------------------------
--  CRÉATION DES TABLES STAGING (pour les imports bruts)
-----------------------------------------------------------

CREATE TABLE products_staging (
    product_id     VARCHAR(50),
    product_name   VARCHAR(50),
    category       VARCHAR(50),
    sub_category   VARCHAR(50),
    unit_price     VARCHAR(50),   -- avec '$'
    cogs           VARCHAR(50)    -- avec '$'
);
GO

CREATE TABLE customers_staging (
    customer_id   VARCHAR(50),
    customer_name VARCHAR(100),
    segment       VARCHAR(50),
    Country_City  VARCHAR(50),
    Etat          VARCHAR(50),
    Postal_Code   VARCHAR(50),
    Region        VARCHAR(50), 
    
);
GO

CREATE TABLE orders_staging (
    order_id     VARCHAR(50),
    order_date   VARCHAR(50),
    ship_date    VARCHAR(50),
    ship_mode    VARCHAR(50),
    customer_id  VARCHAR(50),
    product_id   VARCHAR(50),
    qty          VARCHAR(50),
    discount     VARCHAR(50)
);
GO

-----------------------------------------------------------
-- CRÉATION DES TABLES FINALES (avec clés et types adequats )
-----------------------------------------------------------
CREATE TABLE products (
    product_id     VARCHAR(50) PRIMARY KEY,
    product_name   VARCHAR(50),
    category       VARCHAR(50),
    sub_category   VARCHAR(50),
    unit_price     FLOAT,    -- sans '$'
    cogs           FLOAT     -- sans '$'
);
GO

CREATE TABLE customers (
    customer_id   VARCHAR(50) PRIMARY KEY,
    customer_name VARCHAR(100),
    segment       VARCHAR(50),
    Country_City  VARCHAR(50),
    Etat          VARCHAR(50),
    Postal_Code   VARCHAR(50),
    Region        VARCHAR(50),
    
);
GO

CREATE TABLE orders (
    order_id     INT ,
    order_date   DATE,
    ship_date    DATE,
    ship_mode    VARCHAR(50),
    customer_id  VARCHAR(50),
    product_id   VARCHAR(50),
    qty          INT,
    discount     FLOAT,
     
   
   );
GO
