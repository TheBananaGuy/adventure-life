use [wu17_interdisc_1sem-2]

go

drop table qualification
drop table reservation
drop table eventTime
drop table activity
drop table employee

go

create table employee (
id int primary key identity (1,1),
firstName varchar(50),
lastName varchar(50),
phone int,
email varchar(50),
initial varchar(10) unique
)

create table activity (
id int primary key identity (1,1),
name varchar(50),
price decimal(10,2)
)

create table eventTime (
id int primary key identity (1,1),
startTime varchar(5)
)

create table reservation (
id int primary key identity (1,1),
name varchar(100),
phone int,
email varchar(100),
people tinyint,
eventDate date,
eventTimeID int foreign key references eventTime(id),
activityID int foreign key references activity(id),
employeeID int foreign key references employee(id)
)

create table qualification (
activityID int foreign key references activity(id),
employeeID int foreign key references employee(id),
primary key (activityID, employeeID)
)

go
