-- 1° Domanda: Creazione delle tabelle
CREATE TABLE vendite (
    IDTransazione INT PRIMARY KEY,
    CategoriaProdotto VARCHAR(255),
    Costo DECIMAL(10, 2),
    Sconto DECIMAL(10, 2)
);

CREATE TABLE dettagli_vendite (
    IDTransazione INT,
    DataTransazione DATE,
    Quantita INT,
    FOREIGN KEY (IDTransazione) REFERENCES vendite(IDTransazione)
);

	-- 2° Domanda: Inserimento dati nella tabella 'vendite'.
INSERT INTO vendite (IDTransazione, CategoriaProdotto, Costo, Sconto)
VALUES
(123, 'Abbigliamento', 100, 10),(213, 'Elettronica', 200, 15),(313, 'Libri', 50, 5),(413, 'Sport', 150, 20),(513, 'Giocattoli', 75, 10),
(623, 'Musica', 120, 12),(723, 'Film', 80, 8),(823, 'Cibo', 60, 6),(923, 'Bellezza', 140, 14),(1023, 'Salute', 160, 16),(1111, 'Abbigliamento', 100, 52),
(1112, 'Elettronica', 200, 15),(3122, 'Libri', 50, 5),(4132, 'Sport', 150, 20),(5132, 'Giocattoli', 75, 10),(6232, 'Musica', 120, 12),(7232, 'Film', 80, 8),
(8232, 'Cibo', 60, 6),(9232, 'Bellezza', 140, 70),(10232, 'Salute', 160, 16),(1234, 'Abbigliamento', 100, 10),(2134, 'Elettronica', 200, 15),(3134, 'Libri', 50, 5),
(4133, 'Sport', 150, 20),(5133, 'Giocattoli', 75, 85),(6233, 'Musica', 120, 12),(7233, 'Film', 80, 8),(8233, 'Cibo', 60, 6),(9233, 'Bellezza', 140, 14),
(3333, 'Salute', 160, 56),(5134, 'Giocattoli', 75, 10),(62324, 'Musica', 120, 12),(72324, 'Film', 80, 8),(82324, 'Cibo', 60, 75),(92324, 'Bellezza', 140, 14),
(102342, 'Salute', 160, 16),(12344, 'Abbigliamento', 100, 10),(21344, 'Elettronica', 200, 15),(31344, 'Libri', 50, 5),(41334, 'Sport', 150, 20),(51334, 'Giocattoli', 75, 80),
(62334, 'Musica', 120, 12),(72334, 'Film', 80, 8),(82334, 'Cibo', 60, 6),(92334, 'Bellezza', 140, 14),(33334, 'Salute', 160, 16);

	-- 2° Domanda: Inserimento dati nella tabella 'dettagli_vendite'.

INSERT INTO dettagli_vendite (IDTransazione, DataTransazione, Quantita)
VALUES 
(123, '2024-01-01', 2),(213, '2024-01-01', 3),(313, '2024-01-01', 1),(413, '2024-02-01', 2),(513, '2024-02-01', 4),(623, '2024-02-15', 3),(723, '2024-03-15', 2),(823, '2024-03-16', 4),
(923, '2024-03-16', 1),(1023, '2024-04-17', 2),(1111, '2024-04-17', 3),(1112, '2024-04-17', 1),(3122, '2024-05-18', 5),(4132, '2024-05-18', 2),(5132, '2024-05-18', 1),(6232, '2024-06-29', 2),
(7232, '2024-06-01', 6),(8232, '2024-06-01', 2),(9232, '2024-07-01', 7),(10232, '2024-07-01', 1),(1234, '2024-07-05', 10),(2134, '2024-08-05', 1),(3134, '2024-08-05', 2),(4133, '2024-09-08', 2),
(5133, '2024-09-08', 5),(6233, '2024-09-10', 2),(7233, '2024-09-10', 8),(8233, '2024-10-10', 6),(9233, '2024-10-18', 4),(3333, '2024-10-18', 6),(5134, '2024-10-26', 3),(62324, '2024-10-26', 2),
(72324, '2024-10-28', 8),(82324, '2024-11-02', 5),(92324, '2024-11-02', 4),(102342, '2024-11-02', 6),(12344, '2024-11-02', 0),(21344, '2024-11-05', 5),(31344, '2024-11-05', 5),(41334, '2024-11-06', 2),
(51334, '2024-11-07', 1),(62334, '2024-11-08', 1),(72334, '2024-12-09', 8),(82334, '2024-12-10', 6),(92334, '2024-12-17', 4),(33334, '2024-12-18', 1);

