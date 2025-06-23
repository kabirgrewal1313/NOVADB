CREATE OR REPLACE TRIGGER MinDrugs
BEFORE INSERT ON Prescription
FOR EACH ROW
DECLARE
    drugCount INT;
BEGIN
    SELECT COUNT(*) INTO drugCount
    FROM Pharma_Drug
    WHERE PharmacyName = :NEW.PharmacyName;

    IF drugCount < 10 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Operation blocked: Pharmacy has less than 10 drugs.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER PreventContract
BEFORE INSERT ON Contract
FOR EACH ROW
DECLARE
    drugCount INT;
BEGIN
    SELECT COUNT(*) INTO drugCount
    FROM Pharma_Drug
    WHERE PharmacyName = :NEW.PharmacyName;

    IF drugCount < 10 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Operation blocked: Pharmacy has less than 10 drugs.');
    END IF;
END;
/
