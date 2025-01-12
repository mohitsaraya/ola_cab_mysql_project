use ola;
-- EXTRACT ALL DATAS FROM TRIPS TABLE
SELECT 
    *
FROM
    trips;
-- EXTRACT ALL DATAS FROM TRIPS_DETAILS TABLE
SELECT 
    *
FROM
    trips_details4;
-- EXTRACT ALL DATAS FROM LOCATION TABLE
SELECT 
    *
FROM
    loc;
-- EXTRACT ALL DATAS FROM DURATION TABLE
SELECT 
    *
FROM
    duration;
-- EXTRACT ALL DATAS FROM PAYEMENT TABLE
SELECT 
    *
FROM
    payment;

-- TOTAL TRIPS
SELECT 
    COUNT(*) AS TOTAL_TRIPS
FROM
    trips;
-- TOTAL DRIVERS
SELECT 
    COUNT(DISTINCT driverid) AS TOTAL_DRIVERS
FROM
    trips;
-- TOTAL EARNING
SELECT 
    SUM(fare) AS TOTAL_EARINGS
FROM
    trips;
-- TOTAL TRIPS COMPLETED
SELECT 
    SUM(end_ride) AS COMPLETED_TRIPS
FROM
    trips_details4;
-- TOTAL SEARCHES
SELECT 
    SUM(searches) AS SEARCHES
FROM
    trips_details4;
-- TOTAL SEARCHES GOT ESTIMATES
SELECT 
    SUM(searches_got_estimate) AS BILLS_GENERATED
FROM
    trips_details4;
-- TOTAL SEARCHES FOR QOUTES
SELECT 
    SUM(searches_for_quotes) AS BILL_GOT_SEEN
FROM
    trips_details4;
-- TOTAL SEARCHES GOT QOUTES
SELECT 
    SUM(searches_got_quotes) AS MAKE_TRIP
FROM
    trips_details4;
-- TOTAL DRIVERS CANCELLED
SELECT 
    SUM(customer_not_cancelled) AS DRIVER_CANCELLED
FROM
    trips_details4;
-- TOTAL CUSTOMER CANCELLED
SELECT 
    SUM(driver_not_cancelled) AS CUSTOMER_CANCELLEd
FROM
    trips_details4;
-- TOTAL OTP ENTERED
SELECT 
    SUM(otp_entered) AS TOTAL_OTP
FROM
    trips_details4;
-- TOTAL END RIDES
SELECT 
    SUM(end_ride) AS COMPLETED_RIDE
FROM
    trips_details4;
-- AVERAGE DISTANCE BY TRIPS
SELECT 
    AVG(distance) AS AVERAGE_DISTANCE
FROM
    trips;
-- AVERAGE FARE PER TRIP
SELECT 
    SUM(fare) / COUNT(*) AS AVERAGE_FARE
FROM
    trips;
-- MOST DISTANCE TRAVELLED
SELECT 
    MAX(distance) AS MOST_DISTANCE_TRAVELLED
FROM
    trips;
-- MOST USED PAYMENT METHOD
SELECT 
    MAX(faremethod) AS MOST_USED_PAYMENT_METHOD
FROM
    trips;
-- HIGHEST PAID FARE IN WHICH PAYEMENT METHOD
SELECT 
    faremethod AS HIGHEST_FARE_PAYMENT_METHOD
FROM
    trips
ORDER BY fare DESC
LIMIT 1;
SELECT 
    faremethod AS HIGHEST_FARE_PAYMENT_METHOD
FROM
    trips
WHERE
    fare = (SELECT 
            MAX(fare)
        FROM
            trips);
-- WHICH 2 LOCATION HAD MOST TRIPS
SELECT 
    MAX(loc_to) AS MOST_TRIPS_LOCATIONS
FROM
    trips
GROUP BY loc_to
LIMIT 2;
-- TOP 5 EARNING DRIVERS
SELECT 
    driverid AS TOP_5_EARNING_DRIVERS
FROM
    trips
ORDER BY fare DESC
LIMIT 5;
-- DURATION WITH HAD MORE TRIPS
SELECT 
    MAX(duration) AS DURATION_WITH_HAD_MORE_TRIPS
FROM
    trips
GROUP BY duration
LIMIT 1;
-- WHICH DRIVER, CUSTOMER PAIR HAD MORE ORDERS
SELECT 
    driverid, custid, COUNT(*) AS ORDER_COUNT
FROM
    trips
GROUP BY driverid , custid
ORDER BY order_count DESC
LIMIT 1;
-- SEARCH TO ESTIMATE RATE
SELECT 
    AVG(searches_got_estimate * 100.0 / searches) AS search_to_estimate_rate
FROM
    trips_details4
WHERE
    searches > 0;
-- Area with Highest Trips in a Specific Duration
SELECT 
    loc.Assembly1, duration.duration, COUNT(*) AS trip_count
FROM
    trips
        JOIN
    loc ON trips.loc_to = loc.ID
        JOIN
    duration ON trips.duration = duration.id
GROUP BY loc.Assembly1 , duration.duration
ORDER BY trip_count DESC
LIMIT 1;
-- Highest Fares
SELECT 
    loc.Assembly1, SUM(fare) AS total_fare
FROM
    trips
        JOIN
    loc ON trips.loc_to = loc.ID
GROUP BY loc.Assembly1
ORDER BY total_fare DESC
LIMIT 1;