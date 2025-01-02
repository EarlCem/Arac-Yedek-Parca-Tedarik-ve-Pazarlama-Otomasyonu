# Araç Yedek Parça Tedarik ve Pazarlama Otomasyonu
Proje Başlığı: Araç Yedek Parça Tedarik ve Pazarlama Otomasyonu
Proje Ekibindeki Kişiler: 
210260303-Cem Davrak
210260017-Süleyman Emir Eroğlu(Projede Katkısı Yok)

1.Proje Amacı: Bir ticaret iş akışını desteklemek,iş sürecinde oluşabilecek yanlışları önlemek için stok yönetimi,tedarikçi yönetimi,depo yönetimi,stok yönetimi ve kargo takibi yapabilmemizi sağlar.
Müşteriler sipariş verebilmeli,depolara ürün tedarik edilebilmeli ve depo içeriği bilinip ona göre stok takibi yapılabilmeli.

2.Kullanıcı Türleri ve Gereksinimler:
1.Müşteri Rolü: 
-Sipariş Verebilme ve sipariş detayını görebilme
-Kişisel bilgilerini güncelleme
-Kargo takip numarası üzerinden sipariş durumunu sorgulama
2.Depo Sorumlusu Rolü:
- Depoya gelen ürünlerin giriş işlemlerini kaydetme.
- Ürünlerin stok miktarını görme ve eksik ürünler için tedarik siparişi oluşturma.
3.Tedarikçi Rolü:
- Depodan gelen taleplere göre ürün sağlama.
- Ürün bazlı tedarik işlemlerinin miktar ve teslim tarihlerini görme.
-  Sipariş durumunu takip ederek sevkiyat planı yapma.
4. Kargo Firması Rolü
- Sipariş ve tedarik siparişlerine ait işlem bilgilerini güncel tutma.
- Sipariş durumunu takip ederek sevkiyat planı yapma.
5. Yönetici Rolü
- Müşteri ve Tedarikçi kayıtlarını kontrol etme ve düzenleme.
- Ürün kategorileri,depo bilgileri ve stok durumlarına erişim.
- Kargo firmalarıyla iş birliği süreçlerini yönetme.

3.Varlık ve Nitelikleri
1.Müşteri: Müsteri_ID(Primary Key), Ad_Soyad, Telefon, E_Posta, Adres
2.Tedarikçi: Tedarikci_ID(Primary Key),Firma_Adı,Firma_Telefon,Firma_Adres
3.Sipariş: Siparis_ID(Primary Key),Müsteri_ID(Foreign Key),Siparis_Tarihi, Toplam_Tutar
4.Ürün: Parca_ID (Primary Key), ParcaAdı_ID, Stok_Miktarı, Birim_Fiyat, Satis_Fiyat, Ürün_Kategorisi_ID, Tedarikci_ID
5.Depo: Depo_ID (Primary Key), Depo_Adı, Konum, Depo_Sorumlusu_ID
6. Kargo:  Kargo_ID (Primary Key), Kargo_Firma_ID(Foreign Key), Takip_No, Durum, Siparis_ID(Foreign Key)
7.Ürün Kategorisi: Ürün_Kategorisi_ID(PrimaryKey),Bulunduğu_Depo(Foreign Key), Ürün_Türü
8.Parça Adı: Parca_ID(Primary Key), ParcaAdı_ID
9. Depo Sorumlusu: Depo_Sorumlusu_ID(Primary Key),Ad_Soyad,Telefon,Ev Adresi
10. Kargo Firması: Kargo_Firma_ID (Primary Key), Kargo_Firma_Adı
11. Sipariş Ürün: Siparis_ID(Foreign Key), Parça_ID(Foreign Key),Miktar,Toplam_Fiyat
12.Tedarik Siparişi: Tedarik_Siparis_ID (Primary Key), Tedarikci_ID(Foreign Key), Depo_ID(Foreign Key), Parca_ID(Foreign Key), Miktar, Siparis_Tarihi, Tahmini_Teslim_Tarihi
13.Kargo-Müşteri: Kargo_ID(Foreign Key), Müsteri_ID (Foreign Key)
14.Sipariş-Kargo: Kargo_ID (Primary Key), Siparis_ID(Foreign Key), Tahmini_Teslim_Tarihi, Teslim_Durumu
15.Kargo-Tedarikçi: Tedarikci_ID(Foreign Key), Kargo_ID(Foreign Key)

4.İlişkileri:
1- Müşteri->Sipariş:Verdiği(1-N)(Bir Müşteri birden fazla sipariş verebilir)
2- Sipariş->Ürün:Sipariş-Ürün(N-M)(Bir sipariş birden fazla ürün içerebilir;bir ürün farklı siparişlerde olabilir)
3- Ürün Kategorisi->Ürün:Ait Olduğu(1-N)(Bir ürün kategorisi birden fazla ürün içerebilir) 
4- Sipariş->Kargo: Sipariş-Kargo (N-M)( Bir sipariş birden fazla kargo ile taşınabilir, bir kargo birden fazla sipariş taşıyabilir)
5- Depo->Ürün Kategorisi:Bulunduğu (N-M)(Her depo birden fazla kategori ürünü içerebilir)
6- Kargo->Müşteri: Kargo-Müşteri(N-M)(Bir kargo birden fazla müşteriye hizmet verebilir)
7- Depo Sorumlusu->Depo: Sorumlu (1-1)(Her depo bir depo sorumlusuna atanır)
8- Kargo->Tedarikçi:Kargo-Tedarikçi (N-M)(Bir kargo birden fazla tedarikçiyle çalışabilir)
9- Parça Adı->Ürün:İsmi(1-N)(Bir parça adı birden fazla ürüne atanabilir)
10- Ürün->Tedarik Siparişi:Sipariş Eden(1-N)(Bir ürün birden fazla tedarik siparişi ile talep edilebilir)
11- Tedarikçi->Ürün:Üreten(1-N)(Bir tedarikçi birden fazla ürün tedarik eder)
12- Tedarikçi->TedarikSiparişi:Üreten(1-N)(Bir tedarikçi birden fazla sipariş alabilir)
13- Kargo Firma Adı->Kargo:İsmi(Bir kargo firması birden fazla kargoya hizmet verebilir)
14- Depo-Tedarik Siparişi:Gideceği(1-N)(Bir depo birden fazla tedarik siparişi alabilir)
