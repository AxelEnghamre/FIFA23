--Select all disiplinaries from a finished game
SELECT
Teams.country,
Players.first_name,
Players.last_name,
Disciplinaries.penalty_type,
Disciplinaries.time,
Referees.first_name AS "referee_first_name",
Referees.last_name AS "referee_last_name"

FROM Disciplinaries

INNER JOIN Players
ON Players.id = Disciplinaries.player_id

INNER JOIN Teams
ON Teams.id = Disciplinaries.team_id

INNER JOIN Referees
ON Referees.id = Disciplinaries.referee_id

WHERE Disciplinaries.match_id = 1