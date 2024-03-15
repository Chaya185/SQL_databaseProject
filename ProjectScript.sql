CREATE DATABASE Sports
--GO
USE Sports
GO
CREATE TABLE Sports (Sport_ID int NOT NULL PRIMARY KEY,Sport varchar(50) NOT NULL,NumTeams int )

CREATE TABLE Team (
Team_ID int NOT NULL PRIMARY KEY,
Sport_ID int NOT NULL REFERENCES Sports(Sport_ID),
TeamCity varchar(50) NOT NULL,
TeamName varchar(50) NOT NULL
)


CREATE TABLE Game (
Game_ID int NOT NULL PRIMARY KEY,
HomeTeam_ID int NOT NULL,
AwayTeam_ID int NOT NULL,
[Date] date NOT NULL,
ScoreHomeTeam int NOT NULL,
ScoreAwayTeam int NOT NULL
)

CREATE TABLE [Role](Role_ID INT NOT NULL PRIMARY KEY,[Role] VARCHAR(50) NOT NULL)

CREATE TABLE Person (Person_ID int NOT NULL PRIMARY KEY,FirstName varchar(50) NOT NULL,LastName varchar(50) NOT NULL,DOB date NOT NULL,HEIGHT int NOT NULL,[Weight] int NOT NULL)

CREATE TABLE PersonRoleTeam (Person_ID INT NOT NULL,Role_ID INT NOT NULL,Team_ID INT NOT NULL,JerseyNumber INT NOT NULL CHECK (JerseyNumber >= 0),[Start_date] DATE NOT NULL,End_date DATE NOT NULL)CREATE TABLE [Action] (Action_ID int NOT NULL PRIMARY KEY,Game_ID int NOT NULL,Point int NOT NULL,[Action] varchar(50) NOT NULL)CREATE TABLE PersonGameAction (Person_ID int NOT NULL REFERENCES Person(Person_ID),Game_ID int NOT NULL REFERENCES Game (Game_ID),Action_ID int NOT NULL)
ALTER TABLE Game
ADD CONSTRAINT FK_Team_ID
FOREIGN KEY (HomeTeam_ID) REFERENCES Team(Team_ID),
FOREIGN KEY (AwayTeam_ID) REFERENCES Team(Team_ID);

ALTER TABLE PersonRoleTeam
ADD CONSTRAINT FK_Person_ID
FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID),
FOREIGN KEY (Role_ID) REFERENCES [Role](Role_ID),
FOREIGN KEY (Team_ID) REFERENCES Team(Team_ID);

ALTER TABLE [Action]
ADD CONSTRAINT FK_Game_ID
FOREIGN KEY (Game_ID) REFERENCES Game(Game_ID);

ALTER TABLE PersonGameAction
ADD CONSTRAINT FK_Action_ID
FOREIGN KEY (Action_ID) REFERENCES [Action](Action_ID);-- populating tablesINSERT INTO Sports (Sport_ID, Sport, NumTeams)VALUES(1, 'Baseball', 0),(2, 'Football', 0);INSERT INTO Team (Team_ID, Sport_ID, TeamCity, TeamName)
VALUES (1, 1, 'New York', 'Yankees'),(2, 1, 'Boston', 'Red Socks'),(3, 2, 'Kansas City', 'Chiefs'),(4, 2, 'New York', 'Jets'), (5, 1, 'Los Angeles', 'Dodgers'),
    (6, 1, 'Chicago', 'Cubs'),
    (7, 1, 'San Francisco', 'Giants'),
    (8, 1, 'St. Louis', 'Cardinals'),
    (9, 1, 'Houston', 'Astros'),
    (10, 1, 'Atlanta', 'Braves'),
    (11, 1, 'Seattle', 'Mariners'),
    (12, 1, 'Toronto', 'Blue Jays'),
    (13, 2, 'Dallas', 'Cowboys'),
    (14, 2, 'Green Bay', 'Packers'),
    (15, 2, 'Pittsburgh', 'Steelers'),
    (16, 2, 'San Francisco', '49ers'),
    (17, 2, 'New England', 'Patriots'),
    (18, 2, 'Denver', 'Broncos'),
    (19, 2, 'Philadelphia', 'Eagles'),
    (20, 2, 'New Orleans', 'Saints');
