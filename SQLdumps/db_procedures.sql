use [wu17_interdisc_1sem-2]

go

-- show amount of booked activities and participated people on a certain month
create procedure activitiesByMonth
@year int,
@month int
as
begin
	select a.name 'Activity name', sum(people) 'People traffic', sum r.id 'Amount of bookings'
	from reservation r
	join activity a on r.activityID = a.id
	where year(r.eventDate) = @year
	and month(r.eventDate) = @month
	group by -- finish plz
end

go