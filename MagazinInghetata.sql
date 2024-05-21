-- Creare tabele
--1
CREATE TABLE Magazine (
    IDMagazin INT PRIMARY KEY,
    NumeMagazin VARCHAR2(100) NOT NULL,
    FOREIGN KEY (IDAdresa) REFERENCES Adresa (IDAdresa), --modificare
    FOREIGN KEY (IDOrar) REFERENCES OrarMagazin(IDOrar), --modificare
    FOREIGN KEY (IDSponsor) REFERENCES  Sponsor(IDSponsor) --modificare
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
    DataComanda DATE NOT NULL,
    SumaTotala NUMBER(10, 2) NOT NULL,
    FOREIGN KEY (IDCient) REFERENCES Clienti(IDCient),
    FOREIGN KEY (IDAroma) REFERENCES Arome(IDAroma) --modificare
);

--4
CREATE TABLE Sponsor (
    IDSponsor INT PRIMARY KEY,
    Nume VARCHAR2(50) NOT NULL,
    Email VARCHAR2(100),
    NumarTelefon VARCHAR2(15),
    --am sters adresa
);

--5
CREATE TABLE Angajati (
    IDAngajat INT PRIMARY KEY,
    Nume VARCHAR2(100) NOT NULL,
    Prenume VARCHAR2(100) NOT NULL,
    DataAngajare DATE NOT NULL,
    Salariu DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY(IDMagazin) REFERENCES  Magazin(IDMagazin) --modificare
);

--6
CREATE TABLE Manageri (
    IDManager INT PRIMARY KEY,
    FOREIGN KEY (IDManager) REFERENCES Angajati(IDAngajat)
    --toata tabela e fututa, bafta la inserari
);

--7
CREATE TABLE Furnizori (
    IDFurnizor INT PRIMARY KEY,
    NumeFurnizor VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100),
    NumarTelefon VARCHAR2(15),
    FOREIGN KEY(IDAdresa) REFERENCES Adresa (IDAdresa) --modificare
);

--8
CREATE TABLE Arome (
    IDAroma INT PRIMARY KEY,
    Pret DECIMAL(10, 2) NOT NULL, --modificare
    NumeAroma VARCHAR2(100) NOT NULL,
    FOREIGN KEY (IDFurnizor) REFERENCES Furnizor (IDFurnizor)
);

--9
CREATE TABLE Adresa (

    IDAdresa INT PRIMARY KEY,
    Oras VARCHAR(255),
    Strada VARCHAR(255)
);

-- 10 tabela fututa
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
    OraDeschidere TIME,
    OraInchidere TIME,
);

--12 am schimbat numele tabelei
CREATE TABLE Recenzii (
    IDRecenzie INT PRIMARY KEY,
    Rating INT,
    Comentariu VARCHAR2(255),
    DataRecenzie DATE,
    FOREIGN KEY (IDClient) REFERENCES Clienti (IDClient)
);

--13 tabela noua
CREATE TABLE AdaugaAroma (
    IDClient INT,
    IDAroma INT,
    FOREIGN KEY (IDClient) REFERENCES Clienti (IDClient),
    FOREIGN KEY (IDAroma) REFERENCES Arome (IDAroma)
);


-- Inserare date în tabele

-- Inserare date în Magazine

INSERT INTO Magazine (IDMagazin, NumeMagazin, Locatie)
VALUES (1, 'Pufic', 'Bulevardul Grigorescu 3');

INSERT INTO Magazine (IDMagazin, NumeMagazin, Locatie)
VALUES (2, 'Pufic', 'Bulevardul Decebal 2');

INSERT INTO Magazine (IDMagazin, NumeMagazin, Locatie)
VALUES (3, 'Pufic', 'Strada Lotrioarei 4');

INSERT INTO Magazine (IDMagazin, NumeMagazin, Locatie)
VALUES (4, 'Pufic', 'Intrarea Odobesti 8');

INSERT INTO Magazine (IDMagazin, NumeMagazin, Locatie)
VALUES (5, 'Pufic', 'Bulevardul Traian 9');

INSERT INTO Magazine (IDMagazin, NumeMagazin, Locatie)
VALUES (6, 'Pufic', 'Strada Bordesti 4');

