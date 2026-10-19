Objectif du projet:

Ce projet a pour objectif de construire un entrepôt de données (Data Warehouse) à partir des fichiers CSV de ventes de Costco. Il permet d'analyser les performances commerciales sur la période 2020 à 2024 via des requêtes SQL dédiées (chiffre d'affaires, marges, analyse ABC/Pareto, tendances mensuelles, etc.).
Le traitement des données s'articule autour d'un pipeline ETL classique en 3 étapes :
1.	Création des structures : Définition du schéma (tables de staging et tables finales en étoile).
2.	Chargement et nettoyage : Ingestion des données depuis les CSV et transformation vers le modèle final.
3.	Analyses et reporting : Exécution de requêtes métier pour extraire des insights (KPIs).

Architecture et Structure du projet:


```text
Sql_Vente_Costco/
├── Data/
│   ├── global_sales/
│   │   ├── 2020.csv
│   │   ├── 2021.csv
│   │   ├── 2022.csv
│   │   ├── 2023.csv
│   │   └── 2024.csv
│   ├── customers.csv                           # Fichier source des clients
│   └── Product.csv                             # Fichier source des produits
└── Sql/
    ├── 01_dll/
    │   └── Create_tables.sql                   # Création de toutes les tables (staging + finales)
    ├── 02_import/
    │   ├── Load_Customers_staging.sql          # Import des clients depuis customers.csv
    │   ├── Load_Products_staging.sql           # Import des produits depuis Product.csv
    │   ├── Load_Orders_staging.sql             # Import des commandes depuis global_sales/*.csv
    │   ├── Table_Customers_Final.sql           # Nettoyage des clients 
    │   ├── Table_Products_Final.sql            # Nettoyage des produits 
    │   └── Table_Orders_Final.sql              # Jointures et insertion 
    └── 03_analyses/
        ├── Chiffre_Affaire_par_Produit.sql     # CA généré par produit
        ├── Top_10_par_Chiffre_Affaires.sql     # Classement des 10 meilleurs produits (CA)
        ├── Top_10_par_Quantite_Vendue.sql      # Classement des 10 meilleurs produits (Volume)
        ├── Marge_brute_par_produit.sql         # Analyse de la rentabilité
        ├── Evolution_ventes_mensuelles.sql     # Suivi des tendances (Time Series)
        └── Analyse_ABC_Pareto_80-20.sql        # Loi de Pareto (80% du CA par 20% des produits)

```

Analyses et KPIs:

Le dossier 03_analyses/ contient les requêtes SQL répondant à des problématiques business concrètes :

•	Performance globale : Suivi du Chiffre d'Affaires et de son évolution mensuelle.
•	Performance produit : Top 10 par CA et par volume, calcul de la marge brute.
•	Analyse stratégique : Classification ABC (Pareto 80/20) pour identifier les produits les plus critiques pour l'entreprise.
