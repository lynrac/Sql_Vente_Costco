USE Vente_Costco;
GO


TRUNCATE TABLE Products_Staging;
GO

BULK INSERT Products_Staging
FROM 'C:\Vente Costco\Data\Product.csv'   
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);
GO