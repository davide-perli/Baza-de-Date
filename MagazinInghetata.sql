DROP TABLE Vanzari CASCADE CONSTRAINTS;
DROP TABLE Comenzi CASCADE CONSTRAINTS;
DROP TABLE Clienti CASCADE CONSTRAINTS;
DROP TABLE Sponsori CASCADE CONSTRAINTS;
DROP TABLE Manageri CASCADE CONSTRAINTS;
DROP TABLE Magazine CASCADE CONSTRAINTS;
DROP TABLE Furnizori CASCADE CONSTRAINTS;
DROP TABLE Arome CASCADE CONSTRAINTS;
DROP TABLE PreturiInghetata CASCADE CONSTRAINTS;
DROP TABLE Angajati CASCADE CONSTRAINTS;
DROP TABLE OrarMagazine CASCADE CONSTRAINTS;
DROP TABLE RecenziiProduse CASCADE CONSTRAINTS;
DROP TABLE ReclamatiiClienti CASCADE CONSTRAINTS;


-- Creare tabele
--1
CREATE TABLE Magazine (
    IDMagazin INT PRIMARY KEY,
    NumeMagazin VARCHAR2(100) NOT NULL,
    IDAdresa INT,
    IDOrar INT,
    IDSponsor INT,
    FOREIGN KEY (IDAdresa) REFERENCES Adresa (IDAdresa),
    FOREIGN KEY (IDOrar) REFERENCES OrarMagazine(IDOrar),
    FOREIGN KEY (IDSponsor) REFERENCES  Sponsor(IDSponsor)
);

--2
CREATE TABLE Clienti (
    IDClient INT PRIMARY KEY,
    Prenume VARCHAR2(50) NOT NULL,
    Nume VARCHAR2(50) NOT NULL,
    Email VARCHAR2(100),
    NumarTelefon VARCHAR2(15)
);

--3
CREATE TABLE Comenzi (
    IDComanda INT PRIMARY KEY,
    IDClient INT,
    IDAroma INT,
    DataComanda DATE NOT NULL,
    SumaTotala NUMBER(10, 2) NOT NULL,
    FOREIGN KEY (IDClient) REFERENCES Clienti(IDClient),
    FOREIGN KEY (IDAroma) REFERENCES Arome(IDAroma)
);

--4
CREATE TABLE Sponsor (
    IDSponsor INT PRIMARY KEY,
    Nume VARCHAR2(50) NOT NULL,
    Email VARCHAR2(100),
    NumarTelefon VARCHAR2(15)
);

--5
CREATE TABLE Angajati (
    IDAngajat INT PRIMARY KEY,
    IDMagazin INT,
    Nume VARCHAR2(100) NOT NULL,
    Prenume VARCHAR2(100) NOT NULL,
    DataAngajare DATE NOT NULL,
    Salariu DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY(IDMagazin) REFERENCES  Magazine(IDMagazin)
);

--6
CREATE TABLE Manageri (
    IDManager INT PRIMARY KEY,
    FOREIGN KEY (IDManager) REFERENCES Angajati(IDAngajat)
);

--7
CREATE TABLE Furnizori (
    IDFurnizor INT PRIMARY KEY,
    IDAdresa INT,
    NumeFurnizor VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100),
    NumarTelefon VARCHAR2(15),
    FOREIGN KEY(IDAdresa) REFERENCES Adresa (IDAdresa)
);

--8
CREATE TABLE Arome (
    IDAroma INT PRIMARY KEY,
    IDFurnizor INT,
    Pret DECIMAL(10, 2) NOT NULL,
    NumeAroma VARCHAR2(100) NOT NULL,
    FOREIGN KEY (IDFurnizor) REFERENCES Furnizori (IDFurnizor)
);

--9
CREATE TABLE Adresa (

    IDAdresa INT PRIMARY KEY,
    Oras VARCHAR(255),
    Strada VARCHAR(255)
);

-- 10
CREATE TABLE Vanzari (
    IDClient INT,
    IDComanda INT,
    IDMagazin INT,
    DataVanzare DATE,
    Suma DECIMAL(10, 2),
    PRIMARY KEY (IDClient, IDComanda, IDMagazin),
    FOREIGN KEY (IDClient) REFERENCES Clienti(IDClient),
    FOREIGN KEY (IDComanda) REFERENCES Comenzi(IDComanda),
    FOREIGN KEY (IDMagazin) REFERENCES Magazine(IDMagazin)
);

