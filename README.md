# SQL_Databases-CS2DI17

## Overview

This project focuses on designing and implementing a database for a **Horseracing Media Centre**, covering the entire process from conceptual design to SQL queries. The key objectives were to model a relational database using ER diagrams, normalize the tables up to the third normal form (3NF), and use SQL for data insertion and retrieval.


## Table of Contents

- [Solution Design](#solution-design)
  - [Task 1: ER Model](#task-1-er-model)
  - [Task 2: Normalization](#task-2-normalization)
- [Solution Implementation](#solution-implementation)
  - [Task 3: Creating and Populating Tables](#task-3-creating-and-populating-tables)
  - [Task 4: SQL Queries](#task-4-sql-queries)
- [Key Learnings](#key-learnings)



## Solution Design

### Task 1: ER Model

The ER model defines the key entities and their relationships, with the following constraints and assumptions:

#### Constraints:
- **Primary keys**: All primary keys (e.g., HorseID, OwnerID) must not be NULL.
- **Foreign keys**: Entities like Horse, Race, and Result reference other entities using foreign keys.
- Each horse must have exactly one stable, owner, and trainer.
- Each race must have one racecourse and one event.

#### Assumptions:
- Stables, owners, and trainers can have multiple horses.
- Courses and events can host multiple races.
- A race can have multiple results, with horses, jockeys, and events being involved in multiple results.

### Task 2: Normalization

Normalization was performed to remove redundant data and ensure data consistency. The database was normalized up to 3NF through the following steps:

1. **First Normal Form (1NF)**: Each table has a primary key, and no repeating groups or multiple values in columns.
2. **Second Normal Form (2NF)**: All non-key attributes are fully functionally dependent on the primary key.
3. **Third Normal Form (3NF)**: No transitive dependencies; non-key attributes depend only on the primary key.



## Solution Implementation

### Task 3: Creating and Populating Tables

The database was implemented using **MySQL** with SQL scripts to create and populate the necessary tables. The following are key tables created:

#### Example: Horse Table

```sql
CREATE TABLE Horse (
    horseID INT NOT NULL,
    name TEXT NOT NULL,
    birthYear YEAR NOT NULL,
    gender CHAR NOT NULL,
    sireID INT NOT NULL,
    damID INT NOT NULL,
    stableID INT NOT NULL,
    ownerID INT NOT NULL,
    trainerID INT NOT NULL,
    PRIMARY KEY (horseID)
);
```

#### Example: Inserting Data

```sql
INSERT INTO Trainer (trainerID, name, address, phoneNo) 
VALUES 
    (1, 'Mike Smith', '111 Oak St', '447488810589'), 
    (2, 'Sara Jones', '222 Pine Ave', '447488810587');
```

### Task 4: SQL Queries

Several SQL queries were written to retrieve data from the database. These included:

#### 1. Winners of the Current Year
```sql
SELECT Jockey.name AS JockeyName 
FROM Result 
JOIN Jockey ON Result.jockeyID = Jockey.jockeyID 
JOIN Race ON Result.raceID = Race.raceID 
WHERE YEAR(Race.raceDate) = YEAR(NOW()) 
AND Result.placementNumber = 1;
```

#### 2. League Table of Winning Trainers
```sql
SELECT Trainer.name AS Trainer, COUNT(*) AS Wins 
FROM Result 
JOIN Horse ON Result.horseID = Horse.horseID 
JOIN Trainer ON Horse.trainerID = Trainer.trainerID 
GROUP BY Trainer.name 
ORDER BY Wins DESC;
```

#### 3. Winners of Florida Derby and Arkansas Derby in the Same Year
```sql
SELECT Horse.name AS Horse, Event.eventName AS Event, 
Result.placementNumber AS Placement, YEAR(racedate) AS YEAR 
FROM Horse 
JOIN Result ON Horse.horseID = Result.horseID 
JOIN Race ON Result.raceID = Race.raceID 
JOIN Event ON Result.eventID = Event.EventID 
WHERE Event.eventName IN ('Florida Derby', 'Arkansas Derby') 
AND Result.placementNumber = 1 
AND YEAR(racedate) = 2023;
```


## Key Learnings

- **ER Models**: Understanding of database design using ER models.
- **Normalization**: Understanding and applying the principles of normalization up to 3NF to ensure data integrity.
- **SQL**: Writing SQL queries to perform data insertion, retrieval, and analysis effectively.


