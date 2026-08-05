# Telco Customer Churn
**Source Data:** Kaggle (https://www.kaggle.com/datasets/abdallahwagih/telco-customer-churn)

## 📌 Summary
With this project I developed a realistic Business Intelligence workflow from enterprise data collection to the delivery of a Power BI report and data-driven future prescriptive actions. Data involved customer transactions as contract renewal, new contract or end of contract. In case of churn, additional data on the reason why the customer interrupted the contract was collected.

Python was used early in the project to manipulate the data and allow for a proper date dimension, other than for quick data cleaning and checks.
Afterwards the manipulated source data was loaded in Fabric, first in a Staging Area, then in the proper Data Warehouse, after complying with quality checks performed in a pipeline through scripts and stored procedures. There was extensive use of dataflows and pipelines during these stages, other than the SQL scripts to load the final dimensional model.
Once the clean data was loaded in the warehouse, a Snowflake schema was created in the semantic model and the most relevant insights were presented in a 5-dashboard report. 

A more detailed description of the project phases follows in the Project Details section.

## 📊 Key Deliverables & Artifacts
* 📂 **[Interactive Power BI report](add download link......................):** [🚀 Click Here to Launch Interactive Dashboard](https://app.powerbi.com/view?r=YOUR_PUBLISH_TO_WEB_LINK)
* 📄 **[Fabric scripts](./report/data_dictionary_gaming.pdf):** A set of scripts and tools to perform the ETL process in Microsoft Fabric. Since the workspace is not accessible, the list of scripts is available below
  - IPYNB Python notebook for data manipulation
  - SQL scripts for loading staging area warehouse and data warehouse
  - SQL scripts for loading the quality checks table and relative stored procedures
  - TXT files with M language dataflows in the ETL phase to load dimensions and facts
  - JSON files with the pipeline commands


![Dashboard Preview](./assets/dashboard-demo.gif)

## 🛠️ Tech Stack & Methodology
* **Softwares and platforms:**
  - MS Fabric (lakehouse, warehouse, dataflows, pipelines),
  - Power BI (semantic model, Snowflake schema, DAX, report),
  - Python (notebook for data manipulation and data cleaning)

* **Visualization tools:**  bar charts, donut charts, decomposition trees, multi-level cards, KPIs, slicers, interactive maps, scatter plots, navigation buttons, custom tooltips.

<img width="1452" height="816" alt="RP_pg1" src="https://github.com/user-attachments/assets/90af4680-2dc9-45d0-8d8d-7e967279232a" />

<img width="1455" height="820" alt="RP_pg4" src="https://github.com/user-attachments/assets/fba39242-e86a-444b-b8a6-ba7247f9de7b" />


## 📋 Project Details

**Phase 1: Source Data selection**
...

**Phase 2: Source Data manipulation in Python**
  The source data was rich in variables and categories that would allow to build a solid dimensional model, but presented a fundamental limitation, referring only to Q3 in 2025 with no exact date. For this reason a quick Python manipulation to add a allowed for a time dimension to be added

**Phase 3: Loading the Source Data in Fabric (Bronze Layer)**

**Phase 4: ETL in Fabric (Silver Layer)**

<img width="1566" height="335" alt="PL_load_staging_area" src="https://github.com/user-attachments/assets/67ac9cd7-9145-4ed6-96ac-e5e11d178da3" />

<img width="587" height="542" alt="PL_log_quality_checks" src="https://github.com/user-attachments/assets/5d16bdd1-6deb-4862-b070-c023454d67e4" />

**Phase 5: Loading the Data Warehouse in Fabric (Gold Layer)**

<img width="1497" height="411" alt="PL_load_data_warehouse" src="https://github.com/user-attachments/assets/44d6f33e-538b-46a2-bab9-1ac70d353b47" />


**Phase 6: Creating the relational model in Power BI**

**Phase 7: Creating additional measures (DAX)**

**Phase 8: Selecting key insights and creating the report**

**Phase 9: Summarizing prescriptive actions**

Full report preview>

<img width="1452" height="816" alt="RP_pg1" src="https://github.com/user-attachments/assets/6ee70fec-c04c-4c7b-b2de-62c74e736246" />

<img width="1312" height="737" alt="RP_pg2" src="https://github.com/user-attachments/assets/d47466fd-6867-4eeb-98aa-db6b7d00454e" />

<img width="1312" height="732" alt="RP_pg3" src="https://github.com/user-attachments/assets/e994492c-f91b-4367-85af-24a6db45f0f4" />

<img width="1455" height="820" alt="RP_pg4" src="https://github.com/user-attachments/assets/e896e3fd-0e3e-41fa-aa09-bb1fd3d773ec" />

<img width="1312" height="736" alt="RP_pg5" src="https://github.com/user-attachments/assets/0c8da78e-3cc8-4601-a989-620749cf0a41" />