INSERT INTO Magazine (IDMagazin, NumeMagazin, Locatie)
VALUES (7, 'Pufic', 'Bulevardul Victoriei 23');

INSERT INTO Magazine (IDMagazin, NumeMagazin, Locatie)
VALUES (8, 'Pufic', 'Bulevardul Kiselef 17');

INSERT INTO Magazine (IDMagazin, NumeMagazin, Locatie)
VALUES (9, 'Pufic', 'Bulevardul Roseti 7');

INSERT INTO Magazine (IDMagazin, NumeMagazin, Locatie)
VALUES (10, 'Pufic', 'Bulevardul Unirii 1');

INSERT INTO Magazine (IDMagazin, NumeMagazin, Locatie)
VALUES (11, 'Pufic', 'Strada Livezilor 18');

INSERT INTO Magazine (IDMagazin, NumeMagazin, Locatie)
VALUES (12, 'Pufic', 'Soseaua Oltenitei 6');

INSERT INTO Magazine (IDMagazin, NumeMagazin, Locatie)
VALUES (13, 'Pufic', 'Soseaua Pajura 34');


-- Inserare date în Clienti

INSERT INTO Clienti (IDCient, Prenume, Nume, Email, NumarTelefon)
VALUES (1, 'Alin', 'George', 'alin.george@gmail.com', '1234567890');

INSERT INTO Clienti (IDCient, Prenume, Nume, Email, NumarTelefon)
VALUES (2, 'Teo', 'Vas', 'teo.vasile@gmail.com', '0987654321');

INSERT INTO Clienti (IDCient, Prenume, Nume, Email, NumarTelefon)
VALUES (3, 'Maria', 'Beni', 'maria.beni@gmail.com', '0687645321');

INSERT INTO Clienti (IDCient, Prenume, Nume, Email, NumarTelefon)
VALUES (4, 'Ana', 'Vasilescu', 'ana.vasilescu@gmail.com', '0775101171');

INSERT INTO Clienti (IDCient, Prenume, Nume, Email, NumarTelefon)
VALUES (5, 'Robi', 'Nico', 'robi.nico@gmail.com', '0216674478');

INSERT INTO Clienti (IDCient, Prenume, Nume, Email, NumarTelefon)
VALUES (6, 'Andrei', 'Paun', 'andrei.paun@gmail.com', '0217654321');

INSERT INTO Clienti (IDCient, Prenume, Nume, Email, NumarTelefon)
VALUES (7, 'George', 'Bob', 'george.bob@gmail.com', '0887654321');

INSERT INTO Clienti (IDCient, Prenume, Nume, Email, NumarTelefon)
VALUES (8, 'Gabi', 'Paki', 'gabi.paki@gmail.com', '087240521');

INSERT INTO Clienti (IDCient, Prenume, Nume, Email, NumarTelefon)
VALUES (9, 'Gabriel', 'Parintele', 'gabriel.parintele@gmail.com', '0314375461');

INSERT INTO Clienti (IDCient, Prenume, Nume, Email, NumarTelefon)
VALUES (10, 'Ionut', 'Pacate', 'ionut.pacate@gmail.com', '0354654321');

INSERT INTO Clienti (IDCient, Prenume, Nume, Email, NumarTelefon)
VALUES (11, 'Teodor', 'Ene', 'teodor.ene@gmail.com', '0259954624');

INSERT INTO Clienti (IDCient, Prenume, Nume, Email, NumarTelefon)
VALUES (12, 'Andra', 'Andreescu', 'andra.andreescu@gmail.com', '078101178');

INSERT INTO Clienti (IDCient, Prenume, Nume, Email, NumarTelefon, Adresa)
VALUES (13, 'Melisa', 'Marcel', 'melisa.marcel@gmail.com', '0554121363');


-- Inserare date în Comenzi

