
USE Vente_Costco;
GO

-- On vide la staging avant d'importer

TRUNCATE TABLE customers_staging;

GO

BULK INSERT customers_staging
FROM 'C:\Vente Costco\Data\customers.csv'   
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);
GO