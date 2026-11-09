# Pilotage des ventes et des stocks

**Projet portfolio en analyse de données et en visualisation décisionnelle**

Ce projet présente une démarche structurée pour analyser les ventes et les stocks, suivre des indicateurs de performance et restituer les résultats à l’aide de Python, SQL et Power BI.

> **Périmètre :** projet personnel réalisé à partir de données entièrement synthétiques. Il ne s’agit pas d’une mission client ou d’une expérience professionnelle passée. Les données illustrent une méthode, mais ne permettent pas de tirer de conclusions métier réelles.

## Objectifs

- Analyser le chiffre d’affaires, les quantités vendues et la marge brute.
- Comparer les tendances dans le temps et explorer les résultats par produit, catégorie et site.
- Suivre le stock à une date donnée et repérer les situations de stock nul.
- Fiabiliser les indicateurs grâce à des contrôles et à des rapprochements entre outils.

## Démarche et livrables

- **Python** — préparation de synthèses et contrôles de cohérence des données.
- **SQL** — analyses des ventes, des tendances, des produits et des stocks.
- **Power BI** — rapport interactif et mesures DAX pour explorer les principaux indicateurs.
- **Modèle de données** — séparation des ventes et des stocks en tables de faits, reliées à des dimensions communes.

Les contrôles Python couvrent notamment l’unicité des enregistrements, l’intégrité des références, la cohérence des quantités et le calcul du chiffre d’affaires. Un rapprochement des totaux entre pandas et SQLite permet également de vérifier les résultats.

## Indicateurs et précautions d’interprétation

Le projet comprend le chiffre d’affaires, les quantités vendues, la marge brute, le taux de marge, des comparaisons temporelles et le suivi du stock à la dernière date sélectionnée. Le stock est un relevé ponctuel : il ne doit pas être additionné sur plusieurs jours. Une rupture désigne ici un stock nul et ne représente pas une vente perdue.
Le projet ne modélise pas les retours, remises, taxes, budgets ou délais d’approvisionnement ; il ne permet donc pas d’établir de causalité ni de formuler des recommandations métier réelles.

## Fichiers du projet

- `data/` - données synthétiques au format CSV.
- `python/analyse.py` - contrôles et synthèses.
- `sql/analyses.sql` - requêtes d’analyse.
- `results/` - examiner les contrôles.
- `powerbi/Projet_Sales_Stocks.pbix` - rapport Power BI.
- `powerbi/mesures.dax` - mesures de référence.
