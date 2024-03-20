select * from [Hotel Reservation Dataset]

select COUNT([avg_price_per_room])
from [Hotel Reservation Dataset]
where [no_of_children] > 0

select[arrival_date],day([arrival_date]) as DayValue,month([arrival_date]) as MonthValue,year([arrival_date]) as YearValue
INTO [arrival_date_1]
from [Hotel Reservation Dataset]

select COUNT(*) AS totle_reservation,
  datepart(year,arrival_date) As year
From
  [Hotel Reservation Dataset]
where [arrival_date] > '2018'
group by [arrival_date]


select [room_type_reserved], COUNT(*) As commonly_booked
from [Hotel Reservation Dataset]
group by [room_type_reserved]

SELECT sum([no_of_weekend_nights])
FROM [Hotel Reservation Dataset]
WHERE [no_of_weekend_nights] > 0

select MIN([lead_time]) AS Min_leadtime,MAX([lead_time]) As Max_leadtime
from [Hotel Reservation Dataset]


select [market_segment_type], COUNT(*) As common_segment
from [Hotel Reservation Dataset]
group by [market_segment_type]

select COUNT([booking_status])
from [Hotel Reservation Dataset]
where [booking_status] = 'Confirmed'

select sum([no_of_adults]), sum([no_of_children])
from [Hotel Reservation Dataset]

select sum([no_of_children])
from [Hotel Reservation Dataset]