--11
CREATE TABLE OrarMagazine (
    IDOrar INT PRIMARY KEY,
    ZiuaSaptamanii VARCHAR2(15),
    OraDeschidere TIMESTAMP,
    OraInchidere TIMESTAMP
);

--12
CREATE TABLE Recenzii (
    IDRecenzie INT PRIMARY KEY,
    IDClient INT,
    Rating INT,
    Comentariu VARCHAR2(255),
    DataRecenzie DATE,
    FOREIGN KEY (IDClient) REFERENCES Clienti (IDClient)
);

--13
CREATE TABLE AdaugaAroma (
    IDClient INT,
    IDAroma INT,
    FOREIGN KEY (IDClient) REFERENCES Clienti (IDClient),
    FOREIGN KEY (IDAroma) REFERENCES Arome (IDAroma)
);


-- Inserare date �n tabele

--1 Inserare date �n Magazine
INSERT INTO Magazine (IDMagazin, NumeMagazin, IDAdresa, IDOrar, IDSponsor)
VALUES (1, 'Pufic', 1, 1, 1);

INSERT INTO Magazine (IDMagazin, NumeMagazin, IDAdresa, IDOrar, IDSponsor)
VALUES (2, 'Pufic', 2, 2, 2);

INSERT INTO Magazine (IDMagazin, NumeMagazin, IDAdresa, IDOrar, IDSponsor)
VALUES (3, 'Pufic', 3, 3, 3);

INSERT INTO Magazine (IDMagazin, NumeMagazin, IDAdresa, IDOrar, IDSponsor)
VALUES (4, 'Pufic', 4, 4, 4);

INSERT INTO Magazine (IDMagazin, NumeMagazin, IDAdresa, IDOrar, IDSponsor)
VALUES (5, 'Pufic', 5, 5, 5);

INSERT INTO Magazine (IDMagazin, NumeMagazin, IDAdresa, IDOrar, IDSponsor)
VALUES (6, 'Pufic', 6, 6, 6);

INSERT INTO Magazine (IDMagazin, NumeMagazin, IDAdresa, IDOrar, IDSponsor)
VALUES (7, 'Pufic', 7, 7, 7);

INSERT INTO Magazine (IDMagazin, NumeMagazin, IDAdresa, IDOrar, IDSponsor)
VALUES (8, 'Pufic', 8, 8, 8);

INSERT INTO Magazine (IDMagazin, NumeMagazin, IDAdresa, IDOrar, IDSponsor)
VALUES (9, 'Pufic', 9, 9, 9);

INSERT INTO Magazine (IDMagazin, NumeMagazin, IDAdresa, IDOrar, IDSponsor)
VALUES (10, 'Pufic', 10, 10, 10);

INSERT INTO Magazine (IDMagazin, NumeMagazin, IDAdresa, IDOrar, IDSponsor)
VALUES (11, 'Pufic', 11, 11, 11);

INSERT INTO Magazine (IDMagazin, NumeMagazin, IDAdresa, IDOrar, IDSponsor)
VALUES (12, 'Pufic', 12, 12, 12);

INSERT INTO Magazine (IDMagazin, NumeMagazin, IDAdresa, IDOrar, IDSponsor)
VALUES (13, 'Pufic', 13, 13, 13);

--2 Inserare date �n Clienti
INSERT INTO Clienti (IDClient, Prenume, Nume, Email, NumarTelefon)
VALUES (1, 'Alin', 'George', 'alin.george@gmail.com', '1234567890');

INSERT INTO Clienti (IDClient, Prenume, Nume, Email, NumarTelefon)
VALUES (2, 'Teo', 'Vas', 'teo.vasile@gmail.com', '0987654321');

INSERT INTO Clienti (IDClient, Prenume, Nume, Email, NumarTelefon)
VALUES (3, 'Maria', 'Beni', 'maria.beni@gmail.com', '0687645321');

INSERT INTO Clienti (IDClient, Prenume, Nume, Email, NumarTelefon)
VALUES (4, 'Ana', 'Vasilescu', 'ana.vasilescu@gmail.com', '0775101171');

INSERT INTO Clienti (IDClient, Prenume, Nume, Email, NumarTelefon)
VALUES (5, 'Robi', 'Nico', 'robi.nico@gmail.com', '0216674478');

INSERT INTO Clienti (IDClient, Prenume, Nume, Email, NumarTelefon)
VALUES (6, 'Andrei', 'Paun', 'andrei.paun@gmail.com', '0217654321');

