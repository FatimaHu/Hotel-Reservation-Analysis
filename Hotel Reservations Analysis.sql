--What is the total number of reservations in the dataset?

select
	COUNT([Booking_ID]) "Total Reservations"
from
	[Hotel Reservation Dataset]

--Which meal plan is the most popular among guests?

select 
	top 1 [type_of_meal_plan],
	COUNT(*) As meal_count
from [Hotel Reservation Dataset]
group by [type_of_meal_plan]
order by "meal_count" desc

--What is the average price per room for reservations involving children?

select
	[room_type_reserved],
	AVG([avg_price_per_room]) As "Average room price including children"
from
	[Hotel Reservation Dataset]
where [no_of_children] > 0
group by room_type_reserved

--How many reservations were made for the year 20XX (replace XX with the desired year)?

select
	COUNT(*) AS "Totle Reservation",
	datepart(year,arrival_date) As "year of  arrival"
From
	[Hotel Reservation Dataset]
where datepart(year,arrival_date) = 2018
group by datepart(year,arrival_date)


--What is the most commonly booked room type?

select
	top 1 [room_type_reserved],
	COUNT(*) As "Commonly Booked"
from [Hotel Reservation Dataset]
group by [room_type_reserved]
order by "Commonly Booked" desc

--How many reservations fall on a weekend)?

SELECT
	sum([no_of_weekend_nights]) As "Weekend Reservations"
FROM [Hotel Reservation Dataset]
WHERE [no_of_weekend_nights] > 0

--What is the highest and lowest lead time for reservations?

select
	MAX([lead_time]) AS "Max lead time",
	MIN([lead_time]) As "Min lead time"
from [Hotel Reservation Dataset]

--What is the most common market segment type for reservations? 

select
	top 1 [market_segment_type],
	COUNT(*) As "Common Segment"
from [Hotel Reservation Dataset]
group by [market_segment_type]
order by [market_segment_type] desc

--How many reservations have a booking status of "Confirmed"?

select
	COUNT([booking_status])
from [Hotel Reservation Dataset]
where [booking_status] <> 'Canceled'

--What is the total number of adults and children across all reservations?

select sum([no_of_adults]) As Total_No_Of_Adults,
	sum([no_of_children]) As Total_No_Of_Children,
	sum([no_of_adults]) + sum([no_of_children]) As Total
from [Hotel Reservation Dataset]

--What is the average number of weekend nights for reservations involving children?

select 
	AVG(no_of_weekend_nights) As "Weekend Nights with Children"
from [Hotel Reservation Dataset]
where no_of_children > 0

--How many reservations were made in each month of the year?


select COUNT(*) AS "Number of reservation",
  datepart(month,arrival_date) As "reservation per month"
From [Hotel Reservation Dataset]
group by datepart(month,arrival_date)
order by "reservation per month"

--What is the average number of nights (both weekend and weekday) spent by guests for each room type?

select
	room_type_reserved,
	AVG(no_of_week_nights) As "Average Week Nights",
	AVG(no_of_weekend_nights) As "Average Weekend Nights",
	(AVG(no_of_week_nights)) + (AVG(no_of_weekend_nights)) As "Total Night Spent"
from [Hotel Reservation Dataset]
group by room_type_reserved


--For reservations involving children, what is the most common room type, and what is the average price for that room type?

select
	Top 1 room_type_reserved,
	COUNT(*) As "Number of Reservations",
	AVG(avg_price_per_room) As "Average room price"
from [Hotel Reservation Dataset]
where no_of_children > 0
group by room_type_reserved
order by "Number of Reservations" desc

--Find the market segment type that generates the highest average price per room.

select
	Top 1 market_segment_type "Market Segment",
	AVG(avg_price_per_room) "Highest average price"
from [Hotel Reservation Dataset]
group by market_segment_type
order by "Highest average price" desc