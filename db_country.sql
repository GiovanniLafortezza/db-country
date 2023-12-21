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

-- 4. Contare quante regioni sono presenti nel continente Africa
SELECT COUNT(*) AS total_continents
FROM regions r 
JOIN continents c ON c.continent_id = r.continent_id 
WHERE c.name = 'Africa';

-- 5. Selezionare quali nazioni non hanno un national day
SELECT *
FROM countries c 
WHERE c.national_day IS NULL;

-- 6. Per ogni nazione, in ordine alfabetico, selezionare il nome, la regione e il continente
SELECT  c.name AS country, r.name AS region, c2.name AS continent
FROM countries c 
JOIN regions r ON r.region_id = c.region_id 
JOIN continents c2 ON c2.continent_id = r.continent_id 
ORDER BY c.name ASC;

-- 7. Selezionare le lingue ufficiali dell’Albania
SELECT cl.official AS official , l.`language` AS `language` 
FROM countries c 
JOIN country_languages cl ON cl.country_id = c.country_id 
JOIN languages l ON l.language_id = cl.language_id 
WHERE c.name = 'Albania' AND cl.official = 1 ;