--Games:
INSERT INTO Game (Game_ID, HomeTeam_ID, AwayTeam_ID, [Date], ScoreHomeTeam, ScoreAwayTeam)
VALUES 
    (1, 1, 2, '2022-5-6', 4, 2),
    (2, 3, 5, '2022-7-10', 14, 3),
    (3, 6, 8, '2022-8-4', 2, 6),
    (4, 10, 12, '2022-10-18', 21, 7),
    (5, 13, 15, '2022-11-22', 14, 8),
    (6, 17, 19, '2022-12-25', 21, 14),
    (7, 2, 4, '2022-10-1', 28, 21),
    (8, 7, 9, '2022-11-19', 10, 6),
    (9, 11, 13, '2022-12-6', 21, 14),
    (10, 14, 16, '2022-10-11', 35, 10),
    (11, 1, 3, '2022-7-15', 5, 8),
    (12, 5, 7, '2022-7-7', 3, 7),
    (13, 8, 10, '2022-7-4', 6, 9),
    (14, 12, 14, '2022-7-28', 11, 5),
    (15, 16, 18, '2022-7-24', 14, 12),
    (16, 20, 2, '2022-7-26', 7, 15),
    (17, 4, 6, '2022-6-8', 3, 0),
    (18, 9, 11, '2022-7-12', 9, 6);


--Role 
INSERT INTO [Role] (Role_ID, [Role])
VALUES
    (101, 'Quarterback'),
    (102, 'Wide Receiver'),
    (103, 'Running Back'),
    (104, 'Defensive Lineman'),
    (105, 'Tight End'),
    (106, 'Kicker'),
    (201, 'Outfielder'),
    (202, 'Shortstop'),
    (203, 'Pitcher'),
    (204, 'First Baseman'),
    (205, 'Second Baseman'),
    (206, 'Designated Hitter');

	
--Action 

INSERT INTO [Action] (Action_ID, Game_ID, Point, [Action])
VALUES
    (1, 1, 6, 'Touchdown'),  
    (2, 2, 3, 'Field Goal'),  
    (3, 3, 7, 'Touchdown'),  
    (4, 4, 0, 'Foul'),  
    (5, 5, 2, 'Safety'),  
    (6, 6, 0, 'Strikeout'),  
    (7, 7, 3, 'Field Goal'),  
    (8, 8, 0, 'Hit by Pitch'),  
    (9, 9, 6, 'Touchdown'),  
    (10, 10, 1, 'Single'),  
    (11, 11, 2, 'Double'),  
    (12, 12, 4, 'Homerun');  
/*--statsINSERT INTO [Stats] (Stat_ID, Person_ID, Action_ID)
VALUES
    (1, 1, 1),  -- Tom Brady throws a touchdown
    (2, 2, 2),  -- Patrick Mahomes kicks a field goal
    (3, 3, 3),  -- Aaron Rodgers throws a touchdown
    (4, 4, 4),  -- Derrick Henry commits a foul (baseball action)
    (5, 5, 5),  -- Aaron Donald causes a safety
    (6, 6, 6),  -- Tyreek Hill scores a touchdown
    (7, 7, 7),  -- Travis Kelce catches a pass for a touchdown
    (8, 8, 8),  -- Mike Trout hits a single (baseball action)
    (9, 9, 9),  -- Fernando Tatis Jr. hits a double (baseball action)
    (10, 10, 10), -- Mookie Betts commits a foul (baseball action)
    (11, 11, 11), -- Juan Soto gets hit by a pitch (baseball action)
    (12, 12, 12), -- Shohei Ohtani kicks a field goal
    (13, 13, 13), -- Gerrit Cole strikes out a batter (baseball action)
    (14, 14, 14), -- Aaron Judge hits a home run (baseball action)
    (15, 1, 2),   -- Tom Brady kicks a field goal
    (16, 2, 3),   -- Patrick Mahomes throws a touchdown
    (17, 3, 4),   -- Aaron Rodgers commits a foul (baseball action)
    (18, 4, 5),   -- Derrick Henry causes a safety
    (19, 5, 6),   -- Aaron Donald scores a touchdown
    (20, 6, 7);   -- Tyreek Hill catches a pass for a touchdown */

--Person

INSERT INTO Person (Person_ID, FirstName, LastName, DOB, HEIGHT, [Weight])
VALUES
    (1, 'Tom', 'Brady', '1977-08-03', 76, 225),
    (2, 'Patrick', 'Mahomes', '1995-09-17', 75, 230),
    (3, 'Aaron', 'Rodgers', '1983-12-02', 74, 225),
    (4, 'Derrick', 'Henry', '1994-01-04', 75, 247),
    (5, 'Aaron', 'Donald', '1991-05-23', 73, 280),
    (6, 'Tyreek', 'Hill', '1994-03-01', 70, 185),
    (7, 'Travis', 'Kelce', '1989-10-05', 78, 260),
    (8, 'Mike', 'Trout', '1991-08-07', 74, 235),
    (9, 'Fernando', 'Tatis Jr.', '1999-01-02', 76, 217),
    (10, 'Mookie', 'Betts', '1992-10-07', 69, 180),
    (11, 'Juan', 'Soto', '1998-10-25', 73, 220),
    (12, 'Shohei', 'Ohtani', '1994-07-05', 76, 210),
    (13, 'Gerrit', 'Cole', '1990-09-08', 77, 225),
    (14, 'Aaron', 'Judge', '1992-04-26', 79, 282);

