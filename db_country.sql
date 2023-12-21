-- 1. Selezionare tutte le nazioni il cui nome inizia con la P e la cui area è maggiore di 1000 kmq
SELECT *
FROM countries c 
WHERE c.name LIKE 'P%' AND c.area > 1000;

-- 2. Contare quante nazioni sono presenti nel database
SELECT COUNT(*) AS total_countries
FROM countries;