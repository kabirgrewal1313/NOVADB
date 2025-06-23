CREATE OR REPLACE PROCEDURE GetPatientPrescriptions(
    pat_id VARCHAR,
    start_date DATE,
    end_date DATE
)
AS
BEGIN
    FOR rec IN (
        SELECT * FROM Prescription
        WHERE PatientID = pat_id AND PresDate BETWEEN start_date AND end_date
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Prescription ID: ' || rec.PresID || ', Doctor: ' || rec.DocID || ', Date: ' || rec.PresDate);
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE GetPrescriptionDetails(
    pat_id VARCHAR,
    pres_date DATE
)
AS
BEGIN
    FOR rec IN (
        SELECT P.PresID, PD.TradeName, PD.CompanyName, PD.Quantity
        FROM Prescription P
        JOIN Pres_Drug PD ON P.PresID = PD.PresID
        WHERE P.PatientID = pat_id AND P.PresDate = pres_date
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Prescription ID: ' || rec.PresID || ', Drug: ' || rec.TradeName || ', Company: ' || rec.CompanyName || ', Quantity: ' || rec.Quantity);
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE GetDrugsByCompany(
    comp_name VARCHAR
)
AS
BEGIN
    FOR rec IN (
        SELECT TradeName, Formula
        FROM Drug
        WHERE CompanyName = comp_name
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Drug: ' || rec.TradeName || ', Formula: ' || rec.Formula);
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE GetPharmacyStock(
    pharm_name VARCHAR
)
AS
BEGIN
    FOR rec IN (
        SELECT TradeName, CompanyName, Price
        FROM Pharma_Drug
        WHERE PharmacyName = pharm_name
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Drug: ' || rec.TradeName || ', Company: ' || rec.CompanyName || ', Price: ' || rec.Price);
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE GetPharmacyCompanyContact(
    pharm_name VARCHAR,
    comp_name VARCHAR
)
AS
    pharm_phone VARCHAR2(15);
    comp_phone VARCHAR2(15);
BEGIN
    SELECT Phone INTO pharm_phone FROM Pharmacy WHERE Name = pharm_name;
    SELECT Phone INTO comp_phone FROM Pharma_Company WHERE Name = comp_name;

    DBMS_OUTPUT.PUT_LINE('Pharmacy Phone: ' || pharm_phone || ', Pharma Company Phone: ' || comp_phone);
END;
/

CREATE OR REPLACE PROCEDURE GetPatientsByDoctor(
    doc_id VARCHAR
)
AS
BEGIN
    FOR rec IN (
        SELECT AadharID, Name, Age, Address
        FROM Patient
        WHERE PrimaryPhysicianID = doc_id
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Patient ID: ' || rec.AadharID || ', Name: ' || rec.Name || ', Age: ' || rec.Age || ', Address: ' || rec.Address);
    END LOOP;
END;
/

