# NOVA SQL Database
## Project Overview
This project implements a complete SQL-based relational database system for managing a pharmaceutical company, NOVA's operations. It is designed as part of an academic database project and simulates the real-world functioning of:

Pharmacies

Pharmaceutical companies

Doctors

Patients

Drugs

Contracts

Prescriptions

The database includes table creation, triggers for enforcing business logic, stored procedures for all operations, and report generation functionality.
## Key Features
- Fully normalized relational schema (up to 3NF)
- Realistic foreign key constraints with selective ON DELETE CASCADE
- Triggers to enforce that no operations happen before a pharmacy sells at least 10 drugs
- Stored procedures for:

  - Adding, deleting, updating records

  - Generating reports (prescriptions, drug lists, stock status)

  - Enforcing business rules
# Technologies Used
- SQL (Oracle/MySQL compatible)

- PL/SQL for stored procedures and triggers

- Git & GitHub for version control

## Execution Order

Run the following scripts in sequence:

1. Tables/1_Create_Tables.sql  
2. Triggers/Pharma_10_Drug_Trigger.sql  
3. Triggers/Prevent_Operations_Before_10.sql  
4. Procedures/Insert_Delete_Update.sql  
5. Procedures/Report_Generation.sql
## Note
This project is for educational purposes. It simulates the structure and functionality of a real-world pharmaceutical system but does not interact with any actual medical records or sensitive data.

## Author
Kabir Grewal
[GitHub Profile](https://github.com/kabirgrewal1313)
