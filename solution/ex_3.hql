-- https://www.cloudera.com/documentation/enterprise/5-13-x/topics/impala_create_table.html
-- https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL
SET hivevar:DATABASE=default;
SET hivevar:TABLE=employeesXY;
SET hivevar:TABLE_LOCATION=/user/usernamexy/employeesXY;

DROP TABLE IF EXISTS ${DATABASE}.${TABLE};
CREATE EXTERNAL TABLE IF NOT EXISTS ${DATABASE}.${TABLE} (
    emp_no int,
    birth_date date, -- Check format is YYYY-MM-DD
    first_name string,
    last_name string,
    gender string,
    hire_date date -- Check format is YYYY-MM-DD
)
COMMENT 'employee table'
ROW FORMAT DELIMITED FIELDS TERMINATED BY '##'
STORED AS textfile
LOCATION '${TABLE_LOCATION}';

SELECT COUNT(*) FROM ${DATABASE}.${TABLE};
+--------+
|  _c0   |
+--------+  
| 30021  |
+--------+

beeline
!connect jdbc:hive2://localhost:10000




