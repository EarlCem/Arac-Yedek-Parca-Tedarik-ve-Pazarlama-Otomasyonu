BEGIN TRANSACTION;

BEGIN TRY

    DECLARE @YeniSiparisID INT;
    INSERT INTO Sipariş (Müsteri_ID, Siparis_Tarihi, Toplam_Tutar)
    VALUES ('12345678901', '2024-12-21', '1000');
    SET @YeniSiparisID = SCOPE_IDENTITY();

    INSERT INTO Sipariş_Ürün (Siparis_ID, Parça_ID, Miktar, Toplam_Fiyat)
    VALUES (@YeniSiparisID, 1, 2, 500);
    INSERT INTO Sipariş_Ürün (Siparis_ID, Parça_ID, Miktar, Toplam_Fiyat)
    VALUES (@YeniSiparisID, 2, 3, 500);

    UPDATE Ürün
    SET Stok_Miktari = Stok_Miktari - 2
    WHERE Parca_ID = 330;
    UPDATE Ürün
    SET Stok_Miktari = Stok_Miktari - 3
    WHERE Parca_ID = 347;

    INSERT INTO Kargo (Kargo_Firma_ID, Takip_No, Durum, Siparis_ID)
    VALUES (1, '10001', 'Hazırlanıyor', @YeniSiparisID);

    COMMIT TRANSACTION;
    PRINT 'Sipariş başarıyla tamamlandı.';
END TRY

BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Hata: Sipariş işlemi tamamlanamadı. Değişiklikler geri alındı.';
END CATCH;
