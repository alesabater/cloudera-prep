-- https://www.cloudera.com/documentation/enterprise/5-13-x/topics/impala_create_table.html
-- https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL
SET hivevar:DATABASE=;
SET hivevar:OLD_TABLE=;
SET hivevar:NEW_TABLE=;

DROP TABLE IF EXISTS ${DATABASE}.${NEW_TABLE};
CREATE TABLE IF NOT EXISTS ${DATABASE}.${NEW_TABLE} (
    
) 
COMMENT 'employee table parquet'
PARTITIONED BY()
STORED AS ;

SET hive.exec.dynamic.partition.mode=nonstrict;

INSERT OVERWRITE TABLE ${DATABASE}.${NEW_TABLE} PARTITION() 
SELECT 
   -- Columns to select
FROM ${DATABASE}.${OLD_TABLE};

SELECT COUNT(*) FROM ${DATABASE}.${NEW_TABLE};
-- Result should equal 30021