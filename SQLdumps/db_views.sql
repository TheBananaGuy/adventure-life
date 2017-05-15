use [wu17_interdisc_1sem-2]

go

create view unassignedBookings
as
	select a.name 'Activity', r.eventDate 'Event date', e.startTime 'Starting at', r.people 'People amount'
	from reservation r
	join activity a on r.activityID = a.id
	join eventTime e on r.eventTimeID = e.id
	where r.employeeID is null
	order by r.eventDate, e.startTime
go