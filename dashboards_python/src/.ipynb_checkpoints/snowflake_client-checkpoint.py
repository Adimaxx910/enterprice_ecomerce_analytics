from sqlalchemy import create_engine
import os

def get_engine():
    engine = create_engine(
        "snowflake://{user}:{password}@{account}/{database}/{schema}"
        "?warehouse={warehouse}&role={role}".format(
            user=os.getenv("SNOWFLAKE_USER"),
            password=os.getenv("SNOWFLAKE_PASSWORD"),
            account=os.getenv("SNOWFLAKE_ACCOUNT"),
            database="OLIST_ANALYTICS",
            schema="KPI",
            warehouse="KPI_WH",
            role=os.getenv("SNOWFLAKE_ROLE")
        )
    )
    return engine
