-- 01_totaux
SELECT ROUND(SUM(net_revenue),2) AS revenue, SUM(quantity) AS units FROM fact_sales;

-- 02_ca_mensuel
SELECT substr(date,1,7) AS month, ROUND(SUM(net_revenue),2) AS revenue FROM fact_sales GROUP BY month ORDER BY month;

-- 03_ca_site
SELECT d.site_name, ROUND(SUM(s.net_revenue),2) AS revenue FROM fact_sales s JOIN dim_site d USING(site_id) GROUP BY d.site_name;

-- 04_marge_categorie
SELECT p.category, ROUND(SUM(s.net_revenue-s.total_cost),2) AS margin FROM fact_sales s JOIN dim_product p USING(product_id) GROUP BY p.category;

-- 05_top_produits
SELECT p.product_name, ROUND(SUM(s.net_revenue),2) AS revenue FROM fact_sales s JOIN dim_product p USING(product_id) GROUP BY p.product_name ORDER BY revenue DESC LIMIT 5;

-- 06_evolution_mensuelle
WITH m AS (SELECT substr(date,1,7) AS month, SUM(net_revenue) AS revenue FROM fact_sales GROUP BY month) SELECT month, revenue, LAG(revenue) OVER(ORDER BY month) AS previous_month FROM m;

-- 07_classement_par_site
WITH x AS (SELECT site_id,product_id,SUM(net_revenue) AS revenue FROM fact_sales GROUP BY site_id,product_id) SELECT *,DENSE_RANK() OVER(PARTITION BY site_id ORDER BY revenue DESC) AS rank_site FROM x;

-- 08_cumul_mensuel
WITH m AS (SELECT substr(date,1,7) AS month,SUM(net_revenue) AS revenue FROM fact_sales GROUP BY month) SELECT *,SUM(revenue) OVER(ORDER BY month ROWS UNBOUNDED PRECEDING) AS cumulative_revenue FROM m;

-- 09_stock_derniere_date
SELECT site_id,SUM(stock_qty) AS stock FROM fact_stock WHERE date=(SELECT MAX(date) FROM fact_stock) GROUP BY site_id;

-- 10_rupture_derniere_date
SELECT site_id, SUM(CASE WHEN stock_qty=0 THEN 1 ELSE 0 END) AS out_of_stock, COUNT(*) AS product_count FROM fact_stock WHERE date=(SELECT MAX(date) FROM fact_stock) GROUP BY site_id;