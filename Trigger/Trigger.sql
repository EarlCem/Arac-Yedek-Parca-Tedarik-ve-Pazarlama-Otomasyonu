CREATE TRIGGER KargoDurumGuncelle
ON Kargo
AFTER UPDATE
AS
BEGIN
    UPDATE Siparis_Kargo
    SET Teslim_Durumu = INSERTED.Durum
    FROM 
        INSERTED
    WHERE 
        Siparis_Kargo.Kargo_ID = INSERTED.Kargo_ID;
END;

