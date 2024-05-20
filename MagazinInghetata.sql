-- Creare tabele
--1
CREATE TABLE Magazine (
    IDMagazin INT PRIMARY KEY,
    NumeMagazin VARCHAR2(100) NOT NULL,
    Locatie VARCHAR2(255)
);

--2
CREATE TABLE Clienti (
    IDCient INT PRIMARY KEY,
    Prenume VARCHAR2(50) NOT NULL,
    Nume VARCHAR2(50) NOT NULL,
    Email VARCHAR2(100),
    NumarTelefon VARCHAR2(15),
    Adresa VARCHAR2(255)
);

--3
CREATE TABLE Comenzi (
    IDComanda INT PRIMARY KEY,
    IDCient INT,
    DataComanda DATE NOT NULL,
    SumaTotala NUMBER(10, 2) NOT NULL,
    FOREIGN KEY (IDCient) REFERENCES Clienti(IDCient)
);

--4
CREATE TABLE Sponsor (
    IDSponsor INT PRIMARY KEY,
    Nume VARCHAR2(50) NOT NULL,
    Email VARCHAR2(100),
    NumarTelefon VARCHAR2(15),
    Adresa VARCHAR2(255)
);

--5
CREATE TABLE Manageri (
    IDManager INT PRIMARY KEY,
    Prenume VARCHAR2(50) NOT NULL,
    Nume VARCHAR2(50) NOT NULL,
    Email VARCHAR2(100),
    NumarTelefon VARCHAR2(15)
);

--6
CREATE TABLE Angajati (
    AngajatID INT PRIMARY KEY,
    Nume VARCHAR2(100) NOT NULL,
    Prenume VARCHAR2(100) NOT NULL,
    DataAngajare DATE NOT NULL,
    Salariu DECIMAL(10, 2) NOT NULL
);

--7
CREATE TABLE Furnizori (
    IDFurnizor INT PRIMARY KEY,
    NumeFurnizor VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100),
    NumarTelefon VARCHAR2(15),
    Adresa VARCHAR2(255)
);

--8
CREATE TABLE Arome (
    IDAroma INT PRIMARY KEY,
    NumeAroma VARCHAR2(100) NOT NULL
);

--9
CREATE TABLE PreturiInghetata (
    IDAroma INT PRIMARY KEY,
    Pret DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (IDAroma) REFERENCES Arome(IDAroma)
);

-- 10
CREATE TABLE Vanzari (
    IDVanzare INT PRIMARY KEY,
    IDComanda INT,
    DataVanzare DATE NOT NULL,
    Cantitate INT NOT NULL,
    PretUnitar DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (IDComanda) REFERENCES Comenzi(IDComanda)
);

--11
CREATE TABLE ReclamatiiClienti (
    IDReclamatie INT PRIMARY KEY,
    IDCient INT,
    DescriereReclamatie VARCHAR2(255),
    DataReclamatie DATE,
    StatusReclamatie VARCHAR2(50),
    FOREIGN KEY (IDCient) REFERENCES Clienti(IDCient)
);
--12
CREATE TABLE RecenziiProduse (
    IDRecenzie INT PRIMARY KEY,
    IDProdus INT,
    IDCient INT,
    Rating INT,
    Comentariu VARCHAR2(255),
    DataRecenzie DATE,
    FOREIGN KEY (IDCient) REFERENCES Clienti(IDCient)
);

-- Inserare date în tabele

-- Inserare date în Magazine
INSERT INTO Magazine (IDMagazin, NumeMagazin, Locatie)
VALUES (1, 'Pufic', 'Bulevardul Grigorescu 3');

INSERT INTO Magazine (IDMagazin, NumeMagazin, Locatie)
VALUES (2, 'Pufic', 'Bulevardul Decebal 2');