INSERT INTO Clienti (IDClient, Prenume, Nume, Email, NumarTelefon)
VALUES (7, 'George', 'Bob', 'george.bob@gmail.com', '0887654321');

INSERT INTO Clienti (IDClient, Prenume, Nume, Email, NumarTelefon)
VALUES (8, 'Gabi', 'Paki', 'gabi.paki@gmail.com', '087240521');

INSERT INTO Clienti (IDClient, Prenume, Nume, Email, NumarTelefon)
VALUES (9, 'Gabriel', 'Parintele', 'gabriel.parintele@gmail.com', '0314375461');

INSERT INTO Clienti (IDClient, Prenume, Nume, Email, NumarTelefon)
VALUES (10, 'Ionut', 'Pacate', 'ionut.pacate@gmail.com', '0354654321');

INSERT INTO Clienti (IDClient, Prenume, Nume, Email, NumarTelefon)
VALUES (11, 'Teodor', 'Ene', 'teodor.ene@gmail.com', '0259954624');

INSERT INTO Clienti (IDClient, Prenume, Nume, Email, NumarTelefon)
VALUES (12, 'Andra', 'Andreescu', 'andra.andreescu@gmail.com', '078101178');

INSERT INTO Clienti (IDClient, Prenume, Nume, Email, NumarTelefon)
VALUES (13, 'Melisa', 'Marcel', 'melisa.marcel@gmail.com', '0554121363');


--3 Inserare date �n Comenzi

INSERT INTO Comenzi (IDComanda, IDClient, DataComanda, SumaTotala)
VALUES (1, 1, TO_DATE('2023-05-01 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 5.98);

INSERT INTO Comenzi (IDComanda, IDClient, DataComanda, SumaTotala)
VALUES (2, 1, TO_DATE('2023-05-02 15:45:00', 'YYYY-MM-DD HH24:MI:SS'), 6.98);

INSERT INTO Comenzi (IDComanda, IDClient, DataComanda, SumaTotala)
VALUES (3, 2, TO_DATE('2023-06-02 13:42:00', 'YYYY-MM-DD HH24:MI:SS'), 7.50);

INSERT INTO Comenzi (IDComanda, IDClient, DataComanda, SumaTotala)
VALUES (4, 3, TO_DATE('2024-08-24 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3.00);

INSERT INTO Comenzi (IDComanda, IDClient, DataComanda, SumaTotala)
VALUES (5, 4, TO_DATE('2024-07-30 11:35:00', 'YYYY-MM-DD HH24:MI:SS'), 11.82);

INSERT INTO Comenzi (IDComanda, IDClient, DataComanda, SumaTotala)
VALUES (6, 5, TO_DATE('2024-01-02 17:41:00', 'YYYY-MM-DD HH24:MI:SS'), 14.23);

INSERT INTO Comenzi (IDComanda, IDClient, DataComanda, SumaTotala)
VALUES (7, 6, TO_DATE('2024-08-21 14:48:00', 'YYYY-MM-DD HH24:MI:SS'), 9.95);

INSERT INTO Comenzi (IDComanda, IDClient, DataComanda, SumaTotala)
VALUES (8, 7, TO_DATE('2024-03-09 11:39:00', 'YYYY-MM-DD HH24:MI:SS'), 8.92);

INSERT INTO Comenzi (IDComanda, IDClient, DataComanda, SumaTotala)
VALUES (9, 8, TO_DATE('2024-12-02 10:28:00', 'YYYY-MM-DD HH24:MI:SS'), 12.24);

INSERT INTO Comenzi (IDComanda, IDClient, DataComanda, SumaTotala)
VALUES (10, 9, TO_DATE('2024-11-29 19:25:00', 'YYYY-MM-DD HH24:MI:SS'), 8.55);

INSERT INTO Comenzi (IDComanda, IDClient, DataComanda, SumaTotala)
VALUES (11, 10, TO_DATE('2024-09-25 18:18:00', 'YYYY-MM-DD HH24:MI:SS'), 11.99);

INSERT INTO Comenzi (IDComanda, IDClient, DataComanda, SumaTotala)
VALUES (12, 11, TO_DATE('2024-01-12 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), 8.20);

INSERT INTO Comenzi (IDComanda, IDClient, DataComanda, SumaTotala)
VALUES (13, 12, TO_DATE('2024-06-22 20:55:00', 'YYYY-MM-DD HH24:MI:SS'), 5.58);


--4 Inserare date �n Sponsor

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon)
VALUES (1, 'DairyQueen', 'dairy.queen@gmail.com', '0880101170');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon)
VALUES (2, 'Alpro', 'alpro@gmail.com', '0770101170');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon)
VALUES (3, 'Olympus', 'olympus@gmail.com', '021101170');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon)
VALUES (4, 'Zuzu', 'zuzu@gmail.com', '0880187170');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon)
VALUES (5, 'Heidi', 'heidi@gmail.com', '0310107870');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon)
VALUES (6, 'Milka', 'milka@gmail.com', '0550101170');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon)
VALUES (7, 'Michelin', 'michelin@gmail.com', '0450101170');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon)
VALUES (8, 'PlusINC', 'plus@gmail.com', '0225434587');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon)
VALUES (9, 'Ikea', 'ikea@gmail.com', '0334101170');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon)
VALUES (10, 'XXLUX', 'xxlux@gmail.com', '0775801170');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon)
VALUES (11, 'ToyINC', 'toy@gmail.com', '0880108541');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon)
VALUES (12, 'Decathlon', 'decathlon@gmail.com', '0780254170');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon)
VALUES (13, 'Metro', 'metro@gmail.com', '0586401170');


