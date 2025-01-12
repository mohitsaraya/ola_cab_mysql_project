create database OLA_use_Case;
use  OLA_use_Case;

-- 1. Extract all data from the `trips` table. 
SELECT 
    *
FROM
    trips;

-- 2. Extract all data from the `trips_details4` table. 
SELECT 
    *
FROM
    trips_details4;

-- 3. Extract all data from the `loc` table. 
SELECT 
    *
FROM
    loc;

-- 4. Extract all data from the `duration` table. 
SELECT 
    *
FROM
    duration;

-- 5. Extract all data from the `payment` table. 
SELECT 
    *
FROM
    payment;

-- 6. What is the total number of trips?
SELECT DISTINCT
    COUNT(*) AS Total_Trips
FROM
    trips;

-- 7. What is the total number of drivers?
SELECT 
    COUNT(DISTINCT driverid) AS No_of_drivers
FROM
    trips;

-- 8. What is the total earnings?
SELECT 
    SUM(fare) AS Earnings
FROM
    trips;

-- 9. How many trips were completed?
SELECT 
    COUNT(end_ride) AS Total_rides_completed
FROM
    trips_details4;

-- 10. What is the total number of searches?
SELECT 
    SUM(searches) AS total_searches
FROM
    trips_details4;

-- 11. How many searches received estimates?
SELECT 
    SUM(searches_got_estimate) AS Bills_generated
FROM
    trips_details4;

-- 12. How many searches resulted in quotes?
SELECT 
    SUM(searches_for_quotes) AS Bills_Got_seen
FROM
    trips_details4;

-- 13. How many quotes were received?
SELECT 
    SUM(searches_got_quotes) AS Trips_made
FROM
    trips_details4;

-- 14. How many trips were canceled by drivers?

SELECT 
    SUM(customer_not_cancelled) AS driver_cancelled
FROM
    trips_details4;

-- 15. How many trips were canceled by customers?
SELECT 
    SUM(driver_not_cancelled) AS Customer_cancelled
FROM
    trips_details4;

-- 16. How many OTPs were entered?
SELECT 
    SUM(otp_entered) AS Total_otp
FROM
    trips_details4;

-- 17. How many rides were completed?
SELECT 
    SUM(end_ride) AS Ride_Completed
FROM
    trips_details4;

-- 18. What is the average distance per trip?
SELECT 
    AVG(distance) AS Avg_distance
FROM
    trips;

-- 19. What is the average fare per trip?
SELECT 
    SUM(fare) / COUNT(tripid) AS Fare_per_trip
FROM
    trips;

-- 20. What is the most distance traveled in a trip?
SELECT 
    MAX(distance) AS Max_distance
FROM
    trips;

-- 21. What is the most used payment method?
SELECT 
    faremethod, COUNT(faremethod)
FROM
    trips
GROUP BY 1
ORDER BY 2 DESC;

-- 22. What is the payment method for the highest fare?
SELECT 
    payment.method, MAX(fare) AS Fare
FROM
    trips
        JOIN
    payment ON payment.id = trips.faremethod
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;

-- 23. Which two locations had the most trips?

SELECT 
    MAX(loc_to) AS Most_trips
FROM
    trips
GROUP BY loc_to
LIMIT 2;
--- or 

SELECT 
    loc_to ,count(*)  as Most_trips
FROM
    trips
GROUP BY loc_to
order by 2 desc
LIMIT 2;
-- 24. Who are the top 5 earning drivers?
SELECT 
    driverid, SUM(fare) AS Earning
FROM
    trips
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- OR per ride earning
SELECT 
    driverid, fare AS Earning
FROM
    trips
GROUP BY 1 , 2
ORDER BY 2 DESC
LIMIT 5;
-- 25. Which duration had the most trips?

SELECT 
    duration, COUNT(duration) AS duration_with_most_trips
FROM
    trips
GROUP BY duration
ORDER BY 2 DESC
LIMIT 5;


-- 26. Which driver-customer pair had the most orders?


SELECT 
    driverid, custid, COUNT(*) AS Order_count
FROM
    trips
GROUP BY 1 , 2
ORDER BY 3 DESC
LIMIT 1;
-- 27. What is the search to estimate rate?

SELECT 
    AVG(searches_got_estimate / searches) * 100 AS Rate
FROM
    trips_details4;

-- 28. Which area had the highest trips during a specific duration?
SELECT 
    assembly1 AS Location,
    d.duration AS time,
    COUNT(tripid) AS Trips
FROM
    loc
        JOIN
    trips ON loc.id = trips.loc_to
        JOIN
    duration AS d ON d.id = trips.duration
GROUP BY 1 , 2
ORDER BY 3 DESC
LIMIT 1;

-- 29. Which area had the highest fares? 
SELECT 
    assembly1 AS Location, fare AS Fare
FROM
    loc
        JOIN
    trips ON trips.loc_to = loc.id
GROUP BY 1 , 2
ORDER BY 2 DESC
LIMIT 5;
