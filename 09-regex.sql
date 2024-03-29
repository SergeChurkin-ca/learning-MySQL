// Query the list of CITY names ending with vowels (a, e, i, o, u) 

SELECT DISTINCT CITY from STATION
WHERE CITY REGEXP('[aeiou]$');

// Query the list of CITY names starting with vowels (a, e, i, o, u) 
SELECT DISTINCT CITY from STATION
WHERE CITY REGEXP('^[aeiou]');

// Query the list of CITY names starts and ends with vowels (a, e, i, o, u) (* is used to combine matches)
SELECT DISTINCT CITY from STATION
WHERE CITY REGEXP('^[aeiou].*[aeiou]$')

// Query the list of CITY names that do not start with vowels (a, e, i, o, u)
SELECT DISTINCT CITY from STATION
WHERE CITY NOT REGEXP('^[aeiou]');
