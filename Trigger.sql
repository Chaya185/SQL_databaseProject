--every time a team is added to the database, the numTeams column increments according to the sport the team plays for
CREATE TRIGGER incrementNumTeams 
ON Team
AFTER INSERT
AS 
    UPDATE s
    SET NumTeams += 1
    FROM Sports s
    JOIN INSERTED i ON s.Sport_ID = i.Sport_ID;