--Persongameaction
INSERT INTO PersonGameAction (Person_ID, Game_ID, Action_ID)
VALUES
    (1, 1, 1),  -- Tom Brady throws a touchdown in Game 1
    (2, 2, 2),  -- Patrick Mahomes kicks a field goal in Game 2
    (3, 3, 3),  -- Aaron Rodgers throws a touchdown in Game 3
    (4, 4, 12), -- Derrick Henry scores a home run in Game 4 (baseball action)
    (5, 5, 5),  -- Aaron Donald causes a safety in Game 5
    (6, 6, 6),  -- Tyreek Hill scores a touchdown in Game 6
    (7, 7, 7),  -- Travis Kelce catches a pass for a touchdown in Game 7
    (8, 8, 10), -- Mike Trout hits a single in Game 8 (baseball action)
    (9, 9, 11), -- Fernando Tatis Jr. hits a double in Game 9 (baseball action)
    (10, 10, 4), -- Mookie Betts commits a foul in Game 10 (baseball action)
    (11, 11, 8), -- Juan Soto gets hit by a pitch in Game 11 (baseball action)
    (12, 12, 3), -- Shohei Ohtani kicks a field goal in Game 12
    (13, 11, 9), -- Gerrit Cole strikes out a batter in Game 13 (baseball action)
    (14, 12, 12);-- Aaron Judge hits a home run in Game 14 (baseball action)INSERT INTO PersonRoleTeam (Person_ID, Role_ID, Team_ID, JerseyNumber, [Start_date], End_date)
VALUES
    (1, 101, 1, 12, '2000-01-01', '2022-12-31'),  -- Tom Brady, Quarterback, New England Patriots
    (2, 102, 2, 15, '2017-01-01', '2023-12-31'),  -- Patrick Mahomes, Running Back, Kansas City Chiefs
    (3, 103, 1, 12, '2005-01-01', '2023-12-31'),  -- Aaron Rodgers, Wide Receiver, Green Bay Packers
    (4, 104, 2, 22, '2016-01-01', '2023-12-31'),  -- Derrick Henry, Defensive Lineman, Tennessee Titans
    (5, 105, 1, 99, '2014-01-01', '2023-12-31'),  -- Aaron Donald, Tight End, Los Angeles Rams
    (6, 106, 2, 10, '2016-01-01', '2023-12-31'),  -- Tyreek Hill, Kicker, Kansas City Chiefs
    (7, 105, 1, 87, '2013-01-01', '2023-12-31'),  -- Travis Kelce, Tight end, Kansas City Chiefs
    (8, 201, 3, 27, '2011-01-01', '2023-12-31'),  -- Mike Trout, Outfielder, Los Angeles Angels
    (9, 202, 4, 23, '2019-01-01', '2023-12-31'),  -- Fernando Tatis Jr., Shortstop, San Diego Padres
    (10, 203, 5, 50, '2014-01-01', '2023-12-31'), -- Mookie Betts, Catcher, Boston Red Sox
    (11, 204, 6, 22, '2018-01-01', '2023-12-31'), -- Juan Soto, Pitcher, Washington Nationals
    (12, 205, 7, 17, '2014-01-01', '2023-12-31'), -- Shohei Ohtani, First Baseman, Los Angeles Angels
    (13, 206, 8, 45, '2013-01-01', '2023-12-31'), -- Gerrit Cole, Second Baseman, New York Yankees
    (14, 205, 9, 99, '2016-01-01', '2023-12-31'); -- Aaron Judge, Designated Hitter, New York Yankees







--add a a column to the sports table called numTeams
--every time a team is added to the database, the numTeams column increments according to the sport the team plays for
CREATE TRIGGER incrementNumTeams 
ON Team
AFTER insert
AS 
	UPDATE Sports
	SET NumTeams+=1

	WHERE Sport_ID IN (SELECT s.Sport_ID FROM Sports s
	JOIN Team t ON t.Sport_ID = s.Sport_ID);
	





INSERT INTO Team (Team_ID, Sport_ID, TeamCity, TeamName)
VALUES (34, 2, 'New York', 'Yankees')

INSERT INTO Team (Team_ID, Sport_ID, TeamCity, TeamName)
VALUES (36, 2, 'New York', 'Yankees')