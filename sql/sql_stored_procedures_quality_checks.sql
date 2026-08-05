--- STORED PROCEDURES ---

--- Procedure Integrity of BK --- 

DROP PROCEDURE IF EXISTS Procedure_BKIntegrity;
GO

CREATE PROCEDURE Procedure_BKIntegrity
    @table_name NVARCHAR(128),
    @bk_column NVARCHAR(128)
AS
BEGIN
    SET NOCOUNT ON;

    -- Declare variables to store dynamic SQL and results
    DECLARE @sql NVARCHAR(MAX);
    DECLARE @params NVARCHAR(MAX);
    DECLARE @result_count INT;

    -- Correctly set up the dynamic SQL
    SET @sql = N'
        SELECT @result_count_OUT = COUNT(*)
        FROM (
            SELECT COUNT(*) AS row_count
            FROM ' + QUOTENAME(@table_name) + '
            GROUP BY ' + QUOTENAME(@bk_column) + '
            HAVING COUNT(*) > 1
        ) AS q';

    -- Define parameter definition for sp_executesql
    SET @params = N'@result_count_OUT INT OUTPUT';

    -- Execute the dynamic SQL
    EXEC sp_executesql @sql, @params, @result_count_OUT = @result_count OUTPUT;

    -- Ensure the description string is within the allowable size for the column
    DECLARE @description_result NVARCHAR(255);
    SET @description_result = 'number of rows with repeated BK: ' + CAST(@result_count AS NVARCHAR(255));

    -- Add values to the log table, ensuring data does not exceed column size
    INSERT INTO [STG_Telco_Silver_Layer].[dbo].log_quality_checks_churn (
        etl_table, etl_checktype, description_result, etl_result)
    VALUES ( 
        @table_name, 
        'check integrity of BK', 
        LEFT(@description_result, 255),
        CASE WHEN @result_count > 0 THEN 'FAILED' ELSE 'OK' END
    );
END;

--- Procedure Uniqueness of dimension attributes ---

DROP PROCEDURE IF EXISTS Procedure_UniquenessDimAttributes;
GO

CREATE PROCEDURE Procedure_UniquenessDimAttributes
    @table_name NVARCHAR(128),
    @columns NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    -- Declare variables to store dynamic SQL and results
    DECLARE @sql NVARCHAR(MAX);
    DECLARE @params NVARCHAR(MAX);
    DECLARE @result_count INT;

    -- Correctly set up the dynamic SQL
    SET @sql = N'
        SELECT @result_count_OUT = COUNT(*)
        FROM (
            SELECT COUNT(*) AS row_count
            FROM ' + QUOTENAME(@table_name) + '
            GROUP BY ' + @columns + '
            HAVING COUNT(*) > 1
        ) AS q';

    -- Define parameter definition for sp_executesql
    SET @params = N'@result_count_OUT INT OUTPUT';

    -- Execute the dynamic SQL
    EXEC sp_executesql @sql, @params, @result_count_OUT = @result_count OUTPUT;

    -- Ensure the description string is within the allowable size for the column
    DECLARE @description_result NVARCHAR(255); 
    SET @description_result = 'number of rows NOT unique: ' + CAST(@result_count AS NVARCHAR(255));

    -- Add values to the log table, ensuring data does not exceed column size
    INSERT INTO [STG_Telco_Silver_Layer].[dbo].log_quality_checks_churn (
        etl_table, etl_checktype, description_result, etl_result)
    VALUES ( 
        @table_name, 
        'check uniqueness of all dim attributes', 
        LEFT(@description_result, 255),
        CASE WHEN @result_count > 0 THEN 'FAILED' ELSE 'OK' END
    );
END;