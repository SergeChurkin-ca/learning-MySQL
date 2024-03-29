-- SQL Member Count
-- In this MySQL challenge, your query should return the names of the people who are reported to (excluding null values), 
-- the number of members that report to them, and the average age of those members as an integer.

SELECT ReportsTo, COUNT(ReportsTo) as Members, ROUND(AVG(Age)) as 'Average Age' FROM maintable_8ES74
WHERE ReportsTo IS NOT NULL
GROUP BY ReportsTo ORDER BY ReportsTo;

+ ----------------+-----------+------------ +
|   ReportsTo     | Members   | Average Age |
+ ----------------+-----------+------------ +
| Bob Boss        |  2        | 24          |
| Daniel Smith    |  1        | 22          |
| David S         |  1        | 25          |
| Jenny Richards  |  2        | 32          |
+ ----------------+-----------+------------ +

