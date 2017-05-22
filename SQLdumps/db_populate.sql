use [wu17_interdisc_1sem-2]

go

-- let's create some activities that people can make reservations for
insert into activity values ('Rock climbing', 100.00)
insert into activity values ('Paintball', 250.00)
insert into activity values ('Archery', 150.00)

-- a schedule for our activities
insert into eventTime values ('08:00')
insert into eventTime values ('10:00')
insert into eventTime values ('12:00')
insert into eventTime values ('14:00')
insert into eventTime values ('16:00')
insert into eventTime values ('18:00')
insert into eventTime values ('20:00')

-- let's create some employees and qualify them to our activities.
insert into employee values ('John', 'Five', 71874589, 'john5@gmail.com', 'jofi')
insert into qualification values (1, 1) -- rock climbing
insert into employee values ('Brian', 'Carroll', 55946485, 'briroll@gmail.com', 'brca')
insert into qualification values (1, 2) -- rock climbing
insert into qualification values (3, 2) -- archery
insert into employee values ('Vicky', 'Fates', 58015850, 'vfdrm@yahoo.com', 'vifa')
insert into qualification values (2, 3) -- paintball
insert into employee values ('Mario', 'Duplantier', 55666445, 'duplo@yahoo.com', 'madu')
insert into qualification values (2, 4) -- paintball
insert into qualification values (3, 4) -- archery
insert into employee values ('Chris', 'Adler', 90546854, 'adler@yahoo.com', 'chad')
insert into qualification values (2, 5) -- paintball
insert into employee values ('Tosin', 'Abasi', 77974568, 'ta@aal.com', 'toab')
insert into qualification values (3, 6) -- archery
insert into employee values ('Yvette', 'Young', 79415687, 'yyoung@sberg.com', 'yvyo')
insert into qualification values (1, 7) -- rock climbing
insert into qualification values (3, 7) -- archery
insert into employee values ('Sarah', 'Longfield', 56484892, 'inthefield@yourgarden.com', 'salo')
insert into qualification values (2, 8) -- paintball
insert into qualification values (3, 8) -- archery
insert into employee values ('Rob', 'Scallon', 34568741, 'iamashovel@yourgarden.com', 'rosc')
insert into qualification values (1, 9) -- rock climbing
insert into qualification values (2, 9) -- paintball
insert into qualification values (3, 9) -- archery

-- now let's create some reservations
insert into reservation values ('Mimir L Poulsen', 71190212, 'MimirLPoulsen@jourrapide.com', 4, '2017-06-19', 2, 1, 9)
insert into reservation values ('Nicklas K Mogensen', 24127298, 'NicklasKMogensen@dayrep.com', 6, '2017-06-04', 5, 1, 2)
insert into reservation values ('Tobias P Iversen', 24213720, 'TobiasPIversen@rhyta.com', 4, '2017-06-23', 4, 2, 5)
insert into reservation values ('Liv M Berg', 81750718, 'LivMBerg@jourrapide.com', 4, '2017-06-28', 2, 3, 7)
insert into reservation values ('Michael C Christoffersen', 23129851, 'MichaelCChristoffersen@teleworm.us', 8, '2017-08-01', 6, 2, null)
insert into reservation values ('Jeppe O Simonsen', 25647386, 'JeppeOSimonsen@dayrep.com', 16, '2017-07-12', 6, 2, null)
insert into reservation values ('Benjamin M Jørgensen', 24918064, 'BenjaminMJrgensen@dayrep.com', 13, '2017-07-12', 4, 3, null)
insert into reservation values ('Silas S Holst', 71190212, 'SilasSHolst@dayrep.com', 5, '2017-07-02', 7, 1, 1)
insert into reservation values ('Peter M Brandt', 26924523, 'PeterMBrandt@rhyta.com', 8, '2017-07-02', 4, 1, null)
insert into reservation values ('Tristan R Jespersen', 71787641, 'TristanRJespersen@armyspy.com', 7, '2017-06-08', 7, 2, 3)
insert into reservation values ('Isabella J Nygaard', 27472415, 'IsabellaJNygaard@jourrapide.com', 4, '2017-05-29', 5, 1, 9)
insert into reservation values ('David T Olesen', 23763759, 'DavidTOlesen@rhyta.com', 8, '2017-05-16', 5, 3, 8)
insert into reservation values ('Abellona M Brandt', 25906985, 'AbellonaMBrandt@armyspy.com', 15, '2017-05-25', 6, 3, 8)
insert into reservation values ('Ditte L Sørensen', 28701292, 'DitteLSrensen@dayrep.com', 8, '2017-03-25', 4, 2, 9)

-- duplicate with same time and date, to test triggers
insert into reservation values ('Abellona M Brandt', 25906985, 'AbellonaMBrandt@armyspy.com', 15, '2017-03-24', 5, 3, null)

select * from reservation