--5 Inserare date pentru Angajati

INSERT INTO Angajati (IDAngajat, Nume, Prenume, DataAngajare, Salariu)
VALUES (1, 'Popescu', 'Ion', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 3500.00);

INSERT INTO Angajati (IDAngajat, Nume, Prenume, DataAngajare, Salariu)
VALUES (2, 'Ionescu', 'Maria', TO_DATE('2019-05-20', 'YYYY-MM-DD'), 4000.00);

INSERT INTO Angajati (IDAngajat, Nume, Prenume, DataAngajare, Salariu)
VALUES (3, 'Constantinescu', 'Ana', TO_DATE('2021-03-10', 'YYYY-MM-DD'), 3200.00);

INSERT INTO Angajati (IDAngajat, Nume, Prenume, DataAngajare, Salariu)
VALUES (4, 'Dumitrescu', 'Mihai', TO_DATE('2018-11-05', 'YYYY-MM-DD'), 4200.00);

INSERT INTO Angajati (IDAngajat, Nume, Prenume, DataAngajare, Salariu)
VALUES (5, 'Armin', 'Matei', TO_DATE('2024-05-14', 'YYYY-MM-DD'), 2200.00);

INSERT INTO Angajati (IDAngajat, Nume, Prenume, DataAngajare, Salariu)
VALUES (6, 'Giunca', 'Andrei', TO_DATE('2024-05-22', 'YYYY-MM-DD'), 2000.00);

INSERT INTO Angajati (IDAngajat, Nume, Prenume, DataAngajare, Salariu)
VALUES (7, 'Barca', 'Stefan', TO_DATE('2023-10-03', 'YYYY-MM-DD'), 2700.00);

INSERT INTO Angajati (IDAngajat, Nume, Prenume, DataAngajare, Salariu)
VALUES (8, 'Stefanescu', 'Andi', TO_DATE('2022-09-14', 'YYYY-MM-DD'), 3000.00);

INSERT INTO Angajati (IDAngajat, Nume, Prenume, DataAngajare, Salariu)
VALUES (9, 'Scarlat', 'Ana', TO_DATE('2021-07-23', 'YYYY-MM-DD'), 4000.00);

INSERT INTO Angajati (IDAngajat, Nume, Prenume, DataAngajare, Salariu)
VALUES (10, 'Enache', 'Maria', TO_DATE('2020-11-17', 'YYYY-MM-DD'), 4200.00);

INSERT INTO Angajati (IDAngajat, Nume, Prenume, DataAngajare, Salariu)
VALUES (11, 'Ridu', 'Monica', TO_DATE('2019-12-08', 'YYYY-MM-DD'), 4300.00);

INSERT INTO Angajati (IDAngajat, Nume, Prenume, DataAngajare, Salariu)
VALUES (12, 'Enica', 'Raluca', TO_DATE('2023-08-25', 'YYYY-MM-DD'), 3100.00);

INSERT INTO Angajati (IDAngajat, Nume, Prenume, DataAngajare, Salariu)
VALUES (13, 'Anapol', 'Denisa', TO_DATE('2022-09-30', 'YYYY-MM-DD'), 3700.00);


--6 Inserare date �n Manageri

INSERT INTO Manageri (IDManager)
VALUES (1);

INSERT INTO Manageri (IDManager)
VALUES (2);

INSERT INTO Manageri (IDManager)
VALUES (3);

