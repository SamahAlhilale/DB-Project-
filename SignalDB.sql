CREATE database IF NOT EXISTS `SignalDB`;
use`SignalDB`;

CREATE TABLE IF NOT EXISTS `METRO` (
`Metro_number` int (5) NOT NULL,
`Speed` float (4),
`Capacity` int (10),
CONSTRAINT `METRO_PK` PRIMARY KEY (`Metro_number`)
);

CREATE TABLE IF NOT EXISTS `METRO_OPREATOR` (
`Opreator_id` int (5) NOT NULL,
`WorkingDays` VARCHAR (3) CHECK ( `WorkingDays` IN('sun','mon','tue','wed','thu','fri','sat')),
`WorkingTime` DATETIME,
CONSTRAINT `METRO_OPREATOR_PK` PRIMARY KEY (`Opreator_id`)
);

CREATE TABLE IF NOT EXISTS `METRO` (
`Metro_number` int (5) NOT NULL,
`Speed` float (4),
`Capacity` int (10),
CONSTRAINT `METRO_PK` PRIMARY KEY (`Metro_number`)
);

CREATE TABLE IF NOT EXISTS `DRIVES_OPREATOR` (
`Metro_number` int (5) NOT NULL,
`Opreator_id` int (5) NOT NULL,
CONSTRAINT `DRIVES_OPREATOR_PK` PRIMARY KEY (`Metro_number`,`Opreator_id`),
CONSTRAINT `DRIVES_OPREATOR_FK1` FOREIGN KEY (`Metro_number`)
REFERENCES `METRO`(`Metro_number`)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT `DRIVES_OPREATOR_FK2` FOREIGN KEY (`Opreator_id`)
REFERENCES `METRO_OPREATOR`(`Opreator_id`)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `STATION` (
`Station_number` int (5) NOT NULL,
`Metro_number` int (5) NOT NULL,
`Location` varchar (10),
`StopPoint` varchar (10),
CONSTRAINT `STATION_PK` PRIMARY KEY (`Station_number`),
CONSTRAINT `STATION_FK1` FOREIGN KEY (`Metro_number`)
REFERENCES `METRO`(`Metro_number`)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `PASSENGER` (
  `Passenger_ID` INT (5)  NOT NULL ,
  `Metro_number` int (5) ,
  `Fname` VARCHAR(50) NOT NULL,
  `Lname` VARCHAR(50) NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `PhoneNumber` VARCHAR(20) NOT NULL,
  `Nationality` VARCHAR(50) NOT NULL,
  `DateOfBirth` DATE NOT NULL,
 CONSTRAINT `PASSENGER_pk` PRIMARY KEY (`Passenger_ID`),
CONSTRAINT `PASSENGER_FK1` FOREIGN KEY (`Metro_number`)
REFERENCES `METRO`(`Metro_number`)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `BOARD` (
`Station_number` INT(5) NOT NULL,
`Passenger_id` INT(5) NOT NULL,
CONSTRAINT `BOARD_PK` PRIMARY KEY (`Station_number`,`Passenger_id`),
CONSTRAINT`BOARD_FK1` FOREIGN KEY (`Station_number`)
 REFERENCES `STATION`(`Station_number`)
 ON DELETE CASCADE
 ON UPDATE CASCADE,
CONSTRAINT `BOARD_FK2` FOREIGN KEY (`Passenger_id`) 
REFERENCES `PASSENGER`(`Passenger_id`) 
ON DELETE CASCADE
 ON UPDATE CASCADE
 );

CREATE TABLE IF NOT EXISTS`DEBOARD`(
`Station_number` INT(5) NOT NULL,
`Passenger_id` INT(5) NOT NULL,
CONSTRAINT `DEBOARD_PK` PRIMARY KEY (`Station_number`,`Passenger_id`),
CONSTRAINT `DEBOARD_FK1` FOREIGN KEY (`Station_number`)
 REFERENCES `STATION`(`Station_number`) 
 ON DELETE CASCADE
 ON UPDATE CASCADE,
CONSTRAINT `DEBOARD_FK2` FOREIGN KEY (`Passenger_id`)
 REFERENCES `PASSENGER`(`Passenger_id`) 
 ON DELETE CASCADE
 ON UPDATE CASCADE
 );


CREATE TABLE IF NOT EXISTS `TRIP` (
    `Trip_number` INT(5)NOT NULL,
    `TripType` VARCHAR(50),
    `Departure_Time` TIME,
    `ReturnTime` TIME,
    `Origin` VARCHAR(50),
    `Destination` VARCHAR(50),
   `TripDate` DATE,
   `TripTime` TIME,
   CONSTRAINT `TRIP_pk` PRIMARY KEY (`Trip_number`) 
);

CREATE TABLE  IF NOT exists `BOOKS_TICKET` (
    `Ticket_number` INT(5) NOT NULL,
    `SeatType` VARCHAR(50),
    `TicketPrice` DECIMAL(10, 2),
    `Passenger_id` INT(5),
    `Trip_number` INT(5),
CONSTRAINT `Ticket_pk` PRIMARY KEY (`Ticket_number`),
CONSTRAINT `BOOKS_TICKET_FK1` FOREIGN KEY (`Passenger_id`)
 REFERENCES `PASSENGER`(`Passenger_id`) 
 ON DELETE CASCADE
 ON UPDATE CASCADE,
CONSTRAINT `BOOKS_TICKET_FK2` FOREIGN KEY (`Trip_number`)
 REFERENCES `TRIP`(`Trip_number`) 
 ON DELETE CASCADE
 ON UPDATE CASCADE
);