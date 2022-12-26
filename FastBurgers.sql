Create Database FastBurgersDB

Use FastBurgersDB


-- CREATE TABLE Persons
-- (
--     Personid int IDENTITY(1,1) PRIMARY KEY,
--     Name varchar    (255) NOT NULL,
--     Age int
-- );
-- select *
-- from persons

-- Insert into Persons
--     (Name,Age)
-- values
--     ('Soe Soe', 22),
--     ('Kyaw Gyi', 22),
--     ('Myint Aung', 32),
--     ('Andre', 28)



Create Table customer
(
    -- Personid int IDENTITY(1,1) PRIMARY KEY,
    cusId int not null Primary Key,
    cusName varchar(50) not null,
    gender bit
)

Create Table location
(
    franchiseId int not null primary key,
    franchiseName varchar(50) not null,
    address varchar(100) not null,
    phoneNo varchar(30) not null,
)

Create Table shift
(
    shiftId int not null primary key,
    shiftName varchar(50) not null,
    shiftDays varchar(30),
    shiftStart time(0),
    shiftEnd time(0)
)

Create Table staff
(
    staffid int not null primary key,
    staffName varchar(50) not null,
    shiftId int,
    Foreign Key (shiftId) References shift(shiftId),
    position varchar(30),
    phoneNo varchar(20),
    email varchar(30)
)

Create Table orders
(
    orderid int not null primary key,
    orderDate date not null,
    orderTime time(0),
    cusId int not null,
    Foreign Key (cusId) references customer(cusId),
    staffid int not null,
    Foreign Key (staffid) references staff(staffid),
    franchiseId int not null,
    Foreign Key (franchiseId) references location(franchiseId),
    totalAmount int,
    totaQuantity int,
    paymentMethod varchar(20) not null,
)

Create Table rawMaterial
(
    rawId int not null primary key,
    rawMaterialName varchar(50) not null,
    rawMaterialLeft int,
)

Create Table menu
(
    menuId int not null primary key,
    menuName varchar(30) not null,
    startDate date,
    endDate date,
    startTime time(0),
    endTime time(0)
)

Create Table item
(
    itemId int not null primary key,
    menuId int not null,
    Foreign Key (menuId) references menu(menuId),
    itemName varchar(30) not null,
    -- foodType varchar(30) not null,
    unitPrice float
)

Create Table productionDetail
(
    rawid int not null,
    Foreign Key (rawid) references rawMaterial(rawid),
    itemId int not null,
    Foreign Key (itemId) references item(itemId),
    totaQuantity int
)

Create Table orederDetail
(
    orderid int not null,
    Foreign Key (orderid) references orders(orderid),
    itemId int not null,
    Foreign Key (itemId) references item(itemId),
    unitPrice float,
    unitQuantity int
)


-- Insert Start

Insert into customer
    (cusId,cusName,gender)
Values
    (1, 'Hector Stanley', '1'),
    (2, 'Humbert Jacobs', '1'),
    (3, 'Wally Parsons', '1'),
    (4, 'Gavin Hawkins', '1'),
    (5, 'Percival Anderson', '1'),
    (6, 'Polly Pearce', '0'),
    (7, 'Ivy Chavez', '0'),
    (8, 'Vania Hardy', '0'),
    (9, 'Isabella Alexander', '0'),
    (10, 'Eloise Obrien', '0')

select *
from customer



Insert into location
    (franchiseId,franchiseName,address,phoneNo)
Values
    (1, 'PRESTON', '22 School Lane,PR18 8ML', '01632 960057'),
    (2, 'NORTH LONDON', '34 Station Road, N97 6NU', '01632 960641'),
    (3, 'Manchester', '9542 Grove Road, BD67 6IC', '01632 960340'),
    (4, 'GLASGOW', '73 Windsor Road', '01632 960607'),
    (5, 'WEST LONDON', '45 Victoria Road', '01632 960208'),
    (6, 'OXFORD', '9145 West Street', '+44-735-556-5932'),
    (7, 'ROMFORD', '8 Manchester Road', '+44-715-559-1478'),
    (8, 'PRESTON', '97 Highfield Road', '+44-755-553-1741'),
    (9, 'BRISTOL', '27 Albert Road', '+44-765-555-2048'),
    (10, 'LIVERPOOL', '10 London Road', '+44-735-555-5319'),
    (11, 'NOTTINGHAM', '32 The Drive', '+44-785-555-2381')

