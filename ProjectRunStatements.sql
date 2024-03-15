SELECT * FROM Person;
SELECT * FROM [Role];
SELECT * FROM Team;
SELECT * FROM PersonRoleTeam;
SELECT * FROM PersonGameAction;
SELECT * FROM Game;
SELECT * FROM [Action];
SELECT * FROM Sports;

SELECT * FROM TallestPlayers;
SELECT * FROM AverageWeight;
SELECT * FROM AllJulyGames;

EXEC TeamPlayers
@Team_ID = '1'

incrementNumTeams