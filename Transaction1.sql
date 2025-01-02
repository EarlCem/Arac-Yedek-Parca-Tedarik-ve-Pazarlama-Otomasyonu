SELECT * FROM Ürün;

BEGIN TRANSACTION;

BEGIN TRY
    UPDATE Ürün
    SET Stok_Miktari = Stok_Miktari -3
    WHERE Parca_ID = 322;

    UPDATE Ürün
    SET Stok_Miktari = Stok_Miktari -15
    WHERE Parca_ID = 323;

    COMMIT TRANSACTION;
    PRINT 'Tüm işlemler başarıyla tamamlandı.';
END TRY

BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Hata oluştu: İşlemler geri alındı.';
END CATCH;