INSERT INTO Manageri (IDManager)
VALUES (4);

INSERT INTO Manageri (IDManager)
VALUES (5);

INSERT INTO Manageri (IDManager)
VALUES (6);

INSERT INTO Manageri (IDManager)
VALUES (7);

INSERT INTO Manageri (IDManager)
VALUES (8);

INSERT INTO Manageri (IDManager)
VALUES (9);

INSERT INTO Manageri (IDManager)
VALUES (10);

INSERT INTO Manageri (IDManager)
VALUES (11);

INSERT INTO Manageri (IDManager)
VALUES (12);

INSERT INTO Manageri (IDManager)
VALUES (13);


--7 Inserare date �n Furnizori

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, IDAdresa)
VALUES (1, 'Chocolate Factory', 'chocolate.factory@gmail.com', '1234567890', 1);

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, IDAdresa)
VALUES (2, 'Carrefour', 'carrefour@gmail.com', '9876543210', 2);

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, IDAdresa)
VALUES (3, 'Lidl', 'lidl@gmail.com', '5558889999', 3);

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, IDAdresa)
VALUES (4, 'Ladorna', 'ladorna@gmail.com', '5912589999', 4);

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, IDAdresa)
VALUES (5, 'MegaImage', 'megaimage@gmail.com', '1548889939', 5);

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, IDAdresa)
VALUES (6, 'Oreo', 'oreo@gmail.com', '07558889987', 6);

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, IDAdresa)
VALUES (7, 'GusturiRomanesti', 'gusturiromanesti@gmail.com', '03225689999', 7);

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, IDAdresa)
VALUES (8, 'Mizo', 'mizo@gmail.com', '355779999', 8);

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, IDAdresa)
VALUES (9, 'ChocoMix', 'chocomix@gmail.com', '0658389979', 9);

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, IDAdresa)
VALUES (10, 'Pepsi', 'pepsi@gmail.com', '3338889991', 10);

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, IDAdresa)
VALUES (11, 'CocaCola', 'cocacola@gmail.com', '2158866499', 11);

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, IDAdresa)
VALUES (12, 'Agricult', 'agricult@gmail.com', '0345124695', 12);

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, IDAdresa)
VALUES (13, 'Fruitty', 'fruitty@gmail.com', '041548523', 13);


--8 Inserare date �n Arome

INSERT INTO Arome (IDAroma, Pret, NumeAroma)
VALUES (1, 3.00, 'Fistic');

INSERT INTO Arome (IDAroma, Pret, NumeAroma)
VALUES (2, 3.00, 'Ciocolata');

INSERT INTO Arome (IDAroma, Pret, NumeAroma)
VALUES (3, 3.00, 'Cookies and Cream');

INSERT INTO Arome (IDAroma, Pret, NumeAroma)
VALUES (4, 3.00, 'Bubblegum');

INSERT INTO Arome (IDAroma, Pret, NumeAroma)
VALUES (5, 3.00, 'Cirese');

INSERT INTO Arome (IDAroma, Pret, NumeAroma)
VALUES (6, 3.00, 'Kinder');

INSERT INTO Arome (IDAroma, Pret, NumeAroma)
VALUES (7, 3.00, 'Banane');

INSERT INTO Arome (IDAroma, Pret, NumeAroma)
VALUES (8, 3.00, 'Oreo');

INSERT INTO Arome (IDAroma, Pret, NumeAroma)
VALUES (9, 3.00, 'Caise');

INSERT INTO Arome (IDAroma, Pret, NumeAroma)
VALUES (10, 3.00, 'Menta');

INSERT INTO Arome (IDAroma, Pret, NumeAroma)
VALUES (11, 3.00, 'Alune');

INSERT INTO Arome (IDAroma, Pret, NumeAroma)
VALUES (12, 3.00, 'Portocale');

INSERT INTO Arome (IDAroma, Pret, NumeAroma)
VALUES (13, 3.00, 'Caramel');


--9 Inserare date �n Adresa

INSERT INTO Adresa (IDAdresa, Strada, Oras)
VALUES (1, 'Bulevardul Grigorescu 3', 'Bucuresti');

INSERT INTO Adresa (IDAdresa, Strada, Oras)
VALUES (2, 'Bulevardul Decebal 2', 'Bucuresti');

INSERT INTO Adresa (IDAdresa, Strada, Oras)
VALUES (3, 'Strada Lotrioarei 4', 'Bucuresti');

