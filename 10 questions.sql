Q1：
SELECT
    a.carrier_name,
    COUNT(*) AS num_flights
FROM
    flight f
    JOIN airline a ON f.airline_id = a.airline_id
GROUP BY
    a.carrier_name
ORDER BY
    num_flights DESC
LIMIT 10;

Q2：
SELECT
    f.dest,
    AVG(f.elapsed_time) AS avg_elapsed_time
FROM
    flight f
GROUP BY
    f.dest;
	
Q3：
SELECT
    f.dest,
    MAX(f.dep_time) AS most_common_dep_time,
    MAX(departure_count) AS max_departure_count
FROM (
    SELECT
        dest,
        dep_time,
        COUNT(*) AS departure_count
    FROM
        flight
    GROUP BY
        dest, dep_time
) f
GROUP BY
    f.dest;
	
Q4:
SELECT
    rt.room_type_name,
    COUNT(*) AS num_bookings
FROM
    hotel_booking hb
    INNER JOIN room_type rt ON hb.room_type_id = rt.room_type_id
WHERE
    hb.stays_in_weekend_nights > 0
GROUP BY
    rt.room_type_name
ORDER BY
    num_bookings DESC
LIMIT 10;

Q5:
SELECT
    arrival_date_month,
    COUNT(*) AS booking_count
FROM
    hotel_booking
GROUP BY
    arrival_date_month
ORDER BY
    booking_count DESC
LIMIT 10;

Q6：
SELECT
    required_car_parking_spaces,
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN hb.is_canceled THEN 1 ELSE 0 END) AS canceled_bookings,
    (SUM(CASE WHEN hb.is_canceled THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS cancellation_percentage
FROM
    guest g
    JOIN hotel_booking hb ON g.booking_id = hb.booking_id
GROUP BY
    required_car_parking_spaces;
	
Q7:
SELECT
    h.hotel_type,
    AVG(hb.lead_time) AS avg_lead_time
FROM
    hotel h
    JOIN hotel_booking hb ON h.hotel_id = hb.hotel_id
GROUP BY
    h.hotel_type;
	
Q8:
SELECT
    type,
    fuel_type,
    AVG(daily_rate) AS avg_daily_rate
FROM
    rental r
    JOIN vehicle v ON r.vehicle_id = v.vehicle_id
GROUP BY
    type, fuel_type;

Q9:
SELECT
    v.make,
    v.model,
    COUNT(*) AS num_rentals,
    AVG(r.daily_rate) AS avg_daily_rate
FROM
    rental r
    JOIN vehicle v ON r.vehicle_id = v.vehicle_id
GROUP BY
    v.make, v.model
ORDER BY
    num_rentals DESC
LIMIT 10;

Q10:
SELECT
    AVG(trips_taken) AS avg_trips_taken,
    AVG(review_count) AS avg_review_count
FROM
    renter;











