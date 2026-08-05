--- LOAD DATA WAREHOUSE ---

DROP TABLE IF EXISTS dim_date;
DROP TABLE IF EXISTS dim_location;
DROP TABLE IF EXISTS dim_service;
DROP TABLE IF EXISTS dim_customer;
DROP TABLE IF EXISTS fact_customer_transactions;

CREATE TABLE dim_date (
    sk_date INT NOT NULL,
    bk_date VARCHAR(50) NOT NULL,
    Date DATE NOT NULL,
    DayofMonth INT NOT NULL,
    Month_num INT NOT NULL,
    Month_txt VARCHAR(50),
    Quarter_num INT NOT NULL,
    Quarter_txt VARCHAR(10) NOT NULL,
    Year INT NOT NULL,
    Weekday_num INT NOT NULL,
    Weekday_txt VARCHAR(50),
    Weekend VARCHAR(50)
);

CREATE TABLE dim_location (
    sk_location INT NOT NULL,
    bk_location VARCHAR(64) NOT NULL,
    City VARCHAR(100),
    ZipCode VARCHAR(20),
    Latitude DECIMAL(9,6),
    Longitude DECIMAL(9,6),
    Population INT,
);

CREATE TABLE dim_service (
    sk_service INT NOT NULL,
    bk_service VARCHAR(64) NOT NULL,
    InternetService VARCHAR(50),
    InternetType VARCHAR(50)
);

CREATE TABLE dim_customer (
    sk_customer INT NOT NULL,
    fk_location VARCHAR(50) NOT NULL,
    fk_service VARCHAR(10) NOT NULL,
    bk_customer VARCHAR(64) NOT NULL,
    Gender VARCHAR(20),
    Age INT,
    Married VARCHAR(10),
    Under30 VARCHAR(10),
    SeniorCitizen VARCHAR(10),
    Dependents VARCHAR(10),
    NumberofDependents INT,
    CLTV INT,
    Offer VARCHAR(15),
    PaymentMethod VARCHAR(50),
    PaperlessBilling VARCHAR(10),
    Contract VARCHAR(50),
    ReferredaFriend VARCHAR(10),
    NumberofReferrals INT,
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(10),
    OnlineSecurity VARCHAR(10),
    OnlineBackup VARCHAR(10),
    DeviceProtectionPlan VARCHAR(10),
    PremiumTechSupport VARCHAR(10),
    StreamingTV VARCHAR(10),
    StreamingMovies VARCHAR(10),
    StreamingMusic VARCHAR(10),
    UnlimitedData VARCHAR(10)
);

CREATE TABLE fact_customer_transactions (
    fk_date VARCHAR(64) NOT NULL,
    fk_customer VARCHAR(64) NOT NULL,
    MonthlyCharge DECIMAL(18,2),
    TenureMonths INT,
    Status VARCHAR(50),
    ChurnCategory VARCHAR(50),
    ChurnReason VARCHAR (150),
);