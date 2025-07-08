CREATE DATABASE etkinlik_yonetimi;
USE etkinlik_yonetimi;

CREATE TABLE kullanicilar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ad_soyad VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE dis_etkinlik (
    id INT AUTO_INCREMENT PRIMARY KEY,
    baslik VARCHAR(100) NOT NULL,
    mekan VARCHAR(100) NOT NULL,
    tarih DATE NOT NULL,
    saat TIME NOT NULL,
    kurum VARCHAR(100),
    aciklama TEXT
);

CREATE TABLE ic_etkinlik (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kullanici_id INT NOT NULL,
    olay_tipi VARCHAR(50) NOT NULL,
    olay_aciklama TEXT,
    zaman DATETIME NOT NULL,
    
    CONSTRAINT fk_kullanici FOREIGN KEY (kullanici_id) REFERENCES kullanicilar(id)
);