INSERT INTO Adresa (IDAdresa, Strada, Oras)
VALUES (4, 'Intrarea Odobesti 8', 'Bucuresti');

INSERT INTO Adresa (IDAdresa, Strada, Oras)
VALUES (5, 'Bulevardul Traian 9', 'Bucuresti');

INSERT INTO Adresa (IDAdresa, Strada, Oras)
VALUES (6, 'Strada Bordesti 4', 'Bucuresti');

INSERT INTO Adresa (IDAdresa, Strada, Oras)
VALUES (7, 'Bulevardul Victoriei 23', 'Bucuresti');

INSERT INTO Adresa (IDAdresa, Strada, Oras)
VALUES (8, 'Bulevardul Kiselef 17', 'Bucuresti');

INSERT INTO Adresa (IDAdresa, Strada, Oras)
VALUES (9, 'Bulevardul Roseti 7', 'Bucuresti');

INSERT INTO Adresa (IDAdresa, Strada, Oras)
VALUES (10, 'Bulevardul Unirii 1', 'Bucuresti');

INSERT INTO Adresa (IDAdresa, Strada, Oras)
VALUES (11, 'Strada Livezilor 18', 'Bucuresti');

INSERT INTO Adresa (IDAdresa, Strada, Oras)
VALUES (12, 'Soseaua Oltenitei 6', 'Bucuresti');

INSERT INTO Adresa (IDAdresa, Strada, Oras)
VALUES (13, 'Soseaua Pajura 34', 'Bucuresti');


--10 Inserare date �n tabela Vanzari

INSERT INTO Vanzari (IDClient, IDComanda, IDMagazin, DataVanzare, Suma)
VALUES (1, 1, 1, TO_DATE('2023-05-01', 'YYYY-MM-DD'), 5.99);

INSERT INTO Vanzari (IDClient, IDComanda, IDMagazin, DataVanzare, Suma)
VALUES (2, 2, 2, TO_DATE('2023-05-02', 'YYYY-MM-DD'), 30.50);

INSERT INTO Vanzari (IDClient, IDComanda, IDMagazin, DataVanzare, Suma)
VALUES (3, 4, 4, TO_DATE('2019-08-26', 'YYYY-MM-DD'), 6.57);

INSERT INTO Vanzari (IDClient, IDComanda, IDMagazin, DataVanzare, Suma)
VALUES (4, 7, 7, TO_DATE('2022-02-28', 'YYYY-MM-DD'), 30.50);

INSERT INTO Vanzari (IDClient, IDComanda, IDMagazin, DataVanzare, Suma)
VALUES (5, 3, 3, TO_DATE('2024-03-24', 'YYYY-MM-DD'), 12.50);

INSERT INTO Vanzari (IDClient, IDComanda, IDMagazin, DataVanzare, Suma)
VALUES (6, 5, 5, TO_DATE('2021-09-19', 'YYYY-MM-DD'), 42.70);

INSERT INTO Vanzari (IDClient, IDComanda, IDMagazin, DataVanzare, Suma)
VALUES (7, 6, 6, TO_DATE('2021-07-05', 'YYYY-MM-DD'), 3.99);

INSERT INTO Vanzari (IDClient, IDComanda, IDMagazin, DataVanzare, Suma)
VALUES (8, 10, 10, TO_DATE('2023-06-10', 'YYYY-MM-DD'), 60.00);

INSERT INTO Vanzari (IDClient, IDComanda, IDMagazin, DataVanzare, Suma)
VALUES (9, 8, 8, TO_DATE('2024-04-08', 'YYYY-MM-DD'), 43.40);

INSERT INTO Vanzari (IDClient, IDComanda, IDMagazin, DataVanzare, Suma)
VALUES (10, 9, 9, TO_DATE('2024-03-02', 'YYYY-MM-DD'), 3.75);

INSERT INTO Vanzari (IDClient, IDComanda, IDMagazin, DataVanzare, Suma)
VALUES (11, 13, 13, TO_DATE('2020-10-17', 'YYYY-MM-DD'), 15.25);

INSERT INTO Vanzari (IDClient, IDComanda, IDMagazin, DataVanzare, Suma)
VALUES (12, 12, 12, TO_DATE('2020-08-02', 'YYYY-MM-DD'), 12.15);

INSERT INTO Vanzari (IDClient, IDComanda, IDMagazin, DataVanzare, Suma)
VALUES (13, 11, 11, TO_DATE('2024-02-05', 'YYYY-MM-DD'), 36.40);



