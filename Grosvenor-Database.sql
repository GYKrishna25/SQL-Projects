--- INTRODUCTION: In this Project we will be introduced to creating database, tables and inserting sample data. 
--- Then we will start executing the SQL queries against the database that we have created, exploring the SQL DML language. 

-- Creating my database with below given name
CREATE DATABASE Grosvenor;
USE Grosvenor;


-- here i am creating structure and dumping values into table 
-- Each Question and answer are at end of the table creation from 105th line

--
-- Table structure for table `countries`
--

create table Hotel(hotel_no char(4) not null, 
                   hotel_name varchar(20) not null, 
                   hotel_address varchar(50) not null,
                   primary key(hotel_no));
                   
--
-- Dumping data for table `Room`
--                   
create table Room(room_no varchar(4) not null,
                   hotel_no char(4) not null,
				  type char(1) not null,
				  price decimal(5,2) not null,
                  PRIMARY KEY(room_no),
				  foreign key (hotel_no) references hotel(hotel_no));
                  
--
-- Dumping data for table `Guest`
--
                  
create table Guest(guest_no char(4) not null,
                   guest_name varchar(20) not null,
                   guest_address varchar(50) not null,
                   primary key (guest_no));
                   
 --
-- Dumping data for table `Booking`
--                  

Create table Booking(hotel_no char(4) not null,
                    guest_no char(4) not null,
					date_from DATE not null,
					date_to DATE null,
                    room_no char(4) not null,
					foreign key (hotel_no) references hotel(hotel_no),
					foreign key (guest_no) references guest(guest_no),
                     foreign key (room_no) references room(room_no));

--
-- Dumping data for table `Hotel`
--
insert into Hotel values('H111','Grosvenor Hotel','London'),
						('H112','Taj Villas Hotel','India'),
						('H113','Grand Hotel','USA');
                        
  --
-- Dumping data for table `Room`
-- 
truncate room;                     
insert into Room values('H1','H111','S',30.00),('H2','H111','D',50.00),('H3','H111','F',70.00),
                       ('H4','H111','S',35.00),('H5','H111','D',55.00),('H6','H111','F',30.00),
					   ('T1','H112','S',25.00),('T2','H112','D',55.00),('T3','H112','F',60.00),
                       ('T4','H112','S',30.00),('T5','H112','D',60.00),('T6','H112','F',65.00),
                       ('G1','H113','S',50.00),('G2','H113','D',70.00),('G3','H113','F',30.00),
                       ('G4','H113','S',55.00),('G5','H113','D',75.00),('G6','H113','F',100.00);

--
-- Dumping data for table `Guest`
--
insert into Guest values('G111','John Smith','London'),
                         ('G112',' Rahul Dravid','India'),
                         ('G113','Layla','USA'),
                         ('G114','Peeth','Dubai'),
                         ('G115','Stella','London'),
                         ('G116','Disha','Canada'),
                         ('G117','scralott','UK'),
                         ('G118','Mike','Germany'),
                         ('G119','Jerry Seinfeld','USA'), 
                         ('G120','Shahrukh Khan','India');
/* These values are taken for as Booking table to hold archive records */
insert into guest values('G100','Mohisha patel' ,'Australia'),                                 
						('G101','Susen singh','China');  
 delete from guest where guest_no in ('G100', 'G101');                                    
 --
-- Dumping data for table `Booking`
--               
insert into Booking values('H111','G111','2022-07-01', '2022-07-05','H1'),
                          ('H111','G112','2022-07-06', '2022-07-10','H2'),
                          ('H111','G113','2022-07-11', '2022-07-15','H3'),
                          ('H111','G114','2022-07-16','2022-07-20' ,'H4'),
						  ('H111','G115', '2022-07-21',null,'H5'),                                    
						  ('H111','G116','2022-07-15', '2022-07-21','H6'),
                          ('H111','G117','2022-07-19', '2022-07-21','H2'),
						  ('H111','G118','2022-07-19', '2022-07-21','H3'),
						  ('H111','G119', '2022-08-01','2022-08-10','H1'),
						  ('H111','G120', '2022-08-11','2022-08-15','H2');
/* These values are taken for as Booking table to hold archive records to represent in booking_old*/
insert into booking values('H111','G100', '1999-07-01','1999-07-10','H1'),
						  ('H111','G101', '1999-07-07','2022-07-15','H2');   
delete from booking where guest_no in ('G100', 'G101');

-- SIMPLE QUERIES QUESTION AND ANSWERS
-- QSTN-1 :- List full details of all hotels.

-- SYNTAX:
SELECT * FROM Hotel;
--- using select * for getting all details of hotels
-----------------------------------------------------------------------------------------------------

-- 	QSTN-2 :- List full details of all hotels in London.

-- SYNTAX:
SELECT * FROM Hotel	
WHERE hotel_address = "London";
-- using where condition to = operator finding the hotels in London
-----------------------------------------------------------------------------------------------------

-- QSTN-3 :- List the names and addresses of all guests in London, aplhabetically ordered by name.

