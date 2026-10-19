USE Vente_Costco;
GO

SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.sub_category,
    SUM(o.qty * p.unit_price * (1 - o.discount)) AS chiffre_affaires_total,
    SUM(o.qty) AS quantite_totale_vendue,
    COUNT(DISTINCT o.order_id) AS nb_commandes
FROM orders o
INNER JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.category, p.sub_category
ORDER BY chiffre_affaires_total DESC;
GO