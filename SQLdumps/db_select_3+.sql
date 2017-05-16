use [wu17_interdisc_1sem-2]

go

select a.name, r.name, e.initial, e.firstName, e.lastName, q.employeeID, r.people, r.eventDate, r.eventTimeID
from activity a
join reservation r on a.id = r.activityID
join employee e on a.id = e.id
join qualification q on a.id = q.activityID
where a.name = 'Bow tag'
order by r.people desc

go