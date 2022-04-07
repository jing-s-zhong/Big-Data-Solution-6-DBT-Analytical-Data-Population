{% macro generate_data_date() %}

{% set sql %}
    CREATE OR REPLACE TRANSIENT TABLE DIM_DATE 
    (
    DATA_DATE         DATE        NOT NULL
    ,YEAR             SMALLINT    NOT NULL
    ,MONTH            SMALLINT    NOT NULL
    ,MONTH_NAME       CHAR(3)     NOT NULL
    ,DAY_OF_MON       SMALLINT    NOT NULL
    ,DAY_OF_WEEK      VARCHAR(9)  NOT NULL
    ,WEEK_OF_YEAR     SMALLINT    NOT NULL
    ,DAY_OF_YEAR      SMALLINT    NOT NULL
    )
    AS
    WITH CTE_MY_DATE AS (
        SELECT DATEADD(DAY, SEQ4(), '2022-01-01') AS DATA_DATE
        FROM TABLE(GENERATOR(ROWCOUNT=>365))
    )
    SELECT DATA_DATE
        ,YEAR(DATA_DATE)
        ,MONTH(DATA_DATE)
        ,MONTHNAME(DATA_DATE)
        ,DAY(DATA_DATE)DATA_DATE
        ,DAYOFWEEK(DATA_DATE)
        ,WEEKOFYEAR(DATA_DATE)
        ,DAYOFYEAR(DATA_DATE)
    FROM CTE_MY_DATE
{% endset %}

{% do run_query(sql) %}

{% endmacro %}
