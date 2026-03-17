-------------------------------------------------------------------------------------
--Lesson 10 – Aggregations (COUNT, SUM, AVG, GROUP BY)
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
--SECTION 1 – COUNT Aggregations (10 Questions)
-------------------------------------------------------------------------------------

/*1. How many total properties are in the database?*/
 SELECT * FROM property24;

/*2. How many properties are listed in each province?*/
SELECT COUNT(PROPERTY_ID)AS NU_PROPERTIES, PROVINCE
fROM PROPERTY24
GROUP BY PROVINCE;

/*3. How many properties are listed in each city?*/
SELECT CITY, COUNT(PROPERTY_ID)AS PROPERTY_LISTED
FROM PROPERTY24
GROUP BY CITY;

/*4. How many properties have more than 2 bedrooms?*/

SELECT COUNT(PROPERTY_ID) AS PROPERTY_COUNT
FROM PROPERTY24
WHERE BEDROOMS > 2;


/*5. How many properties have 2 or more bathrooms?*/

SELECT COUNT(PROPERTY_ID) AS PROPERTY_COUNT
FROM PROPERTY24
WHERE BATHROOMS >= 2;



/*6. How many properties have parking for at least 2 cars?*/

SELECT COUNT(PROPERTY_ID) AS PROPERTY_COUNT
FROM PROPERTY24
WHERE PARKING >= 2;


/*7. How many properties are priced above R3,000,000?*/
SELECT COUNT(PROPERTY_ID)AS PROPERTY_COUNT
FROM PROPERTY24
WHERE PROPERTY_PRICE > 3000000;


/*8. How many properties are in Gauteng?*/
SELECT COUNT(PROPERTY_ID) PROPERTY_IN_GAUTENG
FROM PROPERTY24
WHERE PROVINCE ='GAUTENG';

/*9. How many properties per province have floor size greater than 200?*/
SELECT COUNT(PROPERTY_ID)AS PROPERTY_ID,PROVINCE
FROM PROPERTY24
WHERE FLOOR_SIZE >200
GROUP BY  PROVINCE;


/*10. How many distinct provinces are in the table?*/
SELECT COUNT(DISTINCT PROVINCE)AS NUMBER_OF_PROVINCES
FROM PROPERTY24;

---------------------------------------------------------------------------
--SECTION 2 – SUM Aggregations (10 Questions)
---------------------------------------------------------------------------

/*11. What is the total value of all properties combined?*/
SELECT
     SUM(CAST(PROPERTY_PRICE AS BIGINT))AS SUM_OF_PROPERTY
FROM PROPERTY24;


/*12. What is the total property value per province?*/
SELECT PROVINCE, 
       SUM(CAST(PROPERTY_PRICE AS BIGINT)) AS TOTAL_PROPERTY_VALUE
FROM PROPERTY24
GROUP BY PROVINCE;

/*13. What is the total property value per city?*/
SELECT CITY, 
     SUM(CAST(PROPERTY_PRICE AS BIGINT))AS TOTAL_VALUE
FROM PROPERTY24
GROUP BY CITY;

/*14. What is the total monthly repayment for all properties?*/
SELECT SUM(CAST(MONTHLY_REPAYMENT AS BIGINT))AS TOTAL_MONTHLY_REPAYMENT
FROM PROPERTY24;

/*15. What is the total monthly repayment per province?*/
SELECT PROVINCE,
      SUM(CAST(MONTHLY_REPAYMENT AS BIGINT))AS TOTAL_MONTHLY_REPAYMENT
FROM PROPERTY24
GROUP BY PROVINCE;


/*16. What is the total once-off cost for all properties?*/
SELECT SUM(CAST(TOTAL_ONCE_OFF_COSTS AS BIGINT))AS SUM_TOTAL_ONCE_OFF_COST
FROM PROPERTY24;

/*17. What is the total once-off cost per province?*/
SELECT PROVINCE,
       SUM(CAST(TOTAL_ONCE_OFF_COSTS AS BIGINT))AS SUM_TOTAL_ONCE_OFF_COST
FROM PROPERTY24
GROUP BY PROVINCE;

/*18. What is the total property value for Gauteng?*/
SELECT SUM( CAST(PROPERTY_PRICE AS BIGINT)) AS TOTAL_PROPERTY_PRICE_GAUTENG
FROM PROPERTY24
WHERE PROVINCE ='GAUTENG';

/*19. What is the total property value for properties priced above R4,000,000?*/
SELECT SUM(CAST(PROPERTY_PRICE AS BIGINT))AS SUM_TOTAL_PROPERTIES
FROM PROPERTY24
WHERE PROPERTY_PRICE >4000000;

/*20. What is the total minimum gross monthly income required per province?*/
SELECT PROVINCE,
      SUM(CAST(MIN_GROSS_MONTHLY_INCOME AS BIGINT)) AS TOTAL_MIN_GROSS_MONTHLY_INCOME
FROM PROPERTY24
GROUP BY PROVINCE;

--------------------------------------------------------------------------------
--SECTION 3 – AVG Aggregations (10 Questions)
--------------------------------------------------------------------------------
/*21. What is the average property price overall?*/
SELECT AVG(CAST(PROPERTY_PRICE AS BIGINT)) AS AVG_PROPERTY_PRICE_OVERALL
FROM PROPERTY24;


/*22. What is the average property price per province?*/

SELECT PROVINCE,
      AVG(CAST(PROPERTY_PRICE AS BIGINT)) AS AVG_PROPERTY_PRICE
FROM PROPERTY24
GROUP BY PROVINCE;