select *
from location

Insert into shift
    (shiftId,shiftName,shiftDays,shiftStart,shiftEnd)
Values
    (1, 'MorningD', 'Weekdays', '07:00', '12:00'),
    (2, 'EveningD', 'Weekdays', '12:00', '17:00'),
    (3, 'NightD', 'Weekdays', '17:00', '22:00'),
    (4, 'MorningE', 'Weekends', '07:00', '12:00'),
    (5, 'EveningE', 'Weekends', '12:00', '17:00'),
    (6, 'NightE', 'Weekends', '17:00', '22:00'),
    (7, 'Extra', '', '', '')

select *
from shift

Insert into staff
    (staffid,staffName,shiftId,position,phoneNo)
Values
    (1, 'David', 1 , 'Manager', '01632 960600' ),
    (2, 'Jackson Lyons', 2, 'Manager', '01632 960600' ),
    (3, 'Baz Robinson', 3  , 'Manager', '01632 960600' ),
    (4, 'Ju Sun-Hi', 4 , 'Manager', '01632 960600' ),
    (5, 'Jin Seok', 5   , 'Manager', '01632 960600' ),
    (26, 'Karl Schmidt', 6, 'Manager', '01632 960600' ),
    (27, 'Çiçek Çagri', 1  , 'Chef', '01632 960600' ),
    (6, 'Dawane', 2 , 'Chef', '01632 960600' ),
    (7, 'Han Dingxiang', 3  , 'Chef', '01632 960600' ),
    (8, 'Sun Ehuang', 4      , 'Chef', '01632 960600' ),
    (9, 'Madison Gregory', 5      , 'Chef', '01632 960600' ),
    (10, 'Mukhtar Niazi', 6    , 'Chef', '01632 960184' ),
    (11, 'Sakhira Ishmael', 1        , 'Waiter', '01632 960184' ),
    (28, 'Emiri Gürses', 2  , 'Waiter', '01632 960184' ),
    (12, 'Kano Tomoko', 3    , 'Waiter', '01632 960184' ),
    (13, 'Mahdi Nouri', 4, 'Waiter', '01632 960184' ),
    (14, 'Walter', 5    , 'Waiter', '01632 960184' ),
    (15, 'Leopoldo Armendariz', 6 , 'Waiter', '01632 960184' ),
    (16, 'Yeong Shin', 1    , 'Dishwasher', '01632 960184' ),
    (17, 'Scarlett Rowe', 2    , 'Dishwasher', '01632 960184' ),
    (18, 'Emma', 3      , 'Dishwasher', '01632 960184' ),
    (19, 'Cardi', 4    , 'Dishwasher', '01632 960225' ),
    (20, 'Celestina Fontanilla', 5       , 'Dishwasher', '01632 960225' ),
    (29, 'Gizem Terzi', 6 , 'Dishwasher', '01632 960225' ),
    (21, 'Simon Vaughn', 1 , 'Server', '01632 960225' ),
    (22, 'Kate Lambert', 2   , 'Server', '01632 960225' ),
    (23, 'Dawane', 3  , 'Server', '01632 960225' ),
    (24, 'Madison Rios', 4   , 'Server', '01632 960225' ),
    (25, 'Kendall Woolery', 5 , 'Server', '01632 960225' ),
    (30, 'Niagh Ojukwu', 6  , 'Server', '01632 960225' )


select *
from staff

select staffName "Names_of_the_Staff", position"Name of the Position"
From staff




Select *
from item
Alter table item Add foodType VARCHAR(30)



select *
from menu

Insert into menu
    (menuId,menuName,startDate,endDate,startTime,endTime)
Values
    (001, 'Regular Menu', Null, Null , Null , '11:00:00')

Update menu 
set startTime = '6:00'
where menuId = 001

Insert into menu
    (menuId,menuName,startDate,endDate,startTime,endTime)
Values
    (002, 'Saver Menu', '2022/12/1' , '2022/12/30' , '0:0:00', '23:59:59')





select *
from rawMaterial

Insert into rawMaterial
    (rawid, rawMaterialName,rawMaterialLeft)
Values
    (001, 'Burger Bum' , 88),
    (002, 'Sausages' , 88),
    (003, 'Potatoes' , 20)



Alter table item Add qtyLeft int


select *
from item

Insert into item
    (itemId, menuId,itemName,unitPrice,foodType,qtyLeft)