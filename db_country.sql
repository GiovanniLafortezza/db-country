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

-- 8. Selezionare il Gross domestic product (GDP) medio dello United Kingdom tra il 2000 e il 2010
SELECT AVG(cs.gdp) as gdp
FROM countries c 
JOIN country_stats cs ON cs.country_id = c.country_id 
WHERE c.name = 'United Kingdom' AND (cs.`year` >= '2000' AND cs.`year` <= '2010');

-- 9. Selezionare tutte le nazioni in cui si parla hindi, ordinate dalla più estesa alla meno estesa
SELECT c.name AS country, c.area AS area, l.`language` AS `language`
FROM countries c 
JOIN country_languages cl ON cl.country_id = c.country_id 
JOIN languages l ON l.language_id = cl.language_id 
WHERE l.`language` = 'hindi'
ORDER BY c.area DESC;

-- 10. Modificare la nazione di nome Italy, inserendo come national day il 2 giugno 1946
UPDATE countries SET national_day = '1946-06-02'
WHERE name = 'Italy';

-- 11. Selezionare le nazioni il cui national day è avvenuto prima del 1900, ordinate per national day dal più recente al meno recente
SELECT *
FROM countries c 
WHERE YEAR(c.national_day) <= '1900'
ORDER BY c.national_day DESC;

-- 12. Contare quante lingue sono parlate in Italia
SELECT COUNT(l.`language`) as `language`
FROM countries c 
JOIN country_languages cl ON cl.country_id = c.country_id 
JOIN languages l ON l.language_id = cl.language_id 
WHERE c.name = 'Italy';

-- 13. Per la regione Antarctica mostrare il valore dell’area totale e dell’area media delle nazioni
SELECT SUM(c.area) AS total_area, AVG(c.area) AS media_area
FROM countries c 
JOIN regions r ON r.region_id = c.region_id 
WHERE r.name = 'Antarctica';