/*23. What is the average property price per city?*/
SELECT CITY,
      AVG(CAST(PROPERTY_PRICE AS BIGINT)) AS AVG_PROPERTY_PRICE_PER_CITY
FROM PROPERTY24
GROUP BY CITY;


/*24. What is the average number of bedrooms per province?*/

SELECT PROVINCE,
       AVG(CAST(BEDROOMS AS INT)) AS AVG_BEDROOMS_PER_PROVINCE
FROM PROPERTY24
GROUP BY PROVINCE;

/*25. What is the average number of bathrooms per province?*/
SELECT PROVINCE,
       AVG(CAST(BATHROOMS AS INT)) AS AVG_BATHROOMS_PER_PROVINCE
FROM PROPERTY24
GROUP BY PROVINCE;


/*26. What is the average floor size per province?*/
SELECT PROVINCE,
       AVG(FLOOR_SIZE ) AS AVG_FLOOR_SIZE_PER_PROVINCE
FROM PROPERTY24
GROUP BY PROVINCE;


/*27. What is the average monthly repayment per province?*/
SELECT PROVINCE,
       AVG(MONTHLY_REPAYMENT) AS AVG_MONTHLY_REPAYMENT
FROM PROPERTY24
GROUP BY PROVINCE;

/*28. What is the average once-off cost per province?*/
SELECT PROVINCE,
       AVG(CAST(TOTAL_ONCE_OFF_COSTS AS BIGINT)) AS AVG_tOTAL_ONCE_OFF_COSTS
FROM PROPERTY24
GROUP BY PROVINCE;


/*29. What is the average minimum gross monthly income per province?*/
SELECT PROVINCE,
       AVG(MIN_GROSS_MONTHLY_INCOME) AS AVG_MIN_GROSS_MONTHLY_INCOME
FROM PROPERTY24
GROUP BY PROVINCE;

/*30. What is the average property price for properties above R3,000,000?*/
SELECT 
       AVG(CAST(PROPERTY_PRICE AS BIGINT)) AS AVG_PROPERTY_PRICE
FROM PROPERTY24
WHERE PROPERTY_PRICE >3000000;


--------------------------------------------------------------------------------------------
--SECTION 4 – GROUP BY + Filtering (10 Questions)
--------------------------------------------------------------------------------------------

/*31. Which province has the highest average property price?*/
SELECT TOP 1 PROVINCE,
       AVG(CAST(PROPERTY_PRICE AS BIGINT)) AS AVG_PROPERTY_PRICE
FROM PROPERTY24
GROUP BY PROVINCE
ORDER BY AVG_PROPERTY_PRICE DESC;

/*32. Which province has the lowest average property price?*/
SELECT TOP 1 PROVINCE,
       AVG(CAST(PROPERTY_PRICE AS BIGINT)) AS AVG_PROPERTY_PRICE
FROM PROPERTY24
GROUP BY PROVINCE
ORDER BY AVG_PROPERTY_PRICE ASC;


/*33. Which city has the highest total property value?*/
SELECT TOP 1 CITY,
       SUM(CAST(PROPERTY_PRICE AS BIGINT)) AS TOTAL_PROPERTY_VALUE
FROM PROPERTY24
GROUP BY CITY
ORDER BY TOTAL_PROPERTY_VALUE DESC;

/*34. Which city has the lowest average property price?*/
SELECT TOP 1 CITY,
       AVG(CAST(PROPERTY_PRICE AS BIGINT)) AS AVG_PROPERTY_PRICE
FROM PROPERTY24
GROUP BY CITY
ORDER BY AVG_PROPERTY_PRICE ASC;


/*35. How many properties per province are priced above R2,000,000?*/
SELECT PROVINCE,
      COUNT(PROPERTY_ID) AS PROPERTY_COUNT
FROM PROPERTY24
WHERE PROPERTY_PRICE >2000000
GROUP BY PROVINCE
ORDER BY PROPERTY_COUNT DESC;


/*36. What is the average floor size per province for properties above R3,000,000?*/
SELECT PROVINCE,
      AVG(FLOOR_SIZE) AS AVG_FLOOR_SIZE
FROM PROPERTY24
WHERE PROPERTY_PRICE >3000000
GROUP BY PROVINCE
ORDER BY AVG_FLOOR_SIZE DESC;


/*37. What is the total property value per province for properties with 3 or more bedrooms?*/
SELECT PROVINCE,
     SUM(CAST(PROPERTY_PRICE AS BIGINT)) AS TOTAL_PROPERTY_VALUE
FROM PROPERTY24
WHERE BEDROOMS >=3
GROUP BY PROVINCE 
ORDER BY TOTAL_PROPERTY_VALUE DESC;

/*38. What is the average monthly repayment per province for properties above R4,000,000?*/
SELECT PROVINCE,
     AVG(CAST(MONTHLY_REPAYMENT AS BIGINT)) AS AVG_MONTHLY_REPAYMENT
FROM PROPERTY24
WHERE PROPERTY_PRICE > 4000000
GROUP BY PROVINCE;


/*39. How many properties per city have parking for 2 or more cars?*/
SELECT CITY,
     COUNT(PROPERTY_ID) AS PROPERTY_COUNT
FROM PROPERTY24
WHERE PARKING >=2
GROUP BY CITY;


/*40. What is the average minimum gross monthly income per province for properties above R5,000,000?*/

SELECT PROVINCE,
       AVG(CAST(MIN_GROSS_MONTHLY_INCOME AS BIGINT)) AS AVG_MIN_GROSS_MONTHLY_INCOME
FROM PROPERTY24
WHERE PROPERTY_PRICE > 5000000
GROUP BY PROVINCE;
