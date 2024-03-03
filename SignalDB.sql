-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: signaldb
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `Station_number` int NOT NULL,
  `Passenger_id` int NOT NULL,
  PRIMARY KEY (`Station_number`,`Passenger_id`),
  KEY `BOARD_FK2` (`Passenger_id`),
  CONSTRAINT `BOARD_FK1` FOREIGN KEY (`Station_number`) REFERENCES `station` (`Station_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BOARD_FK2` FOREIGN KEY (`Passenger_id`) REFERENCES `passenger` (`Passenger_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,10001),(2,10002),(3,10003),(4,10004),(5,10005),(1,10006),(3,10007),(2,10008),(4,10009),(5,10010),(1,10011),(3,10012),(4,10013);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_ticket`
--

DROP TABLE IF EXISTS `books_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_ticket` (
  `Ticket_number` int NOT NULL,
  `SeatType` varchar(50) DEFAULT NULL,
  `TicketPrice` decimal(10,2) DEFAULT NULL,
  `Passenger_id` int DEFAULT NULL,
  `Trip_number` int DEFAULT NULL,
  PRIMARY KEY (`Ticket_number`),
  KEY `BOOKS_TICKET_FK1` (`Passenger_id`),
  KEY `BOOKS_TICKET_FK2` (`Trip_number`),
  CONSTRAINT `BOOKS_TICKET_FK1` FOREIGN KEY (`Passenger_id`) REFERENCES `passenger` (`Passenger_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BOOKS_TICKET_FK2` FOREIGN KEY (`Trip_number`) REFERENCES `trip` (`Trip_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_ticket`
--

LOCK TABLES `books_ticket` WRITE;
/*!40000 ALTER TABLE `books_ticket` DISABLE KEYS */;
INSERT INTO `books_ticket` VALUES (11001,'VIP',100.00,10007,13001),(11003,'VIP',150.00,10005,12002),(12001,'VIP',100.00,10013,15001),(12003,'Economy',99.50,10011,14002),(13001,'Economy',100.00,10008,13002),(13002,'Economy',200.00,10002,11002),(13003,'Economy',150.00,10006,12003),(14001,'Economy',200.00,10003,11003),(14002,'Economy',99.50,10012,14003),(14003,'VIP',100.00,10009,13003),(15001,'VIP',200.00,10004,12001),(15002,'VIP',100.00,10010,14001);
/*!40000 ALTER TABLE `books_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deboard`
--

DROP TABLE IF EXISTS `deboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deboard` (
  `Station_number` int NOT NULL,
  `Passenger_id` int NOT NULL,
  PRIMARY KEY (`Station_number`,`Passenger_id`),
  KEY `DEBOARD_FK2` (`Passenger_id`),
  CONSTRAINT `DEBOARD_FK1` FOREIGN KEY (`Station_number`) REFERENCES `station` (`Station_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DEBOARD_FK2` FOREIGN KEY (`Passenger_id`) REFERENCES `passenger` (`Passenger_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deboard`
--

LOCK TABLES `deboard` WRITE;
/*!40000 ALTER TABLE `deboard` DISABLE KEYS */;
INSERT INTO `deboard` VALUES (2,10001),(1,10002),(4,10003),(3,10004),(1,10005),(2,10006),(4,10007),(1,10008),(3,10009),(1,10010),(2,10011),(4,10012),(3,10013);
/*!40000 ALTER TABLE `deboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drives_opreator`
--

DROP TABLE IF EXISTS `drives_opreator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drives_opreator` (
  `Metro_number` int NOT NULL,
  `Opreator_id` int NOT NULL,
  PRIMARY KEY (`Metro_number`,`Opreator_id`),
  KEY `DRIVES_OPREATOR_FK2` (`Opreator_id`),
  CONSTRAINT `DRIVES_OPREATOR_FK1` FOREIGN KEY (`Metro_number`) REFERENCES `metro` (`Metro_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DRIVES_OPREATOR_FK2` FOREIGN KEY (`Opreator_id`) REFERENCES `metro_opreator` (`Opreator_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drives_opreator`
--

LOCK TABLES `drives_opreator` WRITE;
/*!40000 ALTER TABLE `drives_opreator` DISABLE KEYS */;
INSERT INTO `drives_opreator` VALUES (1,11011),(2,11011),(2,11022),(3,11033),(3,11044),(4,11044),(2,11055),(5,11055),(1,11066),(4,11077),(3,11099),(4,11099),(5,11099),(1,11100);
/*!40000 ALTER TABLE `drives_opreator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metro`
--

DROP TABLE IF EXISTS `metro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metro` (
  `Metro_number` int NOT NULL,
  `Speed` int DEFAULT NULL,
  `Capacity` int DEFAULT NULL,
  PRIMARY KEY (`Metro_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metro`
--

LOCK TABLES `metro` WRITE;
/*!40000 ALTER TABLE `metro` DISABLE KEYS */;
INSERT INTO `metro` VALUES (1,170,500),(2,200,400),(3,180,350),(4,210,450),(5,220,310);
/*!40000 ALTER TABLE `metro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metro_opreator`
--

DROP TABLE IF EXISTS `metro_opreator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metro_opreator` (
  `Opreator_id` int NOT NULL,
  `WorkingDays` varchar(3) DEFAULT NULL,
  `WorkingTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Opreator_id`),
  CONSTRAINT `metro_opreator_chk_1` CHECK ((`WorkingDays` in (_utf8mb3'sun',_utf8mb3'mon',_utf8mb3'tue',_utf8mb3'wed',_utf8mb3'thu',_utf8mb3'fri',_utf8mb3'sat')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metro_opreator`
--

LOCK TABLES `metro_opreator` WRITE;
/*!40000 ALTER TABLE `metro_opreator` DISABLE KEYS */;
INSERT INTO `metro_opreator` VALUES (11011,'sun','2023-06-23 10:30:00'),(11022,'mon','2023-06-25 09:30:00'),(11033,'tue','2023-07-23 00:45:00'),(11044,'wed','2023-08-03 00:00:00'),(11055,'thu','2023-09-16 10:30:00'),(11066,'fri','2023-06-20 11:00:00'),(11077,'sat','2023-06-23 10:30:00'),(11088,'sun','2023-10-20 00:00:00'),(11099,'sun','2023-07-06 18:30:00'),(11100,'mon','2023-06-03 10:30:00');
/*!40000 ALTER TABLE `metro_opreator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `Passenger_ID` int NOT NULL,
  `Metro_number` int DEFAULT NULL,
  `Fname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `Nationality` varchar(50) NOT NULL,
  `DateOfBirth` date NOT NULL,
  PRIMARY KEY (`Passenger_ID`),
  KEY `PASSENGER_FK1` (`Metro_number`),
  CONSTRAINT `PASSENGER_FK1` FOREIGN KEY (`Metro_number`) REFERENCES `metro` (`Metro_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (10001,1,'Maritta','Thomas','maritta1@gmail.com','05698756','Syrian','1999-02-11'),(10002,2,'Feras','Ahmad','feras12@gmail.com','05697856','Saudi','2000-12-01'),(10003,3,'Joey','Ram','joey@gmail.com','05098767','British ','1998-08-09'),(10004,4,'Taylor','Swift','taylor12@gmail.com','05069785','British','1994-09-21'),(10005,5,'Afnan','Ali','betty@gmail.com','05069789','Saudi','2001-04-22'),(10006,3,'Sara','Mohmmad','Sara21@gmail.com','05669797','Qatari','2001-07-08'),(10007,5,'Ahmad','Ali','Amad22@gmail.com','05679694','Kuwaiti','1998-11-22'),(10008,3,'Aisha','Faisal','Aisha122@gmail.com','05697986','Kuwaiti','1990-10-11'),(10009,2,'Jana','Abdulattif','Jana222@gmail.com','05679795','Saudi','2004-01-24'),(10010,3,'Samah','Humood','Samah45@gmail.com','05676489','Saudi','2001-04-12'),(10011,1,'Amjad','Awad','amjadaa@gmail.com','05684737','Saudi','2003-05-22'),(10012,2,'Anwar','Ahmad','anwar333@gmail.com','05387879','Saudi','2003-04-11'),(10013,4,'Rehab ','Khalid','Rehab@gmail.com','05458687','Saudi','2001-01-11');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station` (
  `Station_number` int NOT NULL,
  `Metro_number` int NOT NULL,
  `Location` varchar(10) DEFAULT NULL,
  `StopPoint` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Station_number`),
  KEY `STATION_FK1` (`Metro_number`),
  CONSTRAINT `STATION_FK1` FOREIGN KEY (`Metro_number`) REFERENCES `metro` (`Metro_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (1,1,'MAKKAH','JEDDAH'),(2,2,'JEDDAH','MAKKAH'),(3,3,'RIYADH','MAKKAH'),(4,4,'DAMMAM','RIYADH'),(5,5,'RIYADH','MAKKAH');
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip` (
  `Trip_number` int NOT NULL,
  `TripType` varchar(50) DEFAULT NULL,
  `Departure_Time` time DEFAULT NULL,
  `ReturnTime` time DEFAULT NULL,
  `Origin` varchar(50) DEFAULT NULL,
  `Destination` varchar(50) DEFAULT NULL,
  `TripDate` date DEFAULT NULL,
  `TripTime` time DEFAULT NULL,
  PRIMARY KEY (`Trip_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (11002,'OneWay','15:00:00','00:00:00','RIYADH',NULL,'2023-09-25','10:30:00'),(11003,'OneWay','11:45:00','00:00:00','MADINAH',NULL,'2023-06-25','09:30:00'),(12001,'RoundTrip','11:30:00','20:55:00','JEDDAH','MAKKAH','2023-08-18','14:00:00'),(12002,'RoundTrip','14:00:00','22:00:00','MAKKAH','MADINAH','2023-06-20','10:30:00'),(12003,'OneWay','12:45:00','00:00:00','MAKKAH',NULL,'2023-06-10','08:45:00'),(13001,'OneWay','12:30:00','00:00:00','JEDDAH',NULL,'2023-10-04','12:45:00'),(13002,'RoundTrip','13:00:00','20:50:00','DAMMAM','RIYADH','2023-10-14','09:15:00'),(13003,'OneWay','13:00:00','00:00:00','DAMMAM',NULL,'2023-06-10','11:45:00'),(14001,'RoundTrip','18:50:00','10:30:00','MADDINAH','MAKKAH','2023-02-18','13:00:00'),(14002,'RoundTrip','17:45:00','05:50:00','MAKKAH','JEDDAH','2023-11-10','08:30:00'),(14003,'OneWay','10:30:00',NULL,'JEDDAH',NULL,'2023-06-10','09:00:00'),(15001,'RoundTrip','20:45:00','09:30:00','RIYADH','MADINAH','2024-01-01','15:00:00'),(15002,'OneWay','09:15:00','00:00:00','JEDDAH',NULL,'2023-11-11','06:30:00');
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-03 22:25:42
