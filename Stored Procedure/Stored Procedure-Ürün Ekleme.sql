CREATE PROCEDURE UrunKategorisiEkle
    @UrunTuru VARCHAR(100),
    @DepoID INT
AS
BEGIN
    INSERT INTO Ürün_Kategorisi (Ürün_Türü, Bulunduğu_Depo)
    VALUES (@UrunTuru, @DepoID);
END;

EXEC UrunKategorisiEkle @UrunTuru = 'Elektronik', @DepoID = 19;