# E-commerce Data Transformation Project with dbt

A hands-on **dbt project** built using an e-commerce dataset to learn and demonstrate how modern data transformation pipelines are designed.

The project follows a layered architecture similar to what is commonly used in data engineering projects, with separate layers for **staging, transformation, and analytics**.

## Project Architecture

```text
Raw CSV Data
     │
     ▼
   Seeds
     │
     ▼
┌─────────────────────┐
│     Staging         │
│  Clean & standardize│
└─────────────────────┘
     │
     ▼
┌─────────────────────┐
│    Intermediate     │
│  Join & transform   │
└─────────────────────┘
     │
     ▼
┌─────────────────────┐
│       Marts         │
│ Facts & Dimensions  │
└─────────────────────┘
     │
     ▼
 Analytics / BI
```
<img width="656" height="266" alt="image" src="https://github.com/user-attachments/assets/1afc6871-e440-42c4-b510-f1a26012886e" />

## Layers

### 1. Seeds

The project starts with raw e-commerce CSV files:

* Customers
* Products
* Orders
* Order Items
* Payments

Seeds are used to simulate raw data coming from an external source system.

### 2. Staging

The staging layer performs basic transformations such as:

* Renaming and standardizing columns
* Data type conversion
* Lowercasing values
* Creating useful date fields
* Basic data cleaning

Example:

```text
raw_orders
     ↓
stg_orders
```

The staging layer keeps the data close to the original source while making it easier and safer to use downstream.

### 3. Intermediate

The intermediate layer contains reusable business transformations.

For example:

```text
stg_order_items + stg_products
              ↓
       int_order_items
```

This layer is used for operations such as joins and enrichment before the data reaches the final analytics models.

### 4. Marts

The marts layer contains analytics-ready tables.

The project currently contains:

```text
dim_customers
dim_products

fct_orders
fct_order_items
```

This structure follows a simple **star-schema approach**.


## Data Quality

dbt tests are used to validate the data.

Examples include:

* `not_null`
* `unique`


## Project Structure

```text
dbt_ecom/
│
├── models/
│   ├── staging/
│   │   └── ecommerce/
│   │       ├── stg_customers.sql
│   │       ├── stg_products.sql
│   │       ├── stg_orders.sql
│   │       ├── stg_order_items.sql
│   │       ├── stg_payments.sql
│   │       └── stg_ecommerce.yml
│   │
│   ├── intermediate/
│   │   ├── int_order_items.sql
│   │   └── int_customer_orders.sql
│   │
│   └── marts/
│       └── ecommerce/
│           ├── dim_customers.sql
│           ├── dim_products.sql
│           ├── fct_orders.sql
│           ├── fct_order_items.sql
│           └── fct_orders_incremental.sql
│
├── seeds/
│   └── ecommerce/
│       ├── raw_customers.csv
│       ├── raw_products.csv
│       ├── raw_orders.csv
│       ├── raw_order_items.csv
│       └── raw_payments.csv
│
├── tests/
├── macros/
├── snapshots/
└── dbt_project.yml
```

## What I am Learning Through This Project

This project is mainly focused on understanding the fundamentals of dbt and how it fits into a modern data engineering workflow.

Key concepts covered so far:

* dbt project structure
* Staging and transformation layers
* Fact and dimension modeling
* Data grain
* `ref()`
* Model dependencies and lineage
* Data quality testing
* Incremental models
* `is_incremental()`
* Unique keys
* MERGE / upsert
* `updated_at` based change detection
* dbt documentation
* `dbt run`
* `dbt build`
* Model selection

The project will continue to evolve as I learn more about production-oriented dbt practices.
