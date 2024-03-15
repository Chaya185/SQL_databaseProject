--View #1
CREATE VIEW TallestPlayers AS
SELECT TOP 5
  FirstName + ' ' + LastName AS FullName,
  HEIGHT
FROM
  Person
ORDER BY
  HEIGHT DESC;


--View #2
CREATE VIEW AverageWeight AS
SELECT AVG(Weight) AS AverageWeight
FROM Person;

--View #3
CREATE VIEW AllJulyGames AS
SELECT AwayTeam_ID, HomeTeam_ID, g.[Date]
FROM Game g
JOIN Team t ON t.Team_ID = AwayTeam_ID
JOIN Team s ON s.Team_ID = HomeTeam_ID 
WHERE MONTH(g.[Date]) = 7;