-- 3° Domanda: Seleziona tutte le vendite avvenute in una specifica data,es: "2024-01-17".
select * from dettagli_vendite where DataTransazione ='2024-01-17';

-- 3° Domanda: Elenco delle vendite con sconti maggiori del 50% .
select * from vendite where Sconto > 50;

-- 4° Domanda: Calcola il totale delle vendite (costo) per categoria
select CategoriaProdotto, sum(Costo) as TotaleVendite from vendite
group by CategoriaProdotto;

-- 4° Domanda: Trova il numero totale di prodotti venduti per ogni categoria. 
select CategoriaProdotto, sum(Quantita) as ProdottiVenduti from vendite v 
join dettagli_vendite d on v.IDTransazione = d.IDTransazione
group by CategoriaProdotto;

-- 5°Domanda: Seleziona le vendite dell'ultimo trimestre.
select* from vendite
join dettagli_vendite on vendite.IDTransazione = dettagli_vendite.IDTransazione
where DataTransazione >='2024-10-01' and DataTransazione <='2024-12-31';

-- 5°Domanda:Raggruppa le vendite per mese e calcola il totale delle vendite per ogni mese.
SELECT MONTH(DataTransazione) AS Mese,
SUM(Costo*Quantita) AS TotaleVendite FROM vendite v
JOIN dettagli_vendite d ON v.IDTransazione = d.IDTransazione 
GROUP BY MONTH(DataTransazione);

-- 7° Domanda: Trova la categoria con lo sconto medio più alto. 

SELECT CategoriaProdotto, 
AVG(Sconto) AS ScontoMedio FROM vendite 
GROUP BY CategoriaProdotto ORDER BY ScontoMedio
DESC LIMIT 1;

-- 8°Domanda: Confronta le vendite mese per mese per vedere l'incremento o il decremento delle vendite. 
           -- Calcola l’incremento o decremento mese per mese
SELECT MONTH(DataTransazione) AS Mese,
SUM(Costo) AS TotaleVenditeMese,
(SUM(Costo) - LAG(SUM(Costo), 1, 0) OVER(ORDER BY MONTH(DataTransazione))) AS VariazioneVendite FROM vendite v 
JOIN dettagli_vendite d ON v.IDTransazione = d.IDTransazione GROUP BY MONTH(DataTransazione);

-- 9°Domanda: Confronta le vendite totali in diverse stagioni. 
SELECT 
    CASE
        WHEN MONTH(DataTransazione) IN (3,4,5) THEN 'Primavera'
        WHEN MONTH(DataTransazione) IN (6,7,8) THEN 'Estate'
        WHEN MONTH(DataTransazione) IN (9,10,11) THEN 'Autunno'
        WHEN MONTH(DataTransazione) IN (12,1,2) THEN 'Inverno'
    END as Stagione,
    SUM(v.Costo * d.Quantita) as VenditeTotali
FROM 
    vendite v
JOIN 
    dettagli_vendite d ON v.IDTransazione = d.IDTransazione
GROUP BY 
    Stagione;

-- 10° Domanda:  Creare una tabella clienti con i campi IDCliente e IDVendita, 
-- scrivi una query per trovare i top 5 clienti con il maggior numero di acquisti.
CREATE TABLE clienti (
    IDCliente INT,
    IDVendita INT,
    FOREIGN KEY (IDVendita) REFERENCES vendite(IDTransazione)
);

INSERT INTO clienti (IDCliente, IDVendita) VALUES
(3, 7233),(2, 1234),(3, 3122),(2, 1111),(5, 413),
(6, 9233),(4, 9233),(8, 313),(4, 3333),(3, 5133),
(6, 9233),(4, 9233),(8, 313),(3, 3333),(3, 5133);

SELECT IDCliente, COUNT(IDVendita) AS NumeroAcquisti FROM clienti
GROUP BY IDCliente ORDER BY NumeroAcquisti DESC LIMIT 5;