-- SYNTAX:
SELECT guest_name, guest_address
FROM Guest
WHERE guest_address like '%London%'
ORDER BY guest_name ASC;

-- way:2
SELECT guest_name, guest_address
FROM  Guest
WHERE guest_address = 'London'
ORDER BY guest_name ASC;

--  using where clause to finding guest name who lives in london
----------------------------------------------------------------------------------------------------------

-- QSTN-4 :- List all double or family rooms with a price below 40.00 per night, in ascending order of price.

-- SYNTAX way 1:
SELECT * FROM Room
WHERE (type = 'D' OR type = 'F') AND (price < 40.00) 
ORDER BY price ASC;
--  Here we are using where Clause to check the price <40 and using "Comparison operator" to check Double or Family rooms , 
-- using order by to get prices in ascending order

-- SYNTAX way 2:
SELECT * FROM Room
WHERE type IN ('D', 'F') AND (price < 40.00) 
ORDER BY price ASC;

--  Here we are using where Clause to check the price <40 and using "IN "  operator to check Double or Family rooms , 
-- using order by to get prices in ascending order
-----------------------------------------------------------------------------------------------------------

-- QSTN-5 :- List the booking for which no data_to has been specified.

-- SYNTAX:
SELECT *
FROM Booking
WHERE date_to IS NULL;

--  Here using IS Null to check any date wasn't specified.
-----------------------------------------------------------------------------------------------------------
 
-- AGGREGATE FUNCTIONS QUESTION AND ANSWERS

-- QSTN-1 :- How many hotels are there? 

-- SYNTAX:
SELECT COUNT(*) as no_of_hotels
FROM Hotel;

-- Here using Aggregate function count to finding no. of hotels
---------------------------------------------------------------------------------------------------------------

-- QSTN-2 :- What is the average price of a room?

-- SYNTAX:
SELECT ROUND(AVG(price), 2)
FROM Room;

-- Here using Aggregate Function Avg to find average price of room.
--  used round() function to get desired float values.
---------------------------------------------------------------------------------------------------------------

-- QSTN-3 :- What is the total revenue per night from all double rooms?

-- SYNTAX:
SELECT SUM(price)
FROM Room
WHERE type = 'D';

-- Here using Aggregate Function sum() to find the total price per night of double rooms
-----------------------------------------------------------------------------------------------------------------

-- QSTN-4 :- How many different guests have made bookings for August?

-- SYNTAX:
SELECT COUNT(DISTINCT guest_no)
FROM Booking
WHERE date_from >= '2022-08-01' and date_to <= '2022-08-31';

-- Here we are counting diff no.of guests using where clause to check who made bookings for August.
-----------------------------------------------------------------------------------------------------------------------

-- SUBQUERIES AND JOIN QUESTION AND ANSWERS

-- QSTN-1 :- List the price and type of all rooms at the Grosvenor hotel 

-- SYNTAX:
SELECT price, type 
from Room 
where hotel_no in (select hotel_no from hotel where hotel_name = "Grosvenor Hotel"); 

-- way2
SELECT price, type
FROM Room R, Hotel H
WHERE H.hotel_no = R.hotel_no
AND hotel_name = 'Grosvenor Hotel';
 
-- Here we are finding price and type of hotel where hotel name is Grosvenor hotel using SUBQUERIES AND JOINs
------------------------------------------------------------------------------------------------------------------------
-- QSTN-2 :- List all guests currently staying at the Grosvenor hotel

SELECT G.guest_no, guest_name, guest_address, room_no
FROM Guest G JOIN Booking B ON G.guest_no = B.guest_no
JOIN Hotel H ON B.hotel_no = H.hotel_no 
WHERE (B.date_From <= CURRENT_DATE() AND 
B.date_to >= CURRENT_DATE()) AND (hotel_name = 'Grosvenor Hotel');

-- 
---------------------------------------------------------------------------------------------------------------------
-- QSTN-3 :- List the detials of all rooms at the grosvenor hotel,including the name of guest staying in the room,if the room is occupied.

SELECT G.guest_no, guest_name, guest_address, B.room_no
from room R left join booking B on R.room_no = B.room_no
join guest G on G.guest_no = B.guest_no 
join hotel H on  B.hotel_no = H.hotel_no
WHERE (B.date_From <= CURRENT_DATE() AND 
B.date_to >= CURRENT_DATE()) AND (hotel_name = 'Grosvenor Hotel');

Select guest_name, r.* From Room r
LEFT JOIN ( select g.guest_Name, h.hotel_no, b.Room_no
FROM Guest g, Booking b, Hotel h
WHERE g.guest_no = b.guest_no AND b.hotel_no = h.hotel_no AND 
h.hotel_name = 'Grosvenor Hotel' AND 
b.Date_from <= current_date AND b.Date_to >= current_date) AS curr_booking
ON r.hotel_no = curr_booking.hotel_no AND r.Room_no = curr_booking.Room_no;

-----------------------------------------------------------------------------------------------------

-- QSTN-4 :- What is the total income from bookings for the Grosvenor Hotel today?

