from airflow import DAG
from airflow.operators.empty import EmptyOperator
from airflow_dbt_python.operators.dbt import (
    DbtDebugOperator,
    DbtRunOperator,
)
from datetime import datetime, timedelta
default_args = {
    'owner': 'airflow',
    'start_date': datetime(2025, 7, 15),
    'retries': 1,
    'retry_delay': timedelta(minutes=1)
}

with DAG(
    'staging',
    default_args=default_args,
    schedule_interval=None,
    catchup=False,
    tags=["dbt", "bigquery"]
) as dag:

    start = EmptyOperator(task_id='start')

    dbt_debug = DbtDebugOperator(
        task_id='dbt_debug',
        project_dir='/home/airflow/gcs/data/im_data_pipeline/',
        profiles_dir='/home/airflow/gcs/data/im_data_pipeline/profiles'
    )

    dbt_run = DbtRunOperator(
        task_id='dbt_run',
        project_dir='/home/airflow/gcs/data/im_data_pipeline/',
        profiles_dir='/home/airflow/gcs/data/im_data_pipeline/profiles',
        select=["path:models/staging" ]
    )

    end = EmptyOperator(task_id='end')

    start >> dbt_debug >> dbt_run >> end