INSERT INTO Comenzi (IDComanda, IDCient, DataComanda, SumaTotala)
VALUES (1, 1, TO_DATE('2023-05-01 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 5.98);

INSERT INTO Comenzi (IDComanda, IDCient, DataComanda, SumaTotala)
VALUES (2, 1, TO_DATE('2023-05-02 15:45:00', 'YYYY-MM-DD HH24:MI:SS'), 6.98);

INSERT INTO Comenzi (IDComanda, IDCient, DataComanda, SumaTotala)
VALUES (3, 2, TO_DATE('2023-06-02 13:42:00', 'YYYY-MM-DD HH24:MI:SS'), 7.50);

INSERT INTO Comenzi (IDComanda, IDCient, DataComanda, SumaTotala)
VALUES (4, 3, TO_DATE('2024-08-24 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3.00);

INSERT INTO Comenzi (IDComanda, IDCient, DataComanda, SumaTotala)
VALUES (5, 4, TO_DATE('2024-07-30 11:35:00', 'YYYY-MM-DD HH24:MI:SS'), 11.82);

INSERT INTO Comenzi (IDComanda, IDCient, DataComanda, SumaTotala)
VALUES (6, 5, TO_DATE('2024-01-02 17:41:00', 'YYYY-MM-DD HH24:MI:SS'), 14.23);

INSERT INTO Comenzi (IDComanda, IDCient, DataComanda, SumaTotala)
VALUES (7, 6, TO_DATE('2024-08-21 14:48:00', 'YYYY-MM-DD HH24:MI:SS'), 9.95);

INSERT INTO Comenzi (IDComanda, IDCient, DataComanda, SumaTotala)
VALUES (8, 7, TO_DATE('2024-03-09 11:39:00', 'YYYY-MM-DD HH24:MI:SS'), 8.92);

INSERT INTO Comenzi (IDComanda, IDCient, DataComanda, SumaTotala)
VALUES (9, 8, TO_DATE('2024-12-02 10:28:00', 'YYYY-MM-DD HH24:MI:SS'), 12.24);

INSERT INTO Comenzi (IDComanda, IDCient, DataComanda, SumaTotala)
VALUES (10, 9, TO_DATE('2024-11-29 19:25:00', 'YYYY-MM-DD HH24:MI:SS'), 8.55);

INSERT INTO Comenzi (IDComanda, IDCient, DataComanda, SumaTotala)
VALUES (11, 10, TO_DATE('2024-09-25 18:18:00', 'YYYY-MM-DD HH24:MI:SS'), 11.99);

INSERT INTO Comenzi (IDComanda, IDCient, DataComanda, SumaTotala)
VALUES (12, 11, TO_DATE('2024-01-12 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), 8.20);

INSERT INTO Comenzi (IDComanda, IDCient, DataComanda, SumaTotala)
VALUES (13, 12, TO_DATE('2024-06-22 20:55:00', 'YYYY-MM-DD HH24:MI:SS'), 5.58);


-- Inserare date în Sponsor

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon, Adresa)
VALUES (1, 'DairyQueen', 'dairy.queen@gmail.com', '0880101170', 'Calea Victoriei 1');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon, Adresa)
VALUES (2, 'Alpro', 'alpro@gmail.com', '0770101170', 'Calea Victoriei 13');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon, Adresa)
VALUES (3, 'Olympus', 'olympus@gmail.com', '021101170', 'Unirii 11');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon, Adresa)
VALUES (4, 'Zuzu', 'zuzu@gmail.com', '0880187170', 'Calea Rahovei 18');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon, Adresa)
VALUES (5, 'Heidi', 'heidi@gmail.com', '0310107870', 'Ferentati 31');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon, Adresa)
VALUES (6, 'Milka', 'milka@gmail.com', '0550101170', 'Livezilor 33');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon, Adresa)
VALUES (7, 'Michelin', 'michelin@gmail.com', '0450101170', 'Calea Victoriei 13');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon, Adresa)
VALUES (8, 'PlusINC', 'plus@gmail.com', '0225434587', 'Calea Vacaresti 7');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon, Adresa)
VALUES (9, 'Ikea', 'ikea@gmail.com', '0334101170', 'Pallady 12');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon, Adresa)
VALUES (10, 'XXLUX', 'xxlux@gmail.com', '0775801170', 'Bulevardul Decebal 20');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon, Adresa)
VALUES (11, 'ToyINC', 'toy@gmail.com', '0880108541', 'Unirii 13');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon, Adresa)
VALUES (12, 'Decathlon', 'decathlon@gmail.com', '0780254170', 'Rahova 32');