-- syntax way 1;
SELECT  hotel_name, date_from, SUM(price) as total_income
FROM Room R JOIN Booking B ON R.room_no = B.room_no
JOIN Hotel H ON B.hotel_no = H.hotel_no 
WHERE B.date_from = current_date() 
AND hotel_name = 'Grosvenor Hotel';

-- syntax way 2;
SELECT  hotel_name, date_from, SUM(price) as total_income
FROM Room R JOIN Booking B ON R.room_no = B.room_no
JOIN Hotel H ON B.hotel_no = H.hotel_no 
WHERE B.date_from IN (select date_from FROM booking WHERE date_from = current_date()) 
AND hotel_name = 'Grosvenor Hotel';

 -- here we are finding total income at Grosvenor Hotel today using sum() function
-----------------------------------------------------------------------------------------------------------
-- QSTN-5 :- List the rooms that are currently unoccupied at the grosvenor hotel.

-- SYNTAX
SELECT R.*
FROM Room R JOIN Booking B ON R.room_no = B.room_no
JOIN Hotel H ON B.hotel_no = H.hotel_no 
WHERE R.room_no NOT IN (select room_no FROM booking WHERE date_from <= current_date() and date_to >= current_date())
AND hotel_name = 'Grosvenor Hotel';

-- here using NOT In operator we are finding rooms that are unoccupied in Grosvenor hotel
-----------------------------------------------------------------------------------------------------------------

-- QSTN-6 :-.What is the lost income from unoccupied rooms at the grosvenor hotel.

-- SYNATX
SELECT sum(price) 
FROM Room R JOIN Booking B ON R.room_no = B.room_no
JOIN Hotel H ON B.hotel_no = H.hotel_no 
WHERE R.room_no NOT IN (select room_no FROM booking WHERE date_from <= current_date() and date_to >= current_date()) 
AND hotel_name = 'Grosvenor Hotel';

-- here we are using sum(), NOT IN operator to calculate price of unoccupied rooms 
--------------------------------------------------------------------------------------------------------------
-- GROUPING 

-- QSTN- 1 :- List the number of rooms in each hotel

SELECT hotel_no, COUNT(room_no) AS count FROM Room
GROUP BY hotel_no;

-- here we are using aggregate function count() to count no of rooms in each hotel
---------------------------------------------------------------------------------------------------------

-- QSTN-2 :- List the number of rooms in each hotel in London.

-- syntax:
SELECT hotel_no, hotel_name, COUNT(room_no) AS total_rooms FROM Room R
NATURAL JOIN Hotel H
WHERE  hotel_address  = 'London'
GROUP BY hotel_no;

-- here we are using aggregate function count() to count no of rooms in hotel at london
----------------------------------------------------------------------------------------------------------------

-- QSTN-3 :- What is the average number of bookings for each hotel in August?

-- SYNTAX way 
SELECT hotel_no, hotel_name, ROUND(avg (price), 2)  as avg_price FROM Room
NATURAL JOIN Booking
NATURAL JOIN Hotel
WHERE (date_from >= '2022-08-01' AND date_to <= '2022-08-30')
GROUP BY hotel_no; 

-- Here we are using Function Average to calculate Average bookings in August
---------------------------------------------------------------------------------------------------

-- QSTN-4: What is the most commonly booked room type for each hotel in London?

-- SYNATX
SELECT type, count(type) AS max from Room  R
JOIN Booking B
ON R.room_no=B.room_no
JOIN Hotel H ON B.hotel_no=H.hotel_no
WHERE hotel_address='London'
GROUP BY type 
ORDER BY max DESC
LIMIT 1;

-- here using Aggregate Function max, order by , limit to check the Mostly Booked Rooms in London
----------------------------------------------------------------------------------------------------------------

-- QSTN-5 :- What is the lost income from unoccupied rooms at each hotel today?

SELECT hotel_no, SUM(price) FROM Room r
WHERE room_no NOT IN 
(SELECT room_no FROM Booking b, Hotel h
WHERE (date_from <= CURRENT_DATE() and date_to >= current_date()) AND 
b.hotel_no = h.hotel_no)
GROUP BY hotel_no;

-- Here we are using Aggregate Function Sum() and NOT In operator to check the lost income from unoccupied rooms
----------------------------------------------------------------------------------------------------------------------

--  Question :- Update the price of all rooms by 5%.
set sql_safe_updates = 0;
UPDATE Room SET price = (price/1.05);
---------------------------------------------------------------------------------------------------------------------

/* Question */
-- Create a separate table with the same structure as the Booking table to hold archive records. 
-- Using the INSERT statement, copy the records from the Booking table to the archive table relating to bookings before 1st January 2008. 
-- Delete all bookings before 1st January 2000 from the Booking table.

 
drop table booking_old;
Create table Booking_Old(hotel_no char(4) not null,
                        guest_no char(4) not null,
					    date_from DATE not null,
					    date_to DATE null,
                        room_no char(4) not null);

DESC Booking_Old;

INSERT INTO Booking_Old(SELECT * FROM booking WHERE date_to < '2000-01-01');

DELETE FROM booking WHERE date_to < '2000-01-01' ;

  --                    -----------------------------      CONCLUSION   -----------------------------------