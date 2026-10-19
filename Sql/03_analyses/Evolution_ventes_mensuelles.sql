USE Vente_Costco;
GO

SELECT
    YEAR(o.order_date) AS annee,
    MONTH(o.order_date) AS mois,
    FORMAT(o.order_date, 'yyyy-MM') AS annee_mois,
    SUM(o.qty * p.unit_price * (1 - o.discount)) AS chiffre_affaires,
    COUNT(DISTINCT o.order_id) AS nb_commandes,
    SUM(o.qty) AS quantite_vendue

FROM orders o
INNER JOIN products p ON o.product_id = p.product_id
GROUP BY YEAR(o.order_date), MONTH(o.order_date), FORMAT(o.order_date, 'yyyy-MM')
ORDER BY annee, mois;
GO