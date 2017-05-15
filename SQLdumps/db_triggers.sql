use [wu17_interdisc_1sem-2]

go

drop trigger occupiedSlot
drop trigger occupiedSlotUpdate
drop trigger occupiedEmployeeUpdate

go

-- prevent double registrations on the same day, time and activity
create trigger occupiedSlot
on reservation
for insert
as
if exists (
	select r.id
	from reservation r, inserted i
	where r.eventDate = i.eventDate
	and r.eventTimeID = i.eventTimeID
	and r.activityID = i.activityID
	)
begin
	raiserror ('The registration for this time and activity is already booked by someone else', 16, 1)
	rollback tran
end

go

-- prevent employees to work on different places at the same time
create trigger occupiedSlotUpdate
on reservation
for update
as
if exists (
	select r.id
	from reservation r, inserted i
	where r.eventDate = i.eventDate
	and r.eventTimeID = i.eventTimeID
	and r.activityID = i.activityID
	)
begin
	raiserror ('The registration for this time and activity is already booked by someone else', 16, 1)
	rollback tran
end

go

-- prevent employees to work on different places at the same time
create trigger occupiedEmployeeUpdate
on reservation
for update
as
if exists (
	select r.id
	from reservation r, inserted i
	where r.employeeID = i.employeeID
	and r.eventDate = i.eventDate
	and r.eventTimeID = i.eventTimeID
	and r.activityID != i.activityID
	)
begin
	raiserror ('The employee is already occupied somewhere else. Please free the employee or assign somebody else for this event', 16, 1)
	rollback tran
end

go