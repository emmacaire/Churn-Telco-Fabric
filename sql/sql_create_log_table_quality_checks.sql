--- CREATE QUALITY CHECKS TABLE ---

DROP TABLE IF EXISTS log_quality_checks_churn;  

CREATE TABLE  log_quality_checks_churn(
    etl_table           VARCHAR(100)    NOT NULL,
    etl_checktype       VARCHAR(150)    NOT NULL,
    description_result  VARCHAR(150)    NOT NULL,
    etl_result          VARCHAR(20)     NOT NULL
    );