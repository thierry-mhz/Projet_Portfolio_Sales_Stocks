# Pilotage des ventes et des stocks

Projet personnel de portfolio Data Analyst / BI consacré à l’analyse des ventes et au suivi des stocks, de la préparation des données jusqu’à la restitution décisionnelle dans Power BI.

> **Données fictives :** le jeu de données est synthétique et sert uniquement à illustrer une démarche d’analyse. Il ne représente aucune entreprise ni activité réelle.

## Objectifs

- Suivre le chiffre d’affaires, les quantités vendues et la marge brute.
- Analyser les évolutions dans le temps et comparer les performances par produit, catégorie et site.
- Suivre les niveaux de stock à une date donnée et repérer les situations de rupture.
- Mettre en place des contrôles de qualité et rapprocher les résultats entre Python et SQL.

## Démarche et outils

### 1. Préparation et qualité des données — Python / Pandas

Le traitement Python prépare les données et contrôle notamment :
- l’unicité des identifiants ;
- l’intégrité référentielle entre les tables ;
- la cohérence des quantités et des montants ;
- le rapprochement des agrégats calculés avec Pandas et SQLite.

### 2. Analyse — SQL / SQLite

Les requêtes SQL produisent des analyses agrégées sur les ventes et les stocks : volumes, chiffre d’affaires, marge, tendances et niveaux de stock.

### 3. Modélisation et visualisation — Power BI / DAX

Le modèle s’appuie sur deux tables de faits distinctes (ventes et stocks) reliées à des dimensions communes, notamment date, produit et site. Le rapport Power BI permet d’explorer les indicateurs commerciaux et les niveaux de stock.

## Indicateurs suivis

- Chiffre d’affaires et quantités vendues
- Marge brute
- Évolution des ventes dans le temps
- Performance par produit, catégorie et site
- Stock disponible et détection des références à stock nul

**Point d’attention :** le stock est interprété à partir des données disponibles et de leur date de référence. Il ne doit pas être assimilé à un stock temps réel si les données sources ne sont pas actualisées en continu.


## Environnement

- Python, Pandas
- SQL, SQLite
- Power BI, DAX

## Limites et pistes d’amélioration

- Les données étant synthétiques, les résultats n’ont pas de portée opérationnelle réelle.
- L’analyse du stock dépend de la granularité et des dates présentes dans les données sources.
- Des évolutions possibles : automatiser l’actualisation, enrichir les contrôles de qualité, documenter davantage les règles de gestion et ajouter des tests.

## Auteur

**Thierry Muhoza**  
[LinkedIn](https://linkedin.com/in/muhoza-banyangiriki) · [GitHub](https://github.com/thierry-mhz/Projet_Portfolio_Sales_Stocks)
