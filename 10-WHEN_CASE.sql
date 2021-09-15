/*
Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

    Equilateral: It's a triangle with 

sides of equal length.
Isosceles: It's a triangle with
sides of equal length.
Scalene: It's a triangle with

    sides of differing lengths.
    Not A Triangle: The given values of A, B, and C don't form a triangle.

Input Format

The TRIANGLES table is described as follows:
*/

SELECT CASE 
WHEN A + B > C and B + C > A and A + C > B 
    THEN CASE
        WHEN A = B and B = C and A = C THEN 'Equilateral'
        WHEN A = B or B + C or C = A THEN 'Isosceles'
        ELSE 'Scalene'
    END
ELSE 'Not A Triangle'
FROM TRIANGLES;