-- Inserare date în Clienti
INSERT INTO Clienti (IDCient, Prenume, Nume, Email, NumarTelefon, Adresa)
VALUES (1, 'Alin', 'George', 'alin.george@gmail.com', '1234567890', '123 Lenului');

INSERT INTO Clienti (IDCient, Prenume, Nume, Email, NumarTelefon, Adresa)
VALUES (2, 'Teo', 'Vas', 'teo.vasile@example.com', '0987654321', '456 Gaiesti');

-- Inserare date în Comenzi
INSERT INTO Comenzi (IDComanda, IDCient, DataComanda, SumaTotala)
VALUES (1, 1, TO_DATE('2023-05-01 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 5.98);

INSERT INTO Comenzi (IDComanda, IDCient, DataComanda, SumaTotala)
VALUES (2, 1, TO_DATE('2023-05-02 15:45:00', 'YYYY-MM-DD HH24:MI:SS'), 6.98);

-- Inserare date în Sponsor
INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon, Adresa)
VALUES (3, 'DairyQueen', 'dairy.queen@gmail.com', '0880101170', 'Calea Victoriei 1');

-- Inserare date în Manageri
INSERT INTO Manageri (IDManager, Prenume, Nume, Email, NumarTelefon)
VALUES (1, 'Ghita', 'Portita', 'ghita.portita@gmail.com', '1112223333');

INSERT INTO Manageri (IDManager, Prenume, Nume, Email, NumarTelefon)
VALUES (2, 'Billy', 'Williams', 'billyb.williams@gmail.com', '4445556666');

-- Inserare date pentru Angajati
INSERT INTO Angajati (AngajatID, Nume, Prenume, DataAngajare, Salariu)
VALUES (1, 'Popescu', 'Ion', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 3500.00);

INSERT INTO Angajati (AngajatID, Nume, Prenume, DataAngajare, Salariu)
VALUES (2, 'Ionescu', 'Maria', TO_DATE('2019-05-20', 'YYYY-MM-DD'), 4000.00);

INSERT INTO Angajati (AngajatID, Nume, Prenume, DataAngajare, Salariu)
VALUES (3, 'Constantinescu', 'Ana', TO_DATE('2021-03-10', 'YYYY-MM-DD'), 3200.00);

INSERT INTO Angajati (AngajatID, Nume, Prenume, DataAngajare, Salariu)
VALUES (4, 'Dumitrescu', 'Mihai', TO_DATE('2018-11-05', 'YYYY-MM-DD'), 4200.00);


-- Inserare date în Furnizori
INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, Adresa)
VALUES (1, 'Chocolate Factory', 'chocolate.factory@gmail.com', '1234567890', 'Iuliu Maniu 3');

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, Adresa)
VALUES (2, 'Carrefour', 'carrefour@gmail.com', '9876543210', 'Georgescu  1');

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, Adresa)
VALUES (3, 'Lidl', 'lidl@gmail.com', '5558889999', 'Lemnisorului 3');

-- Inserare date în Arome
INSERT INTO Arome (IDAroma, NumeAroma)
VALUES (1, 'Fistic');

INSERT INTO Arome (IDAroma, NumeAroma)
VALUES (2, 'Ciocolata');

INSERT INTO Arome (IDAroma, NumeAroma)
VALUES (3, 'Cookies and Cream');

INSERT INTO Arome (IDAroma, NumeAroma)
VALUES (4, 'Bubblegum');

INSERT INTO Arome (IDAroma, NumeAroma)
VALUES (5, 'Cirese');

INSERT INTO Arome (IDAroma, NumeAroma)
VALUES (6, 'Kinder');

-- Inserare date pentru PreturiInghetata
INSERT INTO PreturiInghetata (IDAroma, Pret)
VALUES (1, 3.50);

INSERT INTO PreturiInghetata (IDAroma, Pret)
VALUES (2, 3.00);

INSERT INTO PreturiInghetata (IDAroma, Pret)
VALUES (3, 4.00);

