-- https://www.cloudera.com/documentation/enterprise/5-13-x/topics/impala_create_table.html
-- https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL
SET hivevar:DATABASE=default;
SET hivevar:OLD_TABLE=employeesXY;
SET hivevar:NEW_TABLE=emp_parquetXY;

DROP TABLE IF EXISTS ${DATABASE}.${NEW_TABLE};
CREATE TABLE IF NOT EXISTS ${DATABASE}.${NEW_TABLE} (
    emp_no int,
    birth_date date, -- Check format is YYYY-MM-DD
    first_name string,
    last_name string,
    gender string,
    hire_date date -- Check format is YYYY-MM-DD
) 
COMMENT 'employee table parquet'
PARTITIONED BY(hire_year int)
STORED AS parquet;

SET hive.exec.dynamic.partition.mode=nonstrict;

INSERT OVERWRITE TABLE ${DATABASE}.${NEW_TABLE} PARTITION(hire_year) 
SELECT 
    emp_no,
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date,
    year(hire_date) as hire_year
FROM ${DATABASE}.${OLD_TABLE};

SELECT COUNT(*) FROM ${DATABASE}.${NEW_TABLE};