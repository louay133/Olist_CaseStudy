import pandas as pd
from sqlalchemy import create_engine
import os

engine = create_engine(
    "mssql+pyodbc://LOAY\\SQLEXPRESS/Olist_Ecommerce?driver=ODBC+Driver+17+for+SQL+Server"
)

folder_path = r"C:\Users\Loay Tarek\Desktop\Olist_Project"

files = {
    'olist_orders_dataset.csv': 'orders',
    'olist_order_items_dataset.csv': 'order_items',
    'olist_customers_dataset.csv': 'customers',
    'olist_products_dataset.csv': 'products',
    'olist_sellers_dataset.csv': 'sellers',
    'olist_order_payments_dataset.csv': 'payments',
    'olist_order_reviews_dataset.csv': 'reviews',
    'olist_geolocation_dataset.csv': 'geolocation',
    'product_category_name_translation.csv': 'category_translation'
}

for file_name, table_name in files.items():
    file_path = os.path.join(folder_path, file_name)
    print(f"Loading {file_name} → {table_name}")
    try:
        df = pd.read_csv(file_path)
        df.to_sql(table_name, con=engine, if_exists='replace', index=False)
        print(f"{table_name} done ({len(df)} rows)")
    except Exception as e:
        print(f"Error loading {file_name}: {e}")

print("All CSVs imported successfully!")
