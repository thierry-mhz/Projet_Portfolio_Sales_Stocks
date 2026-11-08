# Pilotage des ventes et des stocks

> **Statut — projet personnel sur données entièrement synthétiques.**
>
> Ce projet n’est ni une mission client ni une réalisation professionnelle passée. Les variations sont aléatoires et ne permettent aucune conclusion métier réelle.

## Démarrage

1. Installez Python et pandas dans votre environnement :
   ```bash
   pip install pandas
   ```
2. Depuis la racine du projet, lancez l’analyse :
   ```bash
   python python/analyse.py
   ```
3. Examinez les contrôles et les fichiers générés dans `results/`. Ces contrôles ont également été exécutés lors de la génération du kit.
4. Pour consulter les analyses SQL, ouvrez `sql/analyses.sql` dans un environnement SQLite après avoir importé les CSV. Les dix requêtes ont été exécutées avec succès lors de la préparation. Adaptez les fonctions de date pour SQL Server.
5. Dans Power BI Desktop, importez les cinq CSV et vérifiez les types de données (dates, entiers et décimaux).

## Modèle de données

| Table | Granularité / rôle |
|---|---|
| `FactSales` | Une ligne par vente, identifiée par `sale_line_id`. |
| `FactStock` | Un produit, un site et une date ; stock de fin de journée. |
| `DimDate`, `DimProduct`, `DimSite` | Dimensions reliées en 1-à-plusieurs, à sens unique, aux deux tables de faits. |

Ne reliez pas directement les deux tables de faits. Marquez `DimDate` comme table de dates. Les noms techniques des fichiers restent `fact_sales`, `fact_stock`, `dim_date`, `dim_product` et `dim_site`.

## Rapport Power BI à réaliser

### Page 1 — Ventes

- Chiffre d’affaires (CA), marge brute et taux de marge
- Évolution annuelle et courbe mensuelle
- Détail par site et par catégorie

### Page 2 — Stocks

- Stock à la dernière date sélectionnée
- Couples produit/site en rupture
- Détail par produit et par site

Ne faites pas la somme des relevés de stock sur plusieurs dates. Ajoutez les mesures du fichier `powerbi/mesures.dax`, puis comparez les totaux aux résultats Python et SQL. Les mesures DAX n’ont pas été exécutées dans Power BI.

## Qualité et limites

### Contrôles exécutés

- Unicité des ventes et des relevés de stock
- Intégrité des trois clés
- Quantités admissibles
- Recalcul du CA et rapprochement SQL/Python

### Limites des données et des indicateurs

- Pas de retours, remises, taxes, devises multiples, budget ni délais d’approvisionnement.
- Stocks et ventes sont générés indépendamment : n’en déduisez pas de lien causal.
- Une rupture désigne ici un stock nul, et non une vente perdue.
- Le CA N-1 correspond à la période comparable de l’année précédente ; 2024 n’a pas d’historique 2023.
- Le taux de marge est calculé comme marge / CA, et non marge / coût.

## Tests Power BI à effectuer

- Vérifier que le CA total et la marge correspondent à `results/validation_summary.csv` (tolérance : 0,01).
- Vérifier qu’un filtre sur le site ou le produit agit sur les ventes et les stocks.
- Vérifier que le stock à une date est cohérent avec SQL et n’est jamais la somme de plusieurs jours.
- Vérifier l’absence de division par zéro et que la comparaison N-1 reste vide si l’historique est absent.
- Construire et tester séparément les droits RLS et l’actualisation ; ils ne sont pas fournis.

## Publication

Avant toute publication, relisez les chiffres et indiquez clairement : **« projet personnel sur données synthétiques »**.

Aucun dépôt, compte cloud, fichier PBIX ou déploiement Service/Fabric n’a été créé.