--11 Inserare date �n tabela OrarMagazine

INSERT INTO OrarMagazine (IDOrar, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (1, 'Luni', TO_DATE('08:00:00', 'HH24:MI:SS'), TO_DATE('20:00:00', 'HH24:MI:SS'));

INSERT INTO OrarMagazine (IDOrar, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (2, 'Marti', TO_DATE('09:00:00', 'HH24:MI:SS'), TO_DATE('21:00:00', 'HH24:MI:SS'));

INSERT INTO OrarMagazine (IDOrar, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (3, 'Miercuri', TO_DATE('10:00:00', 'HH24:MI:SS'), TO_DATE('22:00:00', 'HH24:MI:SS'));

INSERT INTO OrarMagazine (IDOrar, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (4, 'Joi', TO_DATE('07:30:00', 'HH24:MI:SS'), TO_DATE('19:30:00', 'HH24:MI:SS'));

INSERT INTO OrarMagazine (IDOrar, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (5, 'Vineri', TO_DATE('08:30:00', 'HH24:MI:SS'), TO_DATE('20:30:00', 'HH24:MI:SS'));

INSERT INTO OrarMagazine (IDOrar, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (6, 'Sambata', TO_DATE('07:00:00', 'HH24:MI:SS'), TO_DATE('19:00:00', 'HH24:MI:SS'));

INSERT INTO OrarMagazine (IDOrar, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (7, 'Duminica', TO_DATE('09:30:00', 'HH24:MI:SS'), TO_DATE('21:30:00', 'HH24:MI:SS'));

INSERT INTO OrarMagazine (IDOrar, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (8, 'Luni', TO_DATE('10:30:00', 'HH24:MI:SS'), TO_DATE('22:30:00', 'HH24:MI:SS'));

INSERT INTO OrarMagazine (IDOrar, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (9, 'Marti', TO_DATE('08:15:00', 'HH24:MI:SS'), TO_DATE('20:15:00', 'HH24:MI:SS'));

INSERT INTO OrarMagazine (IDOrar, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (10, 'Miercuri', TO_DATE('07:45:00', 'HH24:MI:SS'), TO_DATE('19:45:00', 'HH24:MI:SS'));

INSERT INTO OrarMagazine (IDOrar, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (11, 'Joi', TO_DATE('09:15:00', 'HH24:MI:SS'), TO_DATE('21:15:00', 'HH24:MI:SS'));

INSERT INTO OrarMagazine (IDOrar, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (12, 'Vineri', TO_DATE('08:45:00', 'HH24:MI:SS'), TO_DATE('20:45:00', 'HH24:MI:SS'));

INSERT INTO OrarMagazine (IDOrar, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (13, 'Sambata', TO_DATE('10:15:00', 'HH24:MI:SS'), TO_DATE('22:15:00', 'HH24:MI:SS'));


--12 Inserare date �n tabela Recenzii

INSERT INTO Recenzii (IDRecenzie, Rating, Comentariu, DataRecenzie, IDClient)
VALUES (1, 4, 'Foarte mul?umit de calitatea produsului!', TO_DATE('2023-05-01', 'YYYY-MM-DD'), 1);

INSERT INTO Recenzii (IDRecenzie, Rating, Comentariu, DataRecenzie, IDClient)
VALUES (2, 3, 'Produsul a fost OK, dar livrarea a �nt�rziat', TO_DATE('2023-05-02', 'YYYY-MM-DD'), 2);

INSERT INTO Recenzii (IDRecenzie, Rating, Comentariu, DataRecenzie, IDClient)
VALUES (3, 5, 'Absolut delicios', TO_DATE('2023-05-14', 'YYYY-MM-DD'), 3);

INSERT INTO Recenzii (IDRecenzie, Rating, Comentariu, DataRecenzie, IDClient)
VALUES (4, 2, 'Produsul a fost bun, dar cam scump', TO_DATE('2019-08-26', 'YYYY-MM-DD'), 4);

INSERT INTO Recenzii (IDRecenzie, Rating, Comentariu, DataRecenzie, IDClient)
VALUES (5, 5, 'Delicios', TO_DATE('2021-09-19', 'YYYY-MM-DD'), 5);

INSERT INTO Recenzii (IDRecenzie, Rating, Comentariu, DataRecenzie, IDClient)
VALUES (6, 4, 'Foarte buna inghetata', TO_DATE('2021-07-05', 'YYYY-MM-DD'), 6);

INSERT INTO Recenzii (IDRecenzie, Rating, Comentariu, DataRecenzie, IDClient)
VALUES (7, 3, 'A fost ok', TO_DATE('2022-02-28', 'YYYY-MM-DD'), 7);

INSERT INTO Recenzii (IDRecenzie, Rating, Comentariu, DataRecenzie, IDClient)
VALUES (8, 4, 'O inghetata delicioasa', TO_DATE('2024-04-08', 'YYYY-MM-DD'), 8);

INSERT INTO Recenzii (IDRecenzie, Rating, Comentariu, DataRecenzie, IDClient)
VALUES (9, 5, 'Una dintre cele mai bune inghetate', TO_DATE('2024-03-02', 'YYYY-MM-DD'), 9);

INSERT INTO Recenzii (IDRecenzie, Rating, Comentariu, DataRecenzie, IDClient)
VALUES (10, 5, 'O sa ma reintorc cu siguranta', TO_DATE('2023-06-10', 'YYYY-MM-DD'), 10);

INSERT INTO Recenzii (IDRecenzie, Rating, Comentariu, DataRecenzie, IDClient)
VALUES (11, 2, 'Prea scump', TO_DATE('2020-10-17', 'YYYY-MM-DD'), 11);

INSERT INTO Recenzii (IDRecenzie, Rating, Comentariu, DataRecenzie, IDClient)
VALUES (12, 4, 'Un gust unic si autentic', TO_DATE('2020-08-02', 'YYYY-MM-DD'), 12);

INSERT INTO Recenzii (IDRecenzie, Rating, Comentariu, DataRecenzie, IDClient)
VALUES (13, 5, 'Extraordinar', TO_DATE('2020-10-17', 'YYYY-MM-DD'), 13);


--13 Inserare date �n tabela Arome
INSERT INTO AdaugaAroma (IDClient, IDAroma)
VALUES (1, 1);

INSERT INTO AdaugaAroma (IDClient, IDAroma)
VALUES (2, 2);

INSERT INTO AdaugaAroma (IDClient, IDAroma)
VALUES (3, 3);

INSERT INTO AdaugaAroma (IDClient, IDAroma)
VALUES (4, 4);

INSERT INTO AdaugaAroma (IDClient, IDAroma)
VALUES (5, 5);

INSERT INTO AdaugaAroma (IDClient, IDAroma)
VALUES (6, 6);

INSERT INTO AdaugaAroma (IDClient, IDAroma)
VALUES (7, 7);

INSERT INTO AdaugaAroma (IDClient, IDAroma)
VALUES (8, 8);

INSERT INTO AdaugaAroma (IDClient, IDAroma)
VALUES (9, 9);

INSERT INTO AdaugaAroma (IDClient, IDAroma)
VALUES (10, 10);

INSERT INTO AdaugaAroma (IDClient, IDAroma)
VALUES (11, 11);

INSERT INTO AdaugaAroma (IDClient, IDAroma)
VALUES (12, 12);

INSERT INTO AdaugaAroma (IDClient, IDAroma)
VALUES (13, 13);


-- Verificare date

SELECT * FROM Magazine;

SELECT * FROM Clienti;

SELECT * FROM Comenzi;

SELECT * FROM Sponsor;

SELECT * FROM Angajati;

SELECT * FROM Manageri;

SELECT * FROM Furnizori;

SELECT * FROM Arome;

SELECT * FROM Adresa;

SELECT * FROM Vanzari;

SELECT * FROM OrarMagazine;

SELECT * FROM Recenzii;

SELECT * FROM AdaugaAroma;

-- Cereri SQL

SELECT * 
FROM Vanzari v
JOIN Comenzi c ON c.IDComanda = v.IDComanda
JOIN Clienti cl ON c.IDClient = cl.IDClient
WHERE cl.Nume = 'George' AND cl.Prenume = 'Alin';

SELECT c.IDComanda, COUNT(v.IDVanzare) AS NumarVanzari
FROM Comenzi c
INNER JOIN Vanzari v ON c.IDComanda = v.IDComanda
GROUP BY c.IDComanda;

SELECT cl.IDClient, cl.Prenume, cl.Nume,
    DECODE(rc.StatusReclamatie, 'Rezolvata', 'Rezolvata', 'In asteptare', 'NeRezolvata') AS StatusReclamatie
FROM Clienti cl
LEFT JOIN ReclamatiiClienti rc ON cl.IDClient = rc.IDClient
ORDER BY cl.Nume, NVL(rc.StatusReclamatie, 'Rezolvata') DESC;
