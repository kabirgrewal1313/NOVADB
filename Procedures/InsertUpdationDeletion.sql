-- Pharmacy
CREATE OR REPLACE PROCEDURE AddPharmacy(p_name VARCHAR, p_address VARCHAR, p_phone VARCHAR) AS
BEGIN INSERT INTO Pharmacy VALUES (p_name, p_address, p_phone); END;
/

CREATE OR REPLACE PROCEDURE SafeDeletePharmacy(pharm_name VARCHAR) AS dep_count INT;
BEGIN
    SELECT COUNT(*) INTO dep_count FROM Pharma_Drug WHERE PharmacyName = pharm_name;
    IF dep_count > 0 THEN RAISE_APPLICATION_ERROR(-20003, 'Cannot delete pharmacy: Drugs exist.'); RETURN; END IF;

    SELECT COUNT(*) INTO dep_count FROM Prescription WHERE PharmacyName = pharm_name;
    IF dep_count > 0 THEN RAISE_APPLICATION_ERROR(-20004, 'Cannot delete pharmacy: Prescriptions exist.'); RETURN; END IF;

    SELECT COUNT(*) INTO dep_count FROM Contract WHERE PharmacyName = pharm_name;
    IF dep_count > 0 THEN RAISE_APPLICATION_ERROR(-20005, 'Cannot delete pharmacy: Contracts exist.'); RETURN; END IF;

    DELETE FROM Pharmacy WHERE Name = pharm_name;
END;
/

-- Pharmaceutical Company
CREATE OR REPLACE PROCEDURE AddPharmaCompany(c_name VARCHAR, c_phone VARCHAR) AS
BEGIN INSERT INTO Pharma_Company VALUES (c_name, c_phone); END;
/

-- Patient
CREATE OR REPLACE PROCEDURE AddPatient(p_id VARCHAR, p_name VARCHAR, p_address VARCHAR, p_age INT, primary_doc VARCHAR) AS
BEGIN INSERT INTO Patient VALUES (p_id, p_name, p_address, p_age, primary_doc); END;
/

-- Doctor
CREATE OR REPLACE PROCEDURE AddDoctor(d_id VARCHAR, d_name VARCHAR, d_speciality VARCHAR, d_exp INT) AS
BEGIN INSERT INTO Doctor VALUES (d_id, d_name, d_speciality, d_exp); END;
/

-- Drug
CREATE OR REPLACE PROCEDURE AddDrug(t_name VARCHAR, c_name VARCHAR, formula VARCHAR) AS
BEGIN INSERT INTO Drug VALUES (t_name, c_name, formula); END;
/

-- Pharma_Drug
CREATE OR REPLACE PROCEDURE AddPharmaDrug(pharm_name VARCHAR, t_name VARCHAR, c_name VARCHAR, price DECIMAL) AS
BEGIN INSERT INTO Pharma_Drug VALUES (pharm_name, t_name, c_name, price); END;
/

-- Prescription
CREATE OR REPLACE PROCEDURE AddPrescription(pres_id INT, doc_id VARCHAR, patient_id VARCHAR, pharm_name VARCHAR, pres_date DATE) AS
BEGIN INSERT INTO Prescription VALUES (pres_id, doc_id, patient_id, pharm_name, pres_date); END;
/

CREATE OR REPLACE PROCEDURE AddPrescribedDrug(pres_id INT, t_name VARCHAR, c_name VARCHAR, qty INT) AS
BEGIN INSERT INTO Pres_Drug VALUES (pres_id, t_name, c_name, qty); END;
/

-- Contract
CREATE OR REPLACE PROCEDURE AddContract(contract_id INT, s_date DATE, e_date DATE, content TEXT, c_name VARCHAR, pharm_name VARCHAR, supervisor VARCHAR) AS
BEGIN INSERT INTO Contract VALUES (contract_id, s_date, e_date, content, c_name, pharm_name, supervisor); END;
/
