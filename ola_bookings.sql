CREATE TABLE ola_bookings(
	booking_date TIMESTAMP,
	booking_time TIME,
	booking_id varchar PRIMARY KEY,
	booking_status varchar,
	customer_id varchar,	
	vehicle_type varchar,
	pickup_location varchar,
	drop_location varchar,
	v_tat int,
	c_tat int,
	canceled_rides_by_customer varchar ,
	canceled_rides_by_driver varchar ,
	incomplete_rides  VARCHAR ,
	incomplete_rides_reason varchar ,
	booking_value int,
	payment_method varchar ,
	ride_distance int,
	driver_ratings decimal(3,1) ,
	customer_rating decimal(3,1) 
);
set datestyle to DMY; -- change in date format as sql default is y-m-d

copy ola_bookings
FROM 'C:\Users\Public\Bookings.csv'
DELIMITER ','
csv header NULL 'null'; --to read 'null' as NULL

SELECT *from ola_bookings;

--fetch all successful bookings
select *from ola_bookings where booking_status ='Success';

--average distance for all vehicle types
select	vehicle_type, avg(ride_distance) FROM ola_bookings group by vehicle_type;

--total cancelled rides by customer
select count(canceled_rides_by_customer) FROM ola_bookings;

--top 5 customers with highest booked rides
select	customer_id from ola_bookings 
GROUP by customer_id 
order by count(booking_id) 
DESC limit 5;

-- number of rides cancelled by drivers due to personal and car-related issues
select count(canceled_rides_by_driver) FROM ola_bookings 
where canceled_rides_by_driver='Personal & Car related issue';


--maximum and minimum driver ratings for Prime Sedan bookings
select max(driver_ratings) AS max_rating, min(driver_ratings) as min_rating from ola_bookings
WHERE vehicle_type like 'Prime Sedan';

-- rides where payment was made using UPI
select *from ola_bookings
where payment_method ='UPI';

--average customer rating per vehicle type
SELECT vehicle_type, avg(customer_rating) AS avg_rating FROM ola_bookings
GROUP by vehicle_type
ORDER by avg_rating DESC;

-- total booking value of rides completed successfully
SELECT sum(booking_value) FROM ola_bookings
where booking_status = 'Success';

--incomplete rides along with the reason
SELECT booking_id, incomplete_rides_reason from ola_bookings
WHERE incomplete_rides = 'Yes';