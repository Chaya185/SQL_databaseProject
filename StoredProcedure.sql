--Stored Procedure example: Fetch the names of the players from the requested team based off user input.
CREATE PROC TeamPlayers
	@Team_ID int
AS
SELECT FirstName + ' ' + LastName AS 'Player Name'
FROM Person p
JOIN PersonRoleTeam t ON p.Person_ID = t.Person_ID
WHERE Team_ID = @Team_ID;

DECLARE @Team_ID INT;
EXEC TeamPlayers
@Team_ID = '1'