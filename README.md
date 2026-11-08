Projet personnel — Pilotage ventes et stocks
STATUT : kit généré à partir de données entièrement synthétiques. Ce projet n’est ni une mission client ni une réalisation professionnelle passée. Les variations sont aléatoires et ne permettent aucune conclusion métier réelle.
Démarrage
Installer Python et pandas dans votre environnement : `pip install pandas`.
Depuis la racine du projet : `python python/analyse.py`.
Examiner les contrôles et les fichiers results/. Ils ont aussi été exécutés lors de la génération du kit.
Ouvrir sql/analyses.sql dans un environnement SQLite après import des CSV. Les dix requêtes ont été exécutées avec succès lors de la préparation. Adapter les fonctions de date pour SQL Server.
Dans Power BI Desktop, importer les cinq CSV et contrôler les types (dates, entiers, décimaux).
Modèle
FactSales : une ligne de vente, identifiant sale_line_id.
FactStock : un produit, un site, une date ; stock de fin de journée.
DimDate, DimProduct et DimSite : relations 1-* à sens unique vers les deux tables de faits. Ne pas relier les faits directement. Marquer DimDate comme table de dates. Les noms techniques restent ceux des fichiers : fact_sales, fact_stock, dim_date, dim_product, dim_site.
Rapport à réaliser
Page 1 : CA, marge brute, taux de marge, évolution annuelle, courbe mensuelle, détail par site et catégorie.
Page 2 : stock à la dernière date sélectionnée, couples produit/site en rupture, détail produit/site. Ne pas sommer les relevés de stock sur les dates.
Ajouter les mesures du fichier powerbi/mesures.dax puis comparer les totaux aux résultats Python et SQL. Les mesures DAX n’ont pas été exécutées dans Power BI.
Qualité et limites
Contrôles exécutés : unicité des ventes et des relevés de stock, intégrité des trois clés, quantités admissibles, recalcul du CA et rapprochement SQL/Python.
Pas de retours, remises, taxes, devises multiples, budget ni délais d’approvisionnement. Stock et ventes générés indépendamment : ne pas inférer un effet causal entre eux. Une rupture désigne ici un stock nul, pas une vente perdue.
CA N-1 : période comparable de l’année précédente ; 2024 n’a pas d’historique 2023.
Le taux de marge est marge/CA, pas marge/coût.
Tests Power BI à effectuer
CA total et marge identiques à results/validation_summary.csv (tolérance 0,01).
Un filtre site/produit agit sur ventes et stocks.
Stock à date cohérent avec SQL, jamais somme de plusieurs jours.
Pas de division par zéro ; comparaison N-1 vide si historique absent.
Droits RLS et actualisation : à construire et tester séparément, non fournis.
Publication
Avant toute publication, relire les chiffres et indiquer clairement « projet personnel sur données synthétiques ». Aucun dépôt, compte cloud, fichier PBIX ou déploiement Service/Fabric n’a été créé.