SELECT 
    p.product_id,
    p.product_name,

    -- Chiffre d'Affaires réel (en tenant compte des remises)

    SUM(o.qty * p.unit_price * (1 - o.discount)) AS CA_total,

    -- Coût d'achat total (la remise ne s'applique pas sur le coût)

    SUM(o.qty * p.cogs) AS Cout_total_achat,

    -- Marge brute 

    SUM(o.qty * p.unit_price * (1 - o.discount)) - SUM(o.qty * p.cogs) AS Marge_brute,

    -- Taux de marge en pourcentage

    ROUND(
        (SUM(o.qty * p.unit_price * (1 - o.discount)) - SUM(o.qty * p.cogs)) 
        / NULLIF(SUM(o.qty * p.unit_price * (1 - o.discount)), 0) * 100, 2
    ) AS Taux_marge_pct

FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY Marge_brute DESC;
