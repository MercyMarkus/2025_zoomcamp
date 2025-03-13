# Batch Processing with Spark

## DuckDB Commands To Read Parquet Files

| Command | Description |
|---------|-------------|
| `SELECT * FROM READ_PARQUET('C:\Users\nsuser\dev\sample_files\userdata1.parquet') limit 3;` | Read parquet data using SQL queries |
| `DESCRIBE SELECT * FROM READ_PARQUET('C:\Users\nsuser\dev\sample_files\userdata1.parquet');` | Read Parquet Schema |
| `SELECT * FROM PARQUET_SCHEMA('C:\Users\nsuser\dev\sample_files\userdata1.parquet');` | Read Parquet Schema |
| `SELECT row_group_id, row_group_num_rows, compression, stats_min, stats_max, stats_null_count FROM PARQUET_METADATA('C:\Users\nsuser\dev\sample_files\userdata1.parquet');` | Read Parquet metadata and statistics |

## Parquet CLI Commands

```sh
pip install parquet-cli          //installs via pip
parq filename.parquet            //view meta data
parq filename.parquet --schema   //view the schema
parq filename.parquet --head 10 
```
