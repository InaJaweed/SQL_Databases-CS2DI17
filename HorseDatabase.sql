DROP DATABASE IF EXISTS horseDatabase;

create database if not exists horseDatabase;

use horseDatabase;

CREATE TABLE `Horse` (
    `horseID` int  NOT NULL ,
    `name` text  NOT NULL ,
    `birthYear` year  NOT NULL ,
    `gender` char  NOT NULL ,
    `sireID` int  NOT NULL ,
    `damID` int  NOT NULL ,
    `stableID` int  NOT NULL ,
    `ownerID` int  NOT NULL ,
    `trainerID` int  NOT NULL ,
    PRIMARY KEY (
        `horseID`
    )
);

CREATE TABLE `Owner` (
    `OwnerID` int  NOT NULL ,
    `name` text  NOT NULL ,
    `address` text  NOT NULL ,
    `phoneNo` text  NOT NULL ,
    PRIMARY KEY (
        `OwnerID`
    )
);

CREATE TABLE `Stable` (
    `stableID` int  NOT NULL ,
    `name` text  NOT NULL ,
    `address` text  NOT NULL ,
    PRIMARY KEY (
        `stableID`
    )
);

CREATE TABLE `Jockey` (
    `jockeyID` int  NOT NULL ,
    `name` text  NOT NULL ,
    `address` text  NOT NULL ,
    `phoneNo` text  NOT NULL ,
    PRIMARY KEY (
        `jockeyID`
    )
);

CREATE TABLE `Trainer` (
    `trainerID` int  NOT NULL ,
    `name` text  NOT NULL ,
    `address` text  NOT NULL ,
    `phoneNo` text  NOT NULL ,
    PRIMARY KEY (
        `trainerID`
    )
);

CREATE TABLE `Racecourse` (
    `courseID` int  NOT NULL ,
    `name` text  NOT NULL ,
    `location` text  NOT NULL ,
    PRIMARY KEY (
        `courseID`
    )
);

CREATE TABLE `Event`(
    `eventID` int NOT NULL ,
    `eventName` text NOT NULL,
    `eventDate` date NOT NULL,
    PRIMARY KEY (
        `eventID`
    )
);

CREATE TABLE `Race` (
    `raceID` int  NOT NULL ,
    `courseID` int  NOT NULL ,
    `raceName` text NOT NULL ,
    `raceDate` date  NOT NULL ,
    `raceType` text  NOT NULL ,
    PRIMARY KEY (
        `raceID`
    )
);

CREATE TABLE `Result` (
    `resultID` int  NOT NULL ,
    `horseID` int  NOT NULL ,
    `jockeyID` int  NOT NULL ,
    `raceID` int  NOT NULL ,
    `eventID` int NOT NULL,
    `placementNumber` int  NOT NULL ,
    PRIMARY KEY (
        `resultID`
    )
);

INSERT INTO Horse (horseID, name, birthYear, gender, sireID, damID, stableID, ownerID, trainerID)
VALUES
    (1, 'Thunderbolt', 2018, 'M', 15, 13, 2, 1, 2),
    (2, 'Firecracker', 2019, 'F', 15, 14, 3, 3, 3),
    (3, 'Lightning', 2016, 'M', 11, 12, 2, 1, 2),
    (4, 'Sonic', 2017, 'M', 11, 12, 1, 3, 1),
    (5, 'Blaze', 2015, 'F', 10, 11, 2, 5, 1),
    (6, 'Phoenix', 2020, 'F', 9, 8, 2, 4, 3),
    (7, 'Aurora', 2014, 'F', 15, 14, 2, 1, 2),
    (8, 'Rocket', 2013, 'M', 16, 17, 3, 3, 2),
    (9, 'Comet', 2012, 'M', 15, 11, 2, 3, 3),
    (10, 'Meteor', 2011, 'M', 19, 21, 2, 4, 1),
    (11, 'Rainbow', 2010, 'F', 23, 14, 2, 4, 1),
    (12, 'Moonlight', 2009, 'F', 25, 27, 1, 5, 2),
    (13, 'Starlight', 2008, 'F', 24, 21, 2, 1, 1),
    (14, 'Sunshine', 2007, 'F', 23, 27, 3, 3, 3),
    (15, 'Storm', 2006, 'M', 5, 30, 29, 2, 3);

INSERT INTO Owner (OwnerID, name, address, phoneNo)
VALUES
    (1, 'John Smith', '123 Main St', '447893932101'),
    (2, 'Mary Johnson', '456 High St', '447700185211'),
    (3, 'Bob Brown', '789 Maple Ave', '447700184666'),
    (4, 'Alice Green', '111 Oak St', '447700184665'),
    (5, 'David Davis', '222 Pine St', '447488811031');

INSERT INTO Stable (stableID, name, address)
VALUES
    (1, 'Happy Acres', '321 Elm St'),
    (2, 'Green Pastures', '654 Birch Ln'),
    (3, 'Sunset Stables', '987 Oak Rd');

