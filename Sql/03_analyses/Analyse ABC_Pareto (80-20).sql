
WITH Classement_CA AS (
    SELECT 
        p.product_id,
        p.product_name,
        SUM(o.qty * p.unit_price * (1 - o.discount)) AS CA_produit,
        SUM(SUM(o.qty * p.unit_price * (1 - o.discount))) OVER () AS CA_global,
        SUM(SUM(o.qty * p.unit_price * (1 - o.discount))) OVER (ORDER BY SUM(o.qty * p.unit_price * (1 - o.discount)) DESC) AS CA_cumule,
        ROUND(

            SUM(SUM(o.qty * p.unit_price * (1 - o.discount))) OVER (ORDER BY SUM(o.qty * p.unit_price * (1 - o.discount)) DESC) 
            / SUM(SUM(o.qty * p.unit_price * (1 - o.discount))) OVER () * 100, 2
        ) AS Pourcentage_cumul

    FROM orders o
    JOIN products p ON o.product_id = p.product_id
    GROUP BY p.product_id, p.product_name
)
SELECT 
    product_id,
    product_name,
    CA_produit,
    Pourcentage_cumul,

    CASE 
        WHEN Pourcentage_cumul <= 80 THEN 'A (Top 80%)'
        WHEN Pourcentage_cumul <= 95 THEN 'B (15% suivants)'
        ELSE 'C (5% restants)'

    END AS Categorie_ABC
FROM Classement_CA
ORDER BY CA_produit DESC;