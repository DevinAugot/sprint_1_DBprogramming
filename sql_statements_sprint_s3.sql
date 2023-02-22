SELECT * FROM airports;

SELECT * FROM cities;

SELECT * FROM passengers;

SELECT * FROM aircraft;

SELECT * FROM airport_city;

select * from cities
order by city_id

1--what airports are in what cities --
select * from airports a, cities c, airport_city ac
where ac.city_id = c.city_id
and ac.airport_id = a.airport_id
order by c.city_id

-- what cities have what airports with name as condiditon
select * from airports a, cities c, airport_city ac
where ac.city_id = c.city_id
and ac.airport_id = a.airport_id
and c.city_name = 'Halifax'
order by c.city_id


insert into airport_city (city_id, airport_id) values (1,1)
insert into airport_city (city_id, airport_id) values (2,2)
insert into airport_city (city_id, airport_id) values (3,3)
insert into airport_city (city_id, airport_id) values (4,4)
insert into airport_city (city_id, airport_id) values (5,5)
insert into airport_city (city_id, airport_id) values (6,6)
insert into airport_city (city_id, airport_id) values (7,7)
insert into airport_city (city_id, airport_id) values (8,8)
insert into airport_city (city_id, airport_id) values (9,9)
insert into airport_city (city_id, airport_id) values (10,10)

--2.list all aircraft passengers have travelled on --
SELECT * FROM passengers
SELECT * FROM aircraft

SELECT * FROM aircraft a, passengers p
where a.passenger_id = p.pass_id
-- can specify value for specific passenger 
and p.pass_id = 6

 -- shows what cities passengers live in with id number coniditon 
select * from passengers p, cities c
where p.home_city_id = c.city_id
and p.home_city_id = c.city_id
and p.home_city_id  = 8


--3. which airports can aircraft take off from and land at (can land and take off from many airports)

SELECT * FROM aircraft;

SELECT * FROM airports;

SELECT * FROM airport_aircraft


insert into airport_aircraft (aircraft_id, airport_code) VALUES (1, 'YYZ')
insert into airport_aircraft (aircraft_id, airport_code) VALUES (2,'YYZ')
insert into airport_aircraft (aircraft_id, airport_code) VALUES (3,'ZZY')
insert into airport_aircraft (aircraft_id, airport_code) VALUES (1,'ZZY')
insert into airport_aircraft (aircraft_id, airport_code) VALUES (4,'YZY')
insert into airport_aircraft (aircraft_id, airport_code) VALUES (4,'ZZY')
insert into airport_aircraft (aircraft_id, airport_code) VALUES (5, 'ZYZ')
insert into airport_aircraft (aircraft_id, airport_code) VALUES (6, 'KYZ')
insert into airport_aircraft (aircraft_id, airport_code) VALUES (7, 'ZZZ')
insert into airport_aircraft (aircraft_id, airport_code) VALUES (8, 'YYY')
insert into airport_aircraft (aircraft_id, airport_code) VALUES (9,'KYK')
insert into airport_aircraft (aircraft_id, airport_code) VALUES (10, 'KYY')
insert into airport_aircraft (aircraft_id, airport_code) VALUES (8, 'KYY')
insert into airport_aircraft (aircraft_id, airport_code) VALUES (9, 'KYY')
insert into airport_aircraft (aircraft_id, airport_code) VALUES (7, 'YZY')
insert into airport_aircraft (aircraft_id, airport_code) VALUES (3,'KYK')
insert into airport_aircraft (aircraft_id, airport_code) VALUES (1, 'ZZZ')
insert into airport_aircraft (aircraft_id, airport_code) VALUES (3,'ZZZ')
insert into airport_aircraft (aircraft_id, airport_code) VALUES (3,'ZYZ')
insert into airport_aircraft (aircraft_id, airport_code) VALUES (3,'KYK')


-- shows that aircraft can take off/land from many airports --

SELECT * FROM aircraft ac, airports a, airport_aircraft aa
where aa.aircraft_id = ac.aircraft_id
and aa.airport_code = a.airport_code
and ac.aircraft_id = 3
order by a.airport_id



-- 4. what airports have passengers used (airports can only be in one city) passengers can also only be in one city) --

select * from passengers p, airports a
where p.home_city_id = a.airport_id
and p.home_city_id = a.airport_id
-- can specify value if you want to target passenger to the airports city
and p.home_city_id = 10

-- UPDATING AIRPORT_AIRCRAFT TABLE WITH FK AND PK's--
SELECT * FROM airport_aircraft;
SELECT * FROM airports;
SELECT * FROM airport_city;
UPDATE airport_aircraft SET airport_id = 1 WHERE airport_code = 'YYZ';
UPDATE airport_aircraft SET airport_id = 2 WHERE airport_code = 'ZZY';
UPDATE airport_aircraft SET airport_id = 3 WHERE airport_code = 'YYY';
UPDATE airport_aircraft SET airport_id = 4 WHERE airport_code = 'YZY';
UPDATE airport_aircraft SET airport_id = 5 WHERE airport_code = 'ZYZ';
UPDATE airport_aircraft SET airport_id = 6 WHERE airport_code = 'ZZZ';
UPDATE airport_aircraft SET airport_id = 7 WHERE airport_code = 'ZZZ';
UPDATE airport_aircraft SET airport_id = 8 WHERE airport_code = 'YYY';
UPDATE airport_aircraft SET airport_id = 9 WHERE airport_code = 'KYK';
UPDATE airport_aircraft SET airport_id = 10 WHERE airport_code = 'KYY';

SELECT  airport_aircraft, aircraft.aircraft_id 
FROM airport_aircraft
INNER JOIN aircraft
ON airport_aircraft.aircraft_id = aircraft.aircraft_id

SELECT airport_aircraft, airport_aircraft.aircraft_id, airport_aircraft.airport_id
FROM airport_aircraft


SELECT * FROM airports ap INNER JOIN aircraft a ON ap.airport_id = a.aircraft_id

