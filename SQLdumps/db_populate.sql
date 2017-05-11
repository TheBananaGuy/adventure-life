use wu17_interdisciplinary_1sem

go

-- let's create some activities that people can make reservations for
insert into activity values ('Rock climbing', '01:00:00', 50.00)
insert into activity values ('Paintball', '02:00:00', 250.00)
insert into activity values ('Bow tag', '01:30:00', 150.00)

-- let's create some employees now.
-- two for rock climbing
insert into person values ('John', 'Five', 71874589, 'john5@gmail.com')
insert into employee values (1, 'jofi')
insert into person values ('Brian', 'Carroll', 55946485, 'briroll@gmail.com')
insert into employee values (2, 'brca')
-- three for paintball
insert into person values ('Vicky', 'Fates', 58015850, 'vfdrm@yahoo.com')
insert into employee values (3, 'vifa')
insert into person values ('Mario', 'Duplantier', 55666445, 'duplo@yahoo.com')
insert into employee values (4, 'madu')
insert into person values ('Chris', 'Adler', 90546854, 'adler@yahoo.com')
insert into employee values (5, 'chad')
-- four for bow tag
insert into person values ('Tosin', 'Abasi', 77974568, 'ta@aal.com')
insert into employee values (6, 'toab')
insert into person values ('Yvette', 'Young', 79415687, 'yyoung@sberg.com')
insert into employee values (7, 'yvyo')
insert into person values ('Sarah', 'Longfield', 56484892, 'inthefield@yourgarden.com')
insert into employee values (8, 'salo')
insert into person values ('Rob', 'Scallon', 34568741, 'iamashovel@yourgarden.com')
insert into employee values (9, 'rosc')

-- let's bind the employees to the activities
-- rock climbing
insert into specialization values (1, 1)
insert into specialization values (1, 2)
-- paintball
insert into specialization values (2, 3)
insert into specialization values (2, 4)
insert into specialization values (2, 5)
-- bow tag
insert into specialization values (3, 6)
insert into specialization values (3, 7)
insert into specialization values (3, 8)
insert into specialization values (3, 9)

-- now let's create some customers and reservations
insert into person values ('Mimir', 'Poulsen', 71190212, 'MimirLPoulsen@jourrapide.com')
insert into customer values (10, 'Øksendrupvej 66 1316 København K')
insert into reservation values ('2017-04-19 14:00:00', 1, 4, 10, null, 1) 
insert into person values ('Nicklas', 'Mogensen', 24127298, 'NicklasKMogensen@dayrep.com')
insert into customer values (11, 'Sveltekrogen 19 1562 København V')
insert into person values ('Tobias', 'Iversen', 24213720, 'TobiasPIversen@rhyta.com')
insert into customer values (12, 'Brogade 71 6701 Esbjerg')
insert into person values ('Liv', 'Poulsen', 81750718, 'LivMBerg@jourrapide.com')
insert into customer values (13, 'Harevænget 97 1807 Frederiksberg C')
insert into person values ('Michael', 'Christoffersen', 23129851, 'MichaelCChristoffersen@teleworm.us')
insert into customer values (14, 'Ribelandevej 81 4261 Dalmose')
insert into person values ('Jeppe', 'Simonsen', 25647386, 'JeppeOSimonsen@dayrep.com')
insert into customer values (15, 'Ribelandevej 59 6070 Christiansfeld ')
insert into person values ('Benjamin', 'Jørgensen', 24918064, 'BenjaminMJrgensen@dayrep.com')
insert into customer values (16, 'Byvej 7 6720 Fanø')
insert into person values ('Silas', 'Holst', 71190212, 'SilasSHolst@dayrep.com')
insert into customer values (17, 'Ribelandevej 3 4261 Dalmose')
insert into person values ('Peter', 'Brandt', 26924523, 'PeterMBrandt@rhyta.com')
insert into customer values (18, 'Hulemosevej 25 8781 Stenderup')
insert into person values ('Tristan', 'Jespersen', 71787641, 'TristanRJespersen@armyspy.com')
insert into customer values (19, 'Skole Allé 86 1408 København K')
insert into person values ('Isabella', 'Nygaard', 27472415, 'IsabellaJNygaard@jourrapide.com')
insert into customer values (20, 'Stationsvej 22 2650 Hvidovre')
insert into person values ('David', 'Olesen', 23763759, 'DavidTOlesen@rhyta.com')
insert into customer values (21, 'Ådalen 31 1873 Frederiksberg C')
insert into person values ('Abellona', 'Brandt', 25906985, 'AbellonaMBrandt@armyspy.com')
insert into customer values (22, 'Dosseringen 26 4660 Store Heddinge')
insert into person values ('Ditte', 'Sørensen', 28701292, 'DitteLSrensen@dayrep.com')
insert into customer values (23, 'Strandvej 9 1270 København K')

select * from employee