INSERT INTO PreturiInghetata (IDAroma, Pret)
VALUES (4, 3.00);

INSERT INTO PreturiInghetata (IDAroma, Pret)
VALUES (5, 3.00);

INSERT INTO PreturiInghetata (IDAroma, Pret)
VALUES (6, 4.50);

-- Inserare date în tabela Vanzari
INSERT INTO Vanzari (IDVanzare, IDComanda, DataVanzare, Cantitate, PretUnitar)
VALUES (1, 1, TO_DATE('2023-05-01', 'YYYY-MM-DD'), 10, 5.99);

INSERT INTO Vanzari (IDVanzare, IDComanda, DataVanzare, Cantitate, PretUnitar)
VALUES (2, 2, TO_DATE('2023-05-02', 'YYYY-MM-DD'), 5, 30.50);

-- Inserare date în tabela ReclamatiiClienti
INSERT INTO ReclamatiiClienti (IDReclamatie, IDCient, DescriereReclamatie, DataReclamatie, StatusReclamatie)
VALUES (1, 1, 'Timpul de asteptare a fost prea lung', TO_DATE('2024-05-20', 'YYYY-MM-DD'), 'In asteptare');

INSERT INTO ReclamatiiClienti (IDReclamatie, IDCient, DescriereReclamatie, DataReclamatie, StatusReclamatie)
VALUES (2, 2, 'Lipseau anumite arome', TO_DATE('2024-05-18', 'YYYY-MM-DD'), 'Rezolvata');

-- Inserare date în tabela RecenziiProduse
INSERT INTO RecenziiProduse (IDRecenzie, IDProdus, IDCient, Rating, Comentariu, DataRecenzie)
VALUES (1, 101, 1, 4, 'Foarte mul?umit de calitatea produsului!', TO_DATE('2024-05-20', 'YYYY-MM-DD'));

INSERT INTO RecenziiProduse (IDRecenzie, IDProdus, IDCient, Rating, Comentariu, DataRecenzie)
VALUES (2, 102, 2, 3, 'Produsul a fost OK, dar livrarea a întârziat', TO_DATE('2024-05-18', 'YYYY-MM-DD'));


-- Verificare date
SELECT * FROM Clienti;

SELECT * FROM Comenzi co, Clienti cl
WHERE cl.IDCient = co.IDCient
ORDER BY co.DataComanda DESC;

SELECT * FROM Sponsor;

SELECT * FROM Manageri;

SELECT * FROM Magazine
ORDER BY IDMagazin DESC;

SELECT * FROM Furnizori;

SELECT * FROM Arome;

SELECT * FROM PreturiInghetata
ORDER BY IDAroma;

SELECT * FROM Angajati
ORDER BY Salariu DESC;

SELECT * FROM Vanzari;

SELECT * FROM ReclamatiiClienti;

SELECT * FROM RecenziiProduse;

--Cereei SQL
-- Verificare existen?? vânz?ri pentru comenzile clientului 'Alin George'
SELECT * 
FROM Vanzari v
JOIN Comenzi c ON c.IDComanda = v.IDComanda
JOIN Clienti cl ON c.IDCient = cl.IDCient
WHERE cl.Nume = 'George' AND cl.Prenume = 'Alin';


SELECT c.IDComanda, COUNT(v.IDVanzare) AS NumarVanzari
FROM Comenzi c
INNER JOIN Vanzari v ON c.IDComanda = v.IDComanda
GROUP BY c.IDComanda;



SELECT cl.IDCient, cl.Prenume, cl.Nume,
    DECODE(rc.StatusReclamatie, 'Rezolvata', 'Rezolvata', 'In asteptare', 'NeRezolvata') AS StatusReclamatie
FROM Clienti cl
LEFT JOIN ReclamatiiClienti rc ON cl.IDCient = rc.IDCient
ORDER BY cl.Nume, NVL(rc.StatusReclamatie, 'Rezolvata') DESC;
