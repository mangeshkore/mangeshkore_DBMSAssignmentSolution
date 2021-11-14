-- Creating database
Create Database if not exists `travel_on_the_go` ;
use `travel_on_the_go`;

-- 1. You are required to create two tables PASSENGER and PRICE with the following attributes and properties

create table if not exists `passenger`(
`passenger_id` INT NOT NULL,
`passenger_name` varchar(50),
`category` varchar(50) ,
`gender` CHAR,
`boarding_city` varchar(50),
`destination_city` varchar(50),
`distance` int NOT NULL,
`bus_type` VARCHAR(20) NOT NULL,
 PRIMARY KEY (`passenger_id`)
);


CREATE TABLE IF NOT EXISTS `price` (
  `price_id` INT NOT NULL,
  `bus_type` VARCHAR(20) NOT NULL,
  `distance` int NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`price_id`)
);

-- 2. Insert the following data in the tables

insert into `passenger` values(1,"Sejal","AC",'F',"Bengaluru","Chennai",350,"Sleeper");
insert into `passenger` values(2,"Anmol","Non-AC",'M',"Mumbai","Hyderabad",700,"Sitting");
insert into `passenger` values(3,"Pallavi","AC",'F',"Panaji","Bengaluru",600,"Sleeper");
insert into `passenger` values(4,"Khusboo","AC",'F',"Chennai","Mumbai",1500,"Sleeper");
insert into `passenger` values(5,"Udit","Non-AC",'M',"Trivandrum","Panaji",1000,"Sleeper");
insert into `passenger` values(6,"Ankur","AC",'M',"Nagpur","Hyderabad",500,"Sitting");
insert into `passenger` values(7,"Hemant","Non-AC",'M',"Panaji","Mumbai",700,"Sleeper");
insert into `passenger` values(8,"Manish","Non-AC",'M',"Hyderabad","Bengaluru",500,"Sitting");
insert into `passenger` values(9,"Piyush","AC",'M',"Pune","Nagpur",700,"Sitting");

insert into `price` values(1,"Sleeper",350,770);
insert into `price` values(2,"Sleeper",500,1100);
insert into `price` values(3,"Sleeper",600,1320);
insert into `price` values(4,"Sleeper",700,1540);
insert into `price` values(5,"Sleeper",1000,2200);
insert into `price` values(6,"Sleeper",1200,2640);
insert into `price` values(7,"Sleeper",350,434);
insert into `price` values(8,"Sitting",500,620);
insert into `price` values(9,"Sitting",600,744);
insert into `price` values(10,"Sitting",700,868);
insert into `price` values(11,"Sitting",1000,1240);
insert into `price` values(12,"Sitting",1200,1488);
insert into `price` values(13,"Sitting",1500,1860);

-- 3. How many females and how many male passengers travelled for a minimum distance of 600 KM s?

select gender,count(gender) as Passengers from passenger where distance>=600 group by gender;

-- 4. Find the minimum ticket price for Sleeper Bus.

select min(price) from price where bus_type="Sleeper";

-- 5. Select passenger names whose names start with character 'S'

select passenger_name from passenger where passenger_name like "S%";

-- 6. Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output

select P.passenger_name,P.boarding_city,P.destination_city,P.bus_type, Pr.price as price from passenger P
 inner join price Pr on P.bus_type = Pr.bus_type and P.distance = Pr.distance group by P.passenger_name; 

-- 7) What is the passenger name and his/her ticket price who travelled in Sitting bus for a  distance of 1000 KM s

select P.passenger_name,Pr.price from passenger P inner join price Pr 
on P.bus_type=Pr.bus_type and P.distance=Pr.distance where P.bus_type="Sitting" and P.distance=1000;

-- 8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?

select Pr.bus_type, Pr.price from passenger P, price Pr where P.passenger_name = 'Pallavi' and P.distance = Pr.distance;

-- 9) List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order.

select distinct distance from passenger order by distance DESC;

-- 10) Display the passenger name and percentage of distance travelled by that passenger from the total distance travelled by all passengers without using user variables

Select passenger_name, (distance /(Select sum(distance) from passenger) * 100) as Percentage_of_Distance_travelled from passenger;

-- 11) Display the distance, price in three categories in table Price
-- a) Expensive if the cost is more than 1000
-- b) Average Cost if the cost is less than 1000 and greater than 500
-- c) Cheap otherwise

select distance, price,
case  
	when price > 1000 then 'Expensive'
    when price <= 1000 and price > 500 then 'Average Cost'
    else 'Cheap'
end as price_category
from price;



