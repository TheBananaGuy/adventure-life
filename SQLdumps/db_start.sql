-- table design

use wu17_interdisciplinary_1sem

go

drop table reservation
drop table specialization
drop table activity
drop table employee
drop table customer
drop table person

go

create table person (
id int primary key identity (1,1),
firstName varchar(25),
lastName varchar(25),
phone int,
email varchar(50)
)

create table customer (
personID int unique foreign key references person(id),
address varchar(100),
primary key (personID)
)

create table employee (
personID int unique foreign key references person(id),
initial varchar(10) unique,
primary key (personID)
)

create table activity (
id int primary key identity (1,1),
name varchar(50),
timespan datetime,
price decimal(10,2)
)

create table specialization (
activityID int foreign key references activity(id),
employeeID int foreign key references employee(personID),
primary key (activityID, employeeID)
)

create table reservation (
startTime datetime,
amount tinyint,
people tinyint,
customerID int foreign key references customer(personID),
employeeID int foreign key references employee(personID),
activityID int foreign key references activity(id),
primary key(customerID, startTime, activityID)
)

go