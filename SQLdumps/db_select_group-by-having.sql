use [wu17_interdisc_1sem-2]

go

select a.name 'Activity name', sum(people) 'People traffic', count(r.id) 'Amount of bookings'
from reservation r
join activity a on r.activityID = a.id
group by a.name, year(r.eventDate)
having year(r.eventDate) = year(getdate())

go