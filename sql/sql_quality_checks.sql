--- QUALITY CHECKS ---

--- Integrity of foreign key of Dim Customer on Fact Customer Transactions ---
INSERT INTO STG_Telco_Silver_Layer.dbo.log_quality_checks_churn                

SELECT 

    'stg_fact_customer_transactions'                                           AS ETL_TABLE,

    'check parent of FK for Customer dimension'                             AS ETL_CHECKTYPE,

    'number of rows without parent key: ' + CAST(MAX(row_count) AS VARCHAR) AS DESCRIPTION_RESULT,

    CASE 

        WHEN MAX(row_count) > 0 THEN 'FAILED' ELSE 'OK'

    END                                                             AS ETL_RESULT

FROM 

    (

    SELECT COUNT(*) AS row_count

    FROM stg_fact_customer_transactions

    LEFT JOIN stg_dim_customer ON stg_fact_customer_transactions.fk_customer = stg_dim_customer.bk_customer

    WHERE stg_dim_customer.bk_customer IS NULL

    ) q;

--- Integrity of foreign key of Dim Service on Dim Customer ---

INSERT INTO STG_Telco_Silver_Layer.dbo.log_quality_checks_churn                

SELECT 

    'stg_dim_customer'                                                      AS ETL_TABLE,

    'check parent of FK for Service dimension'                              AS ETL_CHECKTYPE,

    'number of rows without parent key: ' + CAST(MAX(row_count) AS VARCHAR) AS DESCRIPTION_RESULT,

    CASE 

        WHEN MAX(row_count) > 0 THEN 'FAILED' ELSE 'OK'

    END                                                             AS ETL_RESULT

FROM 

    (

    SELECT COUNT(*) AS row_count

    FROM stg_dim_customer

    LEFT JOIN stg_dim_service ON stg_dim_customer.fk_service = stg_dim_service.bk_service

    WHERE stg_dim_service.bk_service IS NULL

    ) q;

--- Integrity of foreign key of Dim Location on Dim Customer ---

INSERT INTO STG_Telco_Silver_Layer.dbo.log_quality_checks_churn                

SELECT 

    'stg_dim_customer'                                                      AS ETL_TABLE,

    'check parent of FK for Location dimension'                             AS ETL_CHECKTYPE,

    'number of rows without parent key: ' + CAST(MAX(row_count) AS VARCHAR) AS DESCRIPTION_RESULT,

    CASE 

        WHEN MAX(row_count) > 0 THEN 'FAILED' ELSE 'OK'

    END                                                             AS ETL_RESULT

FROM 

    (

    SELECT COUNT(*) AS row_count

    FROM stg_dim_customer

    LEFT JOIN stg_dim_location ON stg_dim_customer.fk_location = stg_dim_location.bk_location

    WHERE stg_dim_location.bk_location IS NULL

    ) q;

--- Positive value in billing fields ---

INSERT INTO STG_Telco_Silver_Layer.dbo.log_quality_checks_churn               
SELECT 
    'stg_fact_customer_transactions'                                           AS ETL_TABLE,
    'check existence of non positive value in billing field'                   AS ETL_CHECKTYPE,
    'number of rows without positive value: ' + CAST(MAX(row_count) AS VARCHAR) AS DESCRIPTION_RESULT,
    CASE 
        WHEN MAX(row_count) > 0 THEN 'FAILED' ELSE 'OK'
    END                                                             AS ETL_RESULT
FROM 
    (
    SELECT COUNT(*) AS row_count
    FROM stg_fact_customer_transactions
    WHERE MonthlyCharge <= 0
    ) q;