INSERT INTO Jockey (jockeyID, name, address, phoneNo)
VALUES
    (1, 'David Lee', '444 Elm St', '447700150913'),
    (2, 'Lynn Bridgeman', '555 Maple Ave', '447893932118'),
    (3, 'Robert Garcia', '666 Cedar Rd', '447893932116'),
    (4, 'Emily Brown', '777 Walnut St', '447893932114'),
    (5, 'Michael Davis', '888 Oak Ave', '447893932113'),
    (6, 'Amy Johnson', '999 Pine Ave', '447893932110'),
    (7, 'Martin Jones', '1011 Cedar Rd', '447893932107'),
    (8, 'Julia Smith', '1213 Walnut St', '447893932108'),
    (9, 'Ahmed Bedair', '1415 Elm St', '447893932101'),
    (10, 'Lauren Lee', '1617 Maple Ave', '447893932104');

INSERT INTO Trainer (trainerID, name, address, phoneNo)
VALUES
    (1, 'Mike Smith', '111 Oak St', '447488810589'),
    (2, 'Sara Jones', '222 Pine Ave', '447488810587'),
    (3, 'Tom Williams', '333 Cedar Rd', '447458196483');

INSERT INTO Racecourse (courseID, name, location)
VALUES
    (1, 'Churchill Downs', 'Louisville'),
    (2, 'Santa Anita Park', 'Arcadia'),
    (3, 'Saratoga Race Course', 'Saratoga Springs');


INSERT INTO Race (raceID, courseID, raceName, raceDate, raceType)
VALUES
    (1, 1, 'Turf Classic Stakes', '2022-05-09', 'flat race'),
    (2, 1, 'Man o War Stakes', '2022-05-10', 'endurance race'),
    (3, 2, 'Gamely Stakes', '2022-12-30', 'harness race'),
    (4, 2, 'Shoemaker Mile', '2023-01-2', 'flat race'),
    (5, 3, 'Pegasus World Cup', '2023-03-29', 'flat race'),
    (6, 3, 'Beholder Mile Stakes', '2023-03-30', 'flat race');

INSERT INTO Event (eventID, eventName, eventDate)
VALUES
    (1,'American Oaks', '2022-05-09'),
    (2,'Arkansas Derby', '2022-12-30'),
    (3,'Florida Derby', '2023-03-29');

INSERT INTO Result (resultID, horseID, jockeyID, raceID, eventID, placementNumber)
VALUES
      (1, 1, 1, 1, 1, 1),
      (2, 2, 2, 1, 1, 2),
      (3, 3, 3, 1, 1, 3),
      (4, 4, 4, 1, 1, 4),
      (5, 5, 5, 1, 1, 5),
      (6, 6, 6, 1, 1, 6),
      (7, 7, 7, 1, 1, 7),
      (8, 8, 8, 1, 1, 8),
      (9, 9, 9, 1, 1, 9),
      (10, 10, 10, 1, 1, 10),

      (11, 6, 2, 2, 1, 3),
      (12, 7, 1, 2, 1, 6),
      (13, 8, 3, 2, 1, 1),
      (14, 9, 5, 2, 1, 7),
      (15, 10, 4, 2, 1, 2),
      (16, 11, 6, 2, 1, 9),
      (17, 12, 8, 2, 1, 4),
      (18, 13, 7, 2, 1, 5),
      (19, 14, 9, 2, 1, 8),
      (20, 15, 10, 2, 1, 10),

      -- New Event
      (21, 4, 3, 3, 2, 1),
      (22, 6, 6, 3, 2, 9),
      (23, 7, 1, 3, 2, 3),
      (24, 3, 7, 3, 2, 8),
      (25, 8, 2, 3, 2, 4),
      (26, 12, 9, 3, 2, 5),
      (27, 10, 4, 3, 2, 7),
      (28, 9, 5, 3, 2, 10),
      (29, 11, 8, 3, 2, 2),
      (30, 14, 10, 3, 2, 6),

      (31, 1, 1, 4, 2, 4),
      (32, 2, 9, 4, 2, 8),
      (33, 15, 3, 4, 2, 1),
      (34, 12, 4, 4, 2, 6),
      (35, 4, 5, 4, 2, 2),
      (36, 6, 7, 4, 2, 7),
      (37, 8, 6, 4, 2, 3),
      (38, 14, 10, 4, 2, 10),
      (39, 3, 9, 4, 2, 9),
      (40, 5, 8, 4, 2, 5),

      -- New Event
      (41, 2, 1, 5, 3, 1),
      (42, 1, 2, 5, 3, 3),
      (43, 3, 3, 5, 3, 10),
      (44, 4, 4, 5, 3, 6),
      (45, 7, 5, 5, 3, 9),
      (46, 5, 6, 5, 3, 5),
      (47, 10, 7, 5, 3, 8),
      (48, 8, 8, 5, 3, 7),
      (49, 9, 9, 5, 3, 4),
      (50, 15, 10, 5, 3, 2),

      (51, 1, 1, 6, 3, 8),
      (52, 4, 2, 6, 3, 7),
      (53, 3, 3, 6, 3, 10),
      (54, 10, 4, 6, 3, 2),
      (55, 6, 5, 6, 3, 4),
      (56, 11, 6, 6, 3, 9),
      (57, 7, 7, 6, 3, 3),
      (58, 5, 8, 6, 3, 5),
      (59, 9, 9, 6, 3, 1),
      (60, 13, 10, 6, 3, 6);

      

