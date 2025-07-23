# Belediye Etkinlikleri Yönetim Sistemi

Bu proje, belediye bünyesindeki iç ve dış etkinliklerin verimli bir şekilde yönetilmesi için tasarlanmış bir veritabanı çözümüdür. Sistem, kullanıcı etkileşimlerini (iç etkinlikler) ve kamusal etkinlik bilgilerini (dış etkinlikler) kaydetmeyi ve izlemeyi amaçlamaktadır.

## İçerik

* [Proje Hakkında](#proje-hakkında)
* [Özellikler](#özellikler)
* [Veritabanı Yapısı](#veritabanı-yapısı)
    * [Tablolar](#tablolar)
    * [İlişkiler](#ilişkiler)
* [Kurulum](#kurulum)
* [Kullanım](#kullanım)
* [Katkıda Bulunma](#katkıda-bulunma)
* [Lisans](#lisans)
* [İletişim](#iletişim)

## Proje Hakkında

Bu proje, bir belediyenin düzenlediği veya halka açık duyurduğu etkinliklerin sistematik bir şekilde kaydedilmesi ve yönetilmesi ihtiyacına yanıt vermektedir. İç etkinlikler (örneğin, kullanıcıların bir etkinliğe katılım durumları veya tıklama bilgileri) ile dış etkinlikler (kamuya açık sergiler, konferanslar vb.) ayrı ayrı ele alınmış ve veritabanı şeması bu iki tür etkinliği de destekleyecek şekilde tasarlanmıştır.

## Özellikler

* **Kullanıcı Yönetimi:** Sisteme kayıtlı kullanıcı bilgilerini (ad, soyad, e-posta) yönetme.
* **Dış Etkinlik Kaydı:** Halk için düzenlenen etkinliklerin başlık, mekan, tarih, saat, kurum ve açıklama gibi detaylarını kaydetme.
* **İç Etkinlik İzleme:** Kullanıcıların belirli olaylarla etkileşimlerini (tıklama, müsaitlik, katılmama gibi) olay tipi, açıklama ve zaman bilgileriyle kaydetme.
* **Veri Sorgulama:** Kaydedilen etkinlik verilerini kolayca sorgulama ve analiz etme imkanı.

## Veritabanı Yapısı

Proje, `etkinlik_yonetimi` adında bir veritabanı üzerinde çalışır ve aşağıdaki tabloları içerir:

### Tablolar

* `kullanicilar`: Sisteme kayıtlı kullanıcıların bilgilerini saklar.
    * `id` (PRIMARY KEY, AUTO_INCREMENT)
    * `ad_soyad` (VARCHAR)
    * `email` (VARCHAR, UNIQUE)
* `dis_etkinlik`: Dışarıya açık, kamusal etkinlik bilgilerini tutar.
    * `id` (PRIMARY KEY, AUTO_INCREMENT)
    * `baslik` (VARCHAR)
    * `mekan` (VARCHAR)
    * `tarih` (DATE)
    * `saat` (TIME)
    * `kurum` (VARCHAR)
    * `aciklama` (TEXT)
* `ic_etkinlik`: Kullanıcıların etkinliklerle ilgili etkileşimlerini (iç olayları) kaydeder.
    * `id` (PRIMARY KEY, AUTO_INCREMENT)
    * `kullanici_id` (INT)
    * `olay_tipi` (VARCHAR)
    * `olay_aciklama` (TEXT)
    * `zaman` (DATETIME)

### İlişkiler

* `ic_etkinlik` tablosundaki `kullanici_id` alanı, `kullanicilar` tablosundaki `id` alanına bir Yabancı Anahtar (Foreign Key) ile bağlıdır. Bu, her iç etkinliğin belirli bir kullanıcıyla ilişkilendirilmesini sağlar.

## Kurulum

Projeyi yerel ortamınızda kurmak ve çalıştırmak için aşağıdaki adımları izleyin:

1.  **Veritabanı Oluşturma:**
    * MySQL veya uyumlu bir veritabanı yönetim sistemi kurun.
    * `Create.sql` dosyasını kullanarak `etkinlik_yonetimi` veritabanını ve tabloları oluşturun:
        ```sql
        SOURCE Create.sql;
        ```
2.  **Örnek Veri Ekleme:**
    * Oluşturulan tablolara örnek verileri eklemek için aşağıdaki SQL dosyalarını sırasıyla çalıştırın:
        ```sql
        SOURCE Insert_Kullanıcı.sql;
        SOURCE Insert_Dış_Etkinlik.sql;
        SOURCE Inster_İç_Etkinlik.sql;
        ```

## Kullanım

Veritabanına veri ekledikten sonra, çeşitli sorgularla etkinlik bilgilerini alabilirsiniz. Örneğin:

* Tüm iç etkinlikleri listelemek için:
    ```sql
    SELECT * FROM ic_etkinlik;
    ```
* Belirli olay tiplerine göre iç etkinlikleri filtrelemek için:
    ```sql
    SELECT * FROM ic_etkinlik
    WHERE olay_tipi IN ('tıklama', 'müsait', 'katılmıyor');
    ```
* Tüm dış etkinlikleri görmek için:
    ```sql
    SELECT * FROM dis_etkinlik;
    ```
* Tüm kullanıcıları listelemek için:
    ```sql
    SELECT * FROM kullanicilar;
    ```

### Katkı Süreci

1.  Depoyu forklayın ve kendi yerel kopyanızı oluşturun.
2.  Yeni bir özellik veya hata düzeltmesi için ayrı bir dal (branch) oluşturun: `git checkout -b feature/your-feature-name` veya `bugfix/fix-bug-name`.
3.  Değişikliklerinizi yapın. Veritabanı şeması değişiklikleri için `migrations/` klasörüne `YYYYMMDD_feature_name.sql` formatında yeni bir SQL betiği ekleyebilirsiniz.
4.  Değişikliklerinizi commit edin: `git commit -m "feat: Yeni özellik eklendi"`.
5.  Değişikliklerinizi orijinal depoya gönderin: `git push origin feature/your-feature-name`.
6.  Bir Pull Request (Çekme İsteği) açın ve değişikliklerinizi detaylıca açıklayın.

### SQL Yazım Standartları (Örnek)

* Tablo ve sütun adları için küçük harf ve alt çizgi (`snake_case`) kullanın.
* SQL anahtar kelimelerini (SELECT, FROM, WHERE vb.) büyük harfle yazın.
* Sorgularınızı okunabilliği artırmak için girintili yazın.


## İletişim

* **Gizem Kara** - [GitHub Profiliniz](https://github.com/giizemkara) 
