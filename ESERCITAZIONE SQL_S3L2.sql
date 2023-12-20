-- create a table
 CREATE TABLE Aeroporto (
    Citta TEXT(25) NOT NULL,
    Nazione TEXT(20) NOT NULL,
    NumPiste INTEGER(100) NULL
);

INSERT INTO Aeroporto(Citta,Nazione,NumPiste) VALUES 
    ('Cagliari', 'Italia', NULL),
    ('Roma','Italia',20),
    ('Napoli','Italia',20),
    ('Milano','Italia',30),
    ("Londra","UK",40),
    ("Torino","Italia", NULL),
    ("Bologna","Italia",6),
    ("NYC","USA",20),
    ("Mikonos","Grecia",1),
    ("Olbia","Italia", NULL);

-- create a table
CREATE TABLE Volo (
    IDVolo VARCHAR(10) NOT NULL,
    GiornoSett TEXT(20) NOT NULL,
    NumPiste INTEGER  NULL,
    CittaPart TEXT(25)NOT NULL,
    OraPart TIME NOT NULL ,
    CittaArr TEXT(25)NOT NULL,
    OraArr TIME NOT NULL,
    TipoAereo VARCHAR(30) NOT NULL
);

INSERT INTO Volo (IDVolo,GiornoSett,CittaPart,NumPiste,OraPart,CittaArr,OraArr,TipoAereo) VALUES 
                ('NZ123','Lunedì','Torino','3','07:00','Bologna','8:45','Boeing 747'),
                ('NZ1573','Lunedì','Milano','4','08:00','Roma','16:45','AIRBUS 747'),
                ('AZ2743','Giovedì','Roma','7','08:00','Bologna','8:45','Boeing 747'),
                ('NZ1573','Lunedì','Torino','6','08:00','Roma','8:45','Boeing 747'),
                ('AZ274','Mercoledì','Bologna','15','08:00','Roma','8:45','AIRBUS 747'),
                ('NZ173','Martedì','Milano','2','08:00','Roma','8:45','Boeing 747'),
                ('NZ157','Lunedì','Milano','23','08:00','Roma','8:45','Boeing 747'),
                ('AZ274','Domenica','Milano','5','08:00','Bologna','8:45','ARBUS 747'),
                ('NZ1503','Sabato','Milano','9','08:00','Roma','8:45','Boeing 747'),
                ('AZ274','Venerdì','Milano','3','08:00','Roma','8:45','Boeing 747');


 CREATE TABLE Aereo (
    TipoAereo VARCHAR(30) NOT NULL,
    NumPasseggeri INTEGER NOT NULL,
    QtaMerci VARCHAR(30) NOT NULL
);

INSERT INTO Aereo (TipoAereo,NumPasseggeri,QtaMerci) VALUES
    ('Boeing 747','230','550'),
    ('ARBUS 747','57','660'),
    ('Boeing 747','300','330');


SELECT Citta FROM Aeroporto WHERE  NumPiste IS NULL;

SELECT TipoAereo FROM Volo WHERE CittaPart ='Torino';

SELECT CittaPart FROM Volo WHERE CittaArr='Bologna';

SELECT CittaPart,CittaArr FROM Volo WHERE  IDVolo='AZ274';

