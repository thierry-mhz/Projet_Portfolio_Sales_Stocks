from pathlib import Path
import sqlite3
import pandas as pd
BASE = Path(__file__).resolve().parents[1]
frames = {p.stem: pd.read_csv(p) for p in (BASE / "data").glob("*.csv")}
sales = frames["fact_sales"]
stock = frames["fact_stock"]
assert sales.sale_line_id.is_unique
assert not stock.duplicated(["date", "product_id", "site_id"]).any()
for name in ["fact_sales", "fact_stock"]:
    for key, dim in [("product_id", "dim_product"), ("site_id", "dim_site"), ("date", "dim_date")]:
        assert frames[name][key].isin(frames[dim][key]).all(), (name, key)
assert (sales.quantity > 0).all() and (stock.stock_qty >= 0).all()
assert ((sales.quantity * sales.unit_price - sales.net_revenue).abs() < 0.011).all()
connection = sqlite3.connect(":memory:")
for name, frame in frames.items():
    frame.to_sql(name, connection, index=False)
sql_total = connection.execute("SELECT SUM(net_revenue) FROM fact_sales").fetchone()[0]
assert abs(sql_total - sales.net_revenue.sum()) < 0.01
monthly = sales.assign(month=sales.date.str[:7]).groupby("month", as_index=False).agg(revenue=("net_revenue", "sum"), units=("quantity", "sum"))
result = BASE / "results"
result.mkdir(exist_ok=True)
monthly.to_csv(result / "monthly_revenue.csv", index=False)
summary = pd.DataFrame({"metric": ["revenue", "gross_margin", "sales_rows", "stock_rows"], "value": [sales.net_revenue.sum(), (sales.net_revenue-sales.total_cost).sum(), len(sales), len(stock)]})
summary.to_csv(result / "validation_summary.csv", index=False)
print("Contrôles réussis. Résultats enregistrés dans results/.")
