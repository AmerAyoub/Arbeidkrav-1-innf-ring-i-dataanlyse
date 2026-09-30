-- creatign a table named Drivers. 
create table Drivers(DriverID int, DriverName varchar(100),
City varchar(50), Region varchar (50));

-- Inset values into the Drivers table.
insert into Drivers(DriverID, DriverName, City, Region)
Values 
(1, 'Adam', 'Oslo', 'East'),
(2, 'Sara', 'Bergen', 'West'),
(3, 'Omar', 'Fredrikstad', 'East'),
(4, 'Lina', 'Stavebger', 'Weat'),
(5, 'Martin', 'Trondheim', 'North');

-- Alter the drivers table to make DriverID a primary key.
alter table Drivers add primary key (DriverID);

-- Fix a wrong value in Region colomn.
update Drivers
set Region = 'West'
where Region = 'Weat';

-- Check that wrong value is corrected.
select * from Drivers;

-- Creating the 2. table named Delivries.
create table Delivries(DeliveryID int, DeliveryDate date, DriverID int,
Packages int, Revenue numeric(10,2));

-- Insert values into the Delivries table.
insert into Delivries(DeliveryID, DeliveryDate, DriverID, Packages, Revenue)
values
(101, '2026-09-01', 1, 25, 4500),
(102, '2026-09-01', 2, 40, 7200),
(103, '2026-09-03', 1, 30, 5100),
(104, '2026-09-04', 3, 18, 3200),
(105, '2026-09-05', 4, 50, 8900),
(106, '2026-09-06', 2, 35, 6300),
(107, '2026-09-07', 5, 22, 4100),
(108, '2026-09-08', 3, 28, 4800);	

-- Check the Delivries Table
select * from Delivries;

-- Alter the Deliovries table to make DeliveryID a primary key.
alter table Delivries add primary key (DeliveryID)

-- Alter the Delivries table to make DriverID a foreign key.
alter table Delivries 
add foreign key (DriverID)
references Drivers (DriverID);

-- Creating a 3. table named RegionTarget.
create table RegionTargets(Region varchar(50), RevenueTarget int);

-- Insert values into 3. table.
insert into RegionTargets(Region, RevenueTarget)
values
('East', 15000),
('West', 20000),
('North', 7000);

-- Show only driver names and cities.
select * from Drivers;

-- Show only driver names and cities.
select  DriverName, City from Drivers;


-- Show drivers from the East region.
select DriverID, DriverName, Region from Drivers where Region = 'East';

select * from Drivers

-- Display all drivers and sort them alphabetically.
order by DriverName asc;

-- Count the total number of deliveries in the Delivries table.
select count (*) from Delivries;

-- Calculate total revenue from all deliveries.
select sum (Revenue) as totalrevenue
from Delivries;
select avg(Revenue) as avragerevenue
from Delivries;

-- Display DeliveryID and Revenue only for deliveries
select DeliveryID, Revenue from Delivries
where Revenue > 5000;

-- Join Drivers and Delivries using DriverID.
-- SUM(Packages) calculates the total number of packages
-- associated with each driver.
-- GROUP BY creates one result group for each driver.
select Drivers.DriverName, sum(packages) as totaldeliveris 
from Drivers
inner join Delivries
on Drivers.DriverID = Delivries.DriverID
group by DriverName;

-- Join Drivers and Delivries using DriverID.
-- SUM(Revenue) calculates the total revenue for each driver.
select Drivers.DriverName, sum(Revenue) as totalrevnue
from Drivers
inner join Delivries
on Drivers.DriverID = Delivries.DriverID
group by DriverName;

-- Join Drivers and Delivries using their matching DriverID values.
-- Display the driver's name and the revenue from each delivery.
-- INNER JOIN only returns rows where there is a match
-- between the two tables.
select Drivers.DriverName, Revenue
from Drivers
inner join Delivries
on Drivers.driverID = Delivries.DriverID;

-- Join Drivers with Delivries using DriverID.
-- Then join RegionTargets using Region.
-- This connects each delivery to the driver's region
-- and then connects that region to its revenue target.
-- SUM(Revenue) calculates the actual total revenue for each region.
-- GROUP BY groups the results by Region and RevenueTarget.
select Drivers.Region, RegionTargets.RevenueTarget,
sum(Revenue) as totalRegion
from Drivers

inner join Delivries
on Drivers.DriverID = Delivries.DriverID

inner join RegionTargets
on Drivers.Region = Regiontargets.Region
group by Drivers.Region, Regiontargets.RevenueTarget;

-- Insert Ahmad into the Drivers table.
-- Ahmad does not have a matching row in the Delivries table.
-- This will help demonstrate the difference between
-- INNER JOIN and LEFT OUTER JOIN.
insert into Drivers(DriverID, DriverName, City, Region)
values
(6, 'Ahmad', 'Drammen', 'East');

-- Display all drivers to check that Ahmad was added successfully.
select * from Drivers;

-- Join Drivers and Delivries using DriverID.
-- INNER JOIN only displays drivers that have matching deliveries.
-- Ahmad will NOT appear because he does not have a delivery.
select Drivers.DriverName, Delivries.DeliveryID, Delivries.Revenue
from Drivers
inner join Delivries
on Drivers.DriverID = Delivries.DriverID;

-- LEFT OUTER JOIN keeps all rows from the left table (Drivers).
-- Drivers with matching deliveries will show their delivery data.
-- Ahmad will also appear even though he has no delivery.
-- His DeliveryID and Revenue values will therefore be NULL.
select Drivers.DriverName, Delivries.DeliveryID, Delivries.Revenue
from Drivers
left outer join Delivries
on Drivers.DriverID = Delivries.DriverID;
