-- Add Pharmacy
CREATE OR REPLACE PROCEDURE AddPharmacy(p_name VARCHAR, p_address VARCHAR, p_phone VARCHAR) AS
BEGIN
    INSERT INTO Pharmacy VALUES (p_name, p_address, p_phone);
END;
/

-- Add Pharmaceutical Company
CREATE OR REPLACE PROCEDURE AddPharmaCompany(c_name VARCHAR, c_phone VARCHAR) AS
BEGIN
    INSERT INTO Pharma_Company VALUES (c_name, c_phone);
END;
/

-- Add Patient
CREATE OR REPLACE PROCEDURE AddPatient(p_id VARCHAR, p_name VARCHAR, p_address VARCHAR, p_age INT, primary_doc VARCHAR) AS
BEGIN
    INSERT INTO Patient VALUES (p_id, p_name, p_address, p_age, primary_doc);
END;
/

-- Add Doctor
CREATE OR REPLACE PROCEDURE AddDoctor(d_id VARCHAR, d_name VARCHAR, d_speciality VARCHAR, d_exp INT) AS
BEGIN
    INSERT INTO Doctor VALUES (d_id, d_name, d_speciality, d_exp);
END;
/

-- Add Drug
CREATE OR REPLACE PROCEDURE AddDrug(t_name VARCHAR, c_name VARCHAR, formula VARCHAR) AS
BEGIN
    INSERT INTO Drug VALUES (t_name, c_name, formula);
END;
/

-- Add Pharma Drug
CREATE OR REPLACE PROCEDURE AddPharmaDrug(pharm_name VARCHAR, t_name VARCHAR, c_name VARCHAR, price DECIMAL) AS
BEGIN
    INSERT INTO Pharma_Drug VALUES (pharm_name, t_name, c_name, price);
END;
/

-- Add Prescription
CREATE OR REPLACE PROCEDURE AddPrescription(pres_id INT, doc_id VARCHAR, patient_id VARCHAR, pharm_name VARCHAR, pres_date DATE) AS
BEGIN
    INSERT INTO Prescription VALUES (pres_id, doc_id, patient_id, pharm_name, pres_date);
END;
/

-- Add Prescribed Drug
CREATE OR REPLACE PROCEDURE AddPrescribedDrug(pres_id INT, t_name VARCHAR, c_name VARCHAR, qty INT) AS
BEGIN
    INSERT INTO Pres_Drug VALUES (pres_id, t_name, c_name, qty);
END;
/

-- Add Contract
CREATE OR REPLACE PROCEDURE AddContract(contract_id INT, s_date DATE, e_date DATE, content TEXT, c_name VARCHAR, pharm_name VARCHAR, supervisor VARCHAR) AS
BEGIN
    INSERT INTO Contract VALUES (contract_id, s_date, e_date, content, c_name, pharm_name, supervisor);
END;
/

-- Delete Pharmacy
CREATE OR REPLACE PROCEDURE DeletePharmacy(pharm_name VARCHAR) AS
BEGIN
    DELETE FROM Pharmacy WHERE Name = pharm_name;
END;
/

-- Delete Pharmaceutical Company
CREATE OR REPLACE PROCEDURE DeletePharmaCompany(c_name VARCHAR) AS
BEGIN
    DELETE FROM Pharma_Company WHERE Name = c_name;
END;
/

-- Delete Patient
CREATE OR REPLACE PROCEDURE DeletePatient(p_id VARCHAR) AS
BEGIN
    DELETE FROM Patient WHERE AadharID = p_id;
END;
/

-- Delete Doctor
CREATE OR REPLACE PROCEDURE DeleteDoctor(d_id VARCHAR) AS
BEGIN
    DELETE FROM Doctor WHERE AadharID = d_id;
END;
/

-- Delete Drug
CREATE OR REPLACE PROCEDURE DeleteDrug(t_name VARCHAR, c_name VARCHAR) AS
BEGIN
    DELETE FROM Drug WHERE TradeName = t_name AND CompanyName = c_name;
END;
/

CREATE OR REPLACE PROCEDURE UpdatePharmacyPhone(
    pharm_name VARCHAR,
    new_phone VARCHAR
)
AS
BEGIN
    UPDATE Pharmacy
    SET Phone = new_phone
    WHERE Name = pharm_name;
END;
/

CREATE OR REPLACE PROCEDURE UpdateDoctorExperience(
    d_id VARCHAR,
    new_exp INT
)
AS
BEGIN
    UPDATE Doctor
    SET Experience = new_exp
    WHERE AadharID = d_id;
END;
/

CREATE OR REPLACE PROCEDURE UpdateDoctorSpeciality(
    d_id VARCHAR,
    new_speciality VARCHAR
)
AS
BEGIN
    UPDATE Doctor
    SET Speciality = new_speciality
    WHERE AadharID = d_id;
END;
/

CREATE OR REPLACE PROCEDURE UpdatePatientAddress(
    p_id VARCHAR,
    new_address VARCHAR
)
AS
BEGIN
    UPDATE Patient
    SET Address = new_address
    WHERE AadharID = p_id;
END;
/

CREATE OR REPLACE PROCEDURE UpdatePharmaCompanyPhone(
    c_name VARCHAR,
    new_phone VARCHAR
)
AS
BEGIN
    UPDATE Pharma_Company
    SET Phone = new_phone
    WHERE Name = c_name;
END;
/

CREATE OR REPLACE PROCEDURE UpdateDrugFormula(
    t_name VARCHAR,
    c_name VARCHAR,
    new_formula VARCHAR
)
AS
BEGIN
    UPDATE Drug
    SET Formula = new_formula
    WHERE TradeName = t_name AND CompanyName = c_name;
END;
/

CREATE OR REPLACE PROCEDURE UpdatePharmaDrugPrice(
    pharm_name VARCHAR,
    t_name VARCHAR,
    c_name VARCHAR,
    new_price DECIMAL
)
AS
BEGIN
    UPDATE Pharma_Drug
    SET Price = new_price
    WHERE PharmacyName = pharm_name AND TradeName = t_name AND CompanyName = c_name;
END;
/

CREATE OR REPLACE PROCEDURE UpdateContractSupervisor(
    contract_id INT,
    new_supervisor VARCHAR
)
AS
BEGIN
    UPDATE Contract
    SET Supervisor = new_supervisor
    WHERE ContractID = contract_id;
END;
/

CREATE OR REPLACE PROCEDURE UpdateContractEndDate(
    contract_id INT,
    new_end_date DATE
)
AS
BEGIN
    UPDATE Contract
    SET EndDate = new_end_date
    WHERE ContractID = contract_id;
END;
/
