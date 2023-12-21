-- 1. Selezionare tutte le nazioni il cui nome inizia con la P e la cui area è maggiore di 1000 kmq
SELECT *
FROM countries c 
WHERE c.name LIKE 'P%' AND c.area > 1000;

-- 2. Contare quante nazioni sono presenti nel database
SELECT COUNT(*) AS total_countries
FROM countries;

-- 3. Selezionare il nome delle regioni del continente europeo, in ordine alfabetico
SELECT *
FROM regions r  
JOIN continents c ON c.continent_id = r.continent_id 
WHERE c.name = 'Europe'
ORDER BY r.name ASC;