INSERT INTO Sponsor (IDSponsor, Nume, Email, NumarTelefon, Adresa)
VALUES (13, 'Metro', 'metro@gmail.com', '0586401170', 'Bulevardul Traian 47');


-- Inserare date în Manageri

INSERT INTO Manageri (IDManager, Prenume, Nume, Email, NumarTelefon)
VALUES (1, 'Ghita', 'Portita', 'ghita.portita@gmail.com', '1112223333');

INSERT INTO Manageri (IDManager, Prenume, Nume, Email, NumarTelefon)
VALUES (2, 'Billy', 'Williams', 'billyb.williams@gmail.com', '4445556666');

INSERT INTO Manageri (IDManager, Prenume, Nume, Email, NumarTelefon)
VALUES (3, 'Cristina', 'Felicia', 'cristina.felicia@gmail.com', '0314375463');

INSERT INTO Manageri (IDManager, Prenume, Nume, Email, NumarTelefon)
VALUES (4, 'Luiza', 'Bordei', 'luiza.bordei@gmail.com', '0216675476');

INSERT INTO Manageri (IDManager, Prenume, Nume, Email, NumarTelefon)
VALUES (5, 'Ana', 'Badea', 'ana.badea@gmail.com', '0775123549');

INSERT INTO Manageri (IDManager, Prenume, Nume, Email, NumarTelefon)
VALUES (6, 'Liana', 'Soare', 'liana.soare@gmail.com', '0154354887');

INSERT INTO Manageri (IDManager, Prenume, Nume, Email, NumarTelefon)
VALUES (7, 'Alexandra', 'Pagnejer', 'alexandra.pagnejer@gmail.com', '0354685157');

INSERT INTO Manageri (IDManager, Prenume, Nume, Email, NumarTelefon)
VALUES (8, 'Diana', 'Vasile', 'diana.vasile@gmail.com', '055854632');

INSERT INTO Manageri (IDManager, Prenume, Nume, Email, NumarTelefon)
VALUES (9, 'Alexandra', 'Stroilesc', 'alexandra.stroilesc@gmail.com', '021698769');

INSERT INTO Manageri (IDManager, Prenume, Nume, Email, NumarTelefon)
VALUES (10, 'Sebi', 'Andrescu', 'sebi.andrescu@gmail.com', '04156874');

INSERT INTO Manageri (IDManager, Prenume, Nume, Email, NumarTelefon)
VALUES (11, 'Norbert', 'Manolache', 'norbert.manolache@gmail.com', '06524357');

INSERT INTO Manageri (IDManager, Prenume, Nume, Email, NumarTelefon)
VALUES (12, 'Vladimir', 'Voinea', 'voinea.vladimir@gmail.com', '0884565412');

INSERT INTO Manageri (IDManager, Prenume, Nume, Email, NumarTelefon)
VALUES (13, 'Felix', 'Horia', 'felix.horia@gmail.com', '0956223696');


-- Inserare date pentru Angajati

INSERT INTO Angajati (AngajatID, Nume, Prenume, DataAngajare, Salariu)
VALUES (1, 'Popescu', 'Ion', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 3500.00);

INSERT INTO Angajati (AngajatID, Nume, Prenume, DataAngajare, Salariu)
VALUES (2, 'Ionescu', 'Maria', TO_DATE('2019-05-20', 'YYYY-MM-DD'), 4000.00);

INSERT INTO Angajati (AngajatID, Nume, Prenume, DataAngajare, Salariu)
VALUES (3, 'Constantinescu', 'Ana', TO_DATE('2021-03-10', 'YYYY-MM-DD'), 3200.00);

INSERT INTO Angajati (AngajatID, Nume, Prenume, DataAngajare, Salariu)
VALUES (4, 'Dumitrescu', 'Mihai', TO_DATE('2018-11-05', 'YYYY-MM-DD'), 4200.00);

INSERT INTO Angajati (AngajatID, Nume, Prenume, DataAngajare, Salariu)
VALUES (5, 'Armin', 'Matei', TO_DATE('2024-05-14', 'YYYY-MM-DD'), 2200.00);

INSERT INTO Angajati (AngajatID, Nume, Prenume, DataAngajare, Salariu)
VALUES (6, 'Giunca', 'Andrei', TO_DATE('2024-05-22', 'YYYY-MM-DD'), 2000.00);

