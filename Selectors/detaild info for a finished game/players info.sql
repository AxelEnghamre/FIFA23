--Select info about the players in a finished game
SELECT
Players.first_name,
Players.last_name,
Players.shirt_number,
Roles.role,
Roles.minutes_played

FROM Players

INNER JOIN Matches
ON Matches.id = 3

INNER JOIN Teams
ON Teams.id = Matches.team1_id
OR Teams.id = Matches.team2_id

INNER JOIN Roles --LEFT JOIN WHEN ROLES IS NOT POPULATED
ON Roles.player_id = Players.id
AND Roles.match_id = Matches.id


WHERE Players.team_id = Teams.id