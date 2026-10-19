
SELECT TOP 10
    p.product_id,
    p.product_name,
    p.category,
    
    SUM(o.qty * p.unit_price * (1 - o.discount)) AS chiffre_affaires_total,
    SUM(o.qty) AS quantite_totale_vendue

FROM orders o
INNER JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY chiffre_affaires_total DESC;
GO