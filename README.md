# Sales & Inventory Analytics

### End-to-end Business Intelligence portfolio project

[![Python](https://img.shields.io/badge/Python-Pandas-3776AB?logo=python&logoColor=white)](https://www.python.org/)
[![SQL](https://img.shields.io/badge/SQL-SQLite-003B57?logo=sqlite&logoColor=white)](https://www.sqlite.org/)
[![Power BI](https://img.shields.io/badge/Power%20BI-DAX-F2C811?logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)

An end-to-end analytics project combining data quality checks with **Python**, business analysis with **SQL**, and interactive reporting with **Power BI**.

> **Data scope:** All data is synthetic and for demonstration only. The reported figures do not represent the performance of a real company.

## Project overview

The analysis explores:

- Revenue, units sold and gross margin over time.
- Performance by product, category and site.
- Stock levels at the latest available date and product-site pairs with zero stock.
- Reconciliation of key totals between Python and SQLite.

## Dashboard preview

### Commercial performance

![Commercial performance dashboard](Screenshots/Performance%20Commerciale.png)

### Inventory monitoring

![Inventory monitoring dashboard](Screenshots/Pilotage%20des%20stocks.png)

Open the [Power BI report](powerbi/Sales%20%26%20Inventory%20Analytics.pbix) in Power BI Desktop or view its [PDF export](powerbi/Sales%20%26%20Inventory%20Analytics%20pdf.pdf).

## Key outputs

| Metric | Result |
|---|---:|
| Revenue | €1,467,589.34 |
| Gross margin | €490,454.34 |
| Gross margin rate | 33.4% |
| Sales records | 6,000 |
| Stock records | 26,316 |
| Analysis period | January 2024 – December 2025 |

These values are calculated from the synthetic dataset. Gross margin rate is gross margin divided by revenue.

## Workflow

### Python — data validation and outputs

[`python/analyse.py`](python/analyse.py) loads the CSV files from [`data/`](data/), checks record uniqueness, referential integrity, quantity constraints and revenue arithmetic, then reconciles total revenue between pandas and SQLite. It generates:

- [`results/monthly_revenue.csv`](results/monthly_revenue.csv)
- [`results/validation_summary.csv`](results/validation_summary.csv)

### SQL — business analysis

[`sql/analyses.sql`](sql/analyses.sql) contains ten queries covering sales totals and trends, results by site and product, gross margin by category, rankings, cumulative revenue, and latest-date stock and out-of-stock counts.

### Power BI — modeling and reporting

The report separates sales and inventory into two fact tables linked to shared date, product and site dimensions. The expected grains are:

| Table | Grain |
|---|---|
| `fact_sales` | One row per sales line |
| `fact_stock` | One row per date, product and site |
| `dim_date` | One row per date |
| `dim_product` | One row per product |
| `dim_site` | One row per site |

Reference measures are available in [`powerbi/mesures.dax`](powerbi/mesures.dax). Stock is a snapshot: do not sum it across dates. The latest-stock measures use the latest date in the current date-filter context.

## Repository structure

```text
.
├── data/                 # Synthetic CSV source data
├── python/
│   └── analyse.py        # Validation and output generation
├── sql/
│   └── analyses.sql      # Business analysis queries
├── powerbi/
│   ├── Sales & Inventory Analytics.pbix
│   ├── Sales & Inventory Analytics pdf.pdf
│   └── mesures.dax
├── Screenshots/          # Dashboard previews
├── results/              # CSV outputs
├── requirements.txt
└── README.md
```


## Assumptions and limitations

- The dataset is synthetic; results are illustrative, not operational KPIs.
- Inventory is based on snapshots, not a real-time stock feed.
- Sales and inventory are generated independently; the analysis does not establish a causal relationship between them.
- The SQL latest-stock query uses the latest date across the full dataset. A per-site latest-date rule may be more appropriate if snapshot dates differ by site.
- Automated tests, scheduled refresh and production deployment are not included.

## Author

**Thierry Muhoza**  
Business Data Analyst | Business Intelligence & Performance Analytics

[LinkedIn](https://linkedin.com/in/muhoza-banyangiriki) · [GitHub](https://github.com/thierry-mhz)
