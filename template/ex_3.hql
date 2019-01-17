-- https://www.cloudera.com/documentation/enterprise/5-13-x/topics/impala_create_table.html
-- https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL
SET hivevar:DATABASE=;
SET hivevar:TABLE=;
SET hivevar:TABLE_LOCATION=;

CREATE EXTERNAL TABLE IF NOT EXISTS ${DATABASE}.${TABLE} (
    -- Column definition here in the form
    -- column_name data_type,
    -- column_name data_type,
)
COMMENT 'Comments or description'
ROW FORMAT DELIMITED FIELDS TERMINATED BY <delimiter>
STORED AS <file_format>
LOCATION <table_location>;

SELECT COUNT(*) FROM ${DATABASE}.${TABLE};
-- Result should equal 300021


-- Connect to beeline
beeline
!connect jdbc:hive2://localhost:10000




