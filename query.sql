-- 1) DATABASE
CREATE DATABASE SporSalonFinalDb;
GO
USE SporSalonFinalDb;
GO

-- 2) UYELIK PAKETI
CREATE TABLE UyelikPaketi1 (
    UyelikPaketiId INT IDENTITY PRIMARY KEY,
    PaketAdi NVARCHAR(50) NOT NULL,
    SureGun INT NOT NULL,
    Fiyat DECIMAL(10,2) NOT NULL,
    PaketResimYolu NVARCHAR(255)
);
GO

-- 3) UYE (1 Paket -> Cok Uye)
CREATE TABLE Uye1 (
    UyeId INT IDENTITY PRIMARY KEY,
    Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Telefon NVARCHAR(20),
    FotoYolu NVARCHAR(255),
    UyelikPaketiId INT NOT NULL,

    CONSTRAINT FK_Uye_Paket
        FOREIGN KEY (UyelikPaketiId)
        REFERENCES UyelikPaketi(UyelikPaketiId)
);
GO

-- 4) DERS
CREATE TABLE Ders1 (
    DersId INT IDENTITY PRIMARY KEY,
    DersAdi NVARCHAR(50) NOT NULL,
    Gun NVARCHAR(20) NOT NULL,
    Saat NVARCHAR(10) NOT NULL,
    Kontenjan INT NOT NULL
);
GO

-- 5) KATILIM (Uye-Ders Kaydi)
CREATE TABLE Katilim1 (
    KatilimId INT IDENTITY PRIMARY KEY,
    UyeId INT NOT NULL,
    DersId INT NOT NULL,
    KayitTarihi DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Katilim_Uye
        FOREIGN KEY (UyeId) REFERENCES Uye(UyeId),

    CONSTRAINT FK_Katilim_Ders
        FOREIGN KEY (DersId) REFERENCES Ders(DersId)
);
GO

-- 6) ORNEK VERI
INSERT INTO UyelikPaketi (PaketAdi, SureGun, Fiyat)
VALUES
('Aylik', 30, 1200),
('3 Aylik', 90, 3200),
('Yillik', 365, 11000);

INSERT INTO Ders (DersAdi, Gun, Saat, Kontenjan)
VALUES
('Yoga', 'Pazartesi', '18:00', 15),
('Pilates', 'Carsamba', '19:00', 20),
('Spinning', 'Cuma', '20:00', 25);

INSERT INTO Uye (Ad, Soyad, Email, Telefon, UyelikPaketiId)
VALUES
('Zahra', 'Esparghami', 'zahra@mail.com', '0500', 1),
('Ali', 'Yilmaz', 'ali@mail.com', '0501', 2);

INSERT INTO Katilim (UyeId, DersId)
VALUES (1,1), (1,2), (2,3);
GO
SELECT name FROM sys.tables;
SELECT * FROM sys.foreign_keys;

SELECT * FROM UyelikPaketi;
SELECT * FROM Uye;
SELECT * FROM Ders;
SELECT * FROM Katilim;