-- Script to display the average temperature (Fahrenheit) by city, ordered by temperature (descending)
SELECT city, 
       ROUND(AVG(value), 4) as avg_temp
FROM temperatures
GROUP BY city
ORDER BY avg_temp DESC;