INSERT INTO Angajati (AngajatID, Nume, Prenume, DataAngajare, Salariu)
VALUES (7, 'Barca', 'Stefan', TO_DATE('2023-10-03', 'YYYY-MM-DD'), 2700.00);

INSERT INTO Angajati (AngajatID, Nume, Prenume, DataAngajare, Salariu)
VALUES (8, 'Stefanescu', 'Andi', TO_DATE('2022-09-14', 'YYYY-MM-DD'), 3000.00);

INSERT INTO Angajati (AngajatID, Nume, Prenume, DataAngajare, Salariu)
VALUES (9, 'Scarlat', 'Ana', TO_DATE('2021-07-23', 'YYYY-MM-DD'), 4000.00);

INSERT INTO Angajati (AngajatID, Nume, Prenume, DataAngajare, Salariu)
VALUES (10, 'Enache', 'Maria', TO_DATE('2020-11-17', 'YYYY-MM-DD'), 4200.00);

INSERT INTO Angajati (AngajatID, Nume, Prenume, DataAngajare, Salariu)
VALUES (11, 'Ridu', 'Monica', TO_DATE('2019-12-08', 'YYYY-MM-DD'), 4300.00);

INSERT INTO Angajati (AngajatID, Nume, Prenume, DataAngajare, Salariu)
VALUES (12, 'Enica', 'Raluca', TO_DATE('2023-08-25', 'YYYY-MM-DD'), 3100.00);

INSERT INTO Angajati (AngajatID, Nume, Prenume, DataAngajare, Salariu)
VALUES (13, 'Anapol', 'Denisa', TO_DATE('2022-09-30', 'YYYY-MM-DD'), 3700.00);


-- Inserare date în Furnizori

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, Adresa)
VALUES (1, 'Chocolate Factory', 'chocolate.factory@gmail.com', '1234567890', 'Iuliu Maniu 3');

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, Adresa)
VALUES (2, 'Carrefour', 'carrefour@gmail.com', '9876543210', 'Georgescu  1');

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, Adresa)
VALUES (3, 'Lidl', 'lidl@gmail.com', '5558889999', 'Lemnisorului 3');

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, Adresa)
VALUES (4, 'Ladorna', 'ladorna@gmail.com', '5912589999', 'Pallady 3');

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, Adresa)
VALUES (5, 'MegaImage', 'megaimage@gmail.com', '1548889939', 'Clabucet 4');

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, Adresa)
VALUES (6, 'Oreo', 'oreo@gmail.com', '07558889987', 'Strada Dornei 21');

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, Adresa)
VALUES (7, 'GusturiRomanesti', 'gusturiromanesti@gmail.com', '03225689999', 'Calea Vacaresti 3');

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, Adresa)
VALUES (8, 'Mizo', 'mizo@gmail.com', '355779999', 'Strada Oltului 49');

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, Adresa)
VALUES (9, 'ChocoMix', 'chocomix@gmail.com', '0658389979', 'Aviatiei 21');

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, Adresa)
VALUES (10, 'Pepsi', 'pepsi@gmail.com', '3338889991', 'Ghencea 18');

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, Adresa)
VALUES (11, 'CocaCola', 'cocacola@gmail.com', '2158866499', 'Rasaritului 5');

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, Adresa)
VALUES (12, 'Agricult', 'agricult@gmail.com', '0345124695', 'Obor 23');

INSERT INTO Furnizori (IDFurnizor, NumeFurnizor, Email, NumarTelefon, Adresa)
VALUES (13, 'Fruitty', 'fruitty@gmail.com', '041548523', 'Bulevardul Kiselef 15');


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

INSERT INTO Arome (IDAroma, NumeAroma)
VALUES (7, 'Banane');

INSERT INTO Arome (IDAroma, NumeAroma)
VALUES (8, 'Oreo');

INSERT INTO Arome (IDAroma, NumeAroma)
VALUES (9, 'Caise');

INSERT INTO Arome (IDAroma, NumeAroma)
VALUES (10, 'Menta');

INSERT INTO Arome (IDAroma, NumeAroma)
VALUES (11, 'Alune');

INSERT INTO Arome (IDAroma, NumeAroma)
VALUES (12, 'Portocale');

