# Using DBT to Generate Analytical Data

### Install DBT

```
pip install \
  dbt-core \
  dbt-postgres \
  dbt-redshift \
  dbt-snowflake \
  dbt-bigquery
```

### Clone demo project

```
git clone https://github.com/jing-s-zhong/Big-Data-Solution-6-DBT-Analytical-Data-Population.git
cd Big-Data-Solution-6-DBT-Analytical-Data-Population
cd dbt_demo
```

### Configure snowflake connector
customize the profiles.yml located in ~/.dbt/ directory
```
# example profiles.yml file
<project_nane>:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: <snowflake_account>        # abc&xyz.ca-central-1.aws
      client_session_keep_alive: false
      database:                           # database name 
      password: <snowflake_user_pw>
      query_tag: DEMO
      role: <role_name>                   # SYSADMIN or user other defined role
      schema: <db_schema_name>            # schemma under the conntectd db
      threads: <concurrency>              # 4
      user: <snowflake_user_name>
      warehouse: <warehouse_name>         # COMPUTE_WH
```


### Compile, Run or Test the project

```
dbt compile
dbt run
dbt test
```
