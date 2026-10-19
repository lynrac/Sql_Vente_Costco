
USE Vente_Costco;
GO

-- On vide la staging avant d'importer 

TRUNCATE TABLE orders_staging;
GO

-- Import 2020

BULK INSERT orders_staging
FROM 'C:\Vente Costco\Data\global sales\2020.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

-- Import 2021

BULK INSERT orders_staging
FROM 'C:\Vente Costco\Data\global sales\2021.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

-- Import 2022

BULK INSERT orders_staging
FROM 'C:\Vente Costco\Data\global sales\2022.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

-- Import 2023

BULK INSERT orders_staging
FROM 'C:\Vente Costco\Data\global sales\2023.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

-- Import 2024

BULK INSERT orders_staging
FROM 'C:\Vente Costco\Data\global sales\2024.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);
GO