INSERT INTO Arome (IDAroma, NumeAroma)
VALUES (13, 'Caramel');



-- Inserare date în tabela Vanzari

INSERT INTO Vanzari (IDVanzare, IDComanda, DataVanzare, Cantitate, PretUnitar)
VALUES (1, 1, TO_DATE('2023-05-01', 'YYYY-MM-DD'), 1, 5.99);

INSERT INTO Vanzari (IDVanzare, IDComanda, DataVanzare, Cantitate, PretUnitar)
VALUES (2, 2, TO_DATE('2023-05-02', 'YYYY-MM-DD'), 5, 30.50);

INSERT INTO Vanzari (IDVanzare, IDComanda, DataVanzare, Cantitate, PretUnitar)
VALUES (3, 4, TO_DATE('2019-08-26', 'YYYY-MM-DD'), 2, 6.57);

INSERT INTO Vanzari (IDVanzare, IDComanda, DataVanzare, Cantitate, PretUnitar)
VALUES (4, 7, TO_DATE('2022-02-28', 'YYYY-MM-DD'), 5, 30.50);

INSERT INTO Vanzari (IDVanzare, IDComanda, DataVanzare, Cantitate, PretUnitar)
VALUES (5, 3, TO_DATE('2024-03-24', 'YYYY-MM-DD'), 3, 12.55);

INSERT INTO Vanzari (IDVanzare, IDComanda, DataVanzare, Cantitate, PretUnitar)
VALUES (6, 5, TO_DATE('2021-09-19', 'YYYY-MM-DD'), 6, 42.70);

INSERT INTO Vanzari (IDVanzare, IDComanda, DataVanzare, Cantitate, PretUnitar)
VALUES (7, 6, TO_DATE('2021-07-05', 'YYYY-MM-DD'), 1, 3.99);

INSERT INTO Vanzari (IDVanzare, IDComanda, DataVanzare, Cantitate, PretUnitar)
VALUES (8, 10, TO_DATE('2023-06-10', 'YYYY-MM-DD'), 10, 60.00);

INSERT INTO Vanzari (IDVanzare, IDComanda, DataVanzare, Cantitate, PretUnitar)
VALUES (9, 8, TO_DATE('2024-04-08', 'YYYY-MM-DD'), 7, 43.40);

INSERT INTO Vanzari (IDVanzare, IDComanda, DataVanzare, Cantitate, PretUnitar)
VALUES (10, 9, TO_DATE('2024-03-02', 'YYYY-MM-DD'), 1, 3.75);

INSERT INTO Vanzari (IDVanzare, IDComanda, DataVanzare, Cantitate, PretUnitar)
VALUES (11, 13, TO_DATE('2020-10-17', 'YYYY-MM-DD'), 4, 15.25);

INSERT INTO Vanzari (IDVanzare, IDComanda, DataVanzare, Cantitate, PretUnitar)
VALUES (12, 12, TO_DATE('2020-08-02', 'YYYY-MM-DD'), 3, 12.15);

INSERT INTO Vanzari (IDVanzare, IDComanda, DataVanzare, Cantitate, PretUnitar)
VALUES (13, 11, TO_DATE('2024-02-05', 'YYYY-MM-DD'), 6, 36.40);


-- Inserare date în tabela OrarMagazine

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (1, 'Luni', '09:00', '21:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (1, 'Marti', '09:00', '21:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (1, 'Miercuri', '09:00', '21:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (1, 'Joi', '09:00', '21:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (1, 'Vineri', '09:00', '21:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (1, 'Sambata', '10:00', '18:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (1, 'Duminica', '10:00', '18:00');


INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (2, 'Luni', '09:00', '21:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (2, 'Marti', '09:00', '21:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (2, 'Miercuri', '09:00', '21:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (2, 'Joi', '09:00', '21:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (2, 'Vineri', '09:00', '21:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (2, 'Sambata', '10:00', '18:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (2, 'Duminica', '10:00', '18:00');


INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (3, 'Luni', '09:00', '21:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (3, 'Marti', '09:00', '21:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (3, 'Miercuri', '09:00', '21:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (3, 'Joi', '09:00', '21:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (3, 'Vineri', '09:00', '21:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (3, 'Sambata', '10:00', '18:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (3, 'Duminica', '10:00', '18:00');


INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (4, 'Luni', '09:00', '21:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (4, 'Marti', '09:00', '21:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (4, 'Miercuri', '09:00', '21:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (4, 'Joi', '09:00', '21:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (4, 'Vineri', '09:00', '21:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (4, 'Sambata', '10:00', '18:00');

INSERT INTO OrarMagazine (IDMagazin, ZiuaSaptamanii, OraDeschidere, OraInchidere)
VALUES (4, 'Duminica', '10:00', '18:00');


-- Inserare date în tabela RecenziiProduse

INSERT INTO RecenziiProduse (IDRecenzie, IDCient, Rating, Comentariu, DataRecenzie)
VALUES (1, 1, 4, 'Foarte mul?umit de calitatea produsului!', TO_DATE('2023-05-01', 'YYYY-MM-DD'));

INSERT INTO RecenziiProduse (IDRecenzie, IDCient, Rating, Comentariu, DataRecenzie)
VALUES (2, 2, 3, 'Produsul a fost OK, dar livrarea a întârziat', TO_DATE('2023-05-02', 'YYYY-MM-DD'));

INSERT INTO RecenziiProduse (IDRecenzie, IDCient, Rating, Comentariu, DataRecenzie)
VALUES (3, 3, 5, 'Absolut delicios', TO_DATE('2023-05-14', 'YYYY-MM-DD'));

INSERT INTO RecenziiProduse (IDRecenzie, IDCient, Rating, Comentariu, DataRecenzie)
VALUES (4, 4, 2, 'Produsul a fost bun, dar cam scump', TO_DATE('2019-08-26', 'YYYY-MM-DD'));

INSERT INTO RecenziiProduse (IDRecenzie, IDCient, Rating, Comentariu, DataRecenzie)
VALUES (5, 5, 5, 'Delicios', TO_DATE('2021-09-19', 'YYYY-MM-DD'));

INSERT INTO RecenziiProduse (IDRecenzie, IDCient, Rating, Comentariu, DataRecenzie)
VALUES (6, 6, 4, 'Foarte buna inghetata', TO_DATE('2021-07-05', 'YYYY-MM-DD'));

INSERT INTO RecenziiProduse (IDRecenzie, IDCient, Rating, Comentariu, DataRecenzie)
VALUES (7, 7, 3, 'A fost ok', TO_DATE('2022-02-28', 'YYYY-MM-DD'));

INSERT INTO RecenziiProduse (IDRecenzie, IDCient, Rating, Comentariu, DataRecenzie)
VALUES (8, 8, 4, 'O inghetata delicioasa', TO_DATE('2024-04-08', 'YYYY-MM-DD'));

INSERT INTO RecenziiProduse (IDRecenzie, IDCient, Rating, Comentariu, DataRecenzie)
VALUES (9, 9, 5, 'Una dintre cele mai bune inghetate', TO_DATE('2024-03-02', 'YYYY-MM-DD'));

INSERT INTO RecenziiProduse (IDRecenzie, IDCient, Rating, Comentariu, DataRecenzie)
VALUES (10, 10, 5, 'O sa ma reintorc cu siguranta', TO_DATE('2023-06-10', 'YYYY-MM-DD'));

INSERT INTO RecenziiProduse (IDRecenzie, IDCient, Rating, Comentariu, DataRecenzie)
VALUES (11, 11, 2, 'Prea scump', TO_DATE('2020-10-17', 'YYYY-MM-DD'));

INSERT INTO RecenziiProduse (IDRecenzie, IDCient, Rating, Comentariu, DataRecenzie)
VALUES (12, 12, 4, 'Un gust unic si autentic', TO_DATE('2020-08-02', 'YYYY-MM-DD'));

INSERT INTO RecenziiProduse (IDRecenzie, IDCient, Rating, Comentariu, DataRecenzie)
VALUES (13, 13, 5, 'Extraordinar', TO_DATE('2020-10-17', 'YYYY-MM-DD'));


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

SELECT * FROM Vanzari
ORDER BY IDComanda;

SELECT * FROM OrarMagazine;

SELECT * FROM RecenziiProduse;


--Cereri SQL

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
