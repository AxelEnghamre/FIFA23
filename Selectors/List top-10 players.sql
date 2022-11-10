--List top 10 playesrs
SELECT
Teams.country,
Players.first_name,
Players.last_name,

COUNT(
CASE
WHEN Shots.player_shooter_id = Players.id
THEN TRUE
END) AS goals,

COUNT(
CASE
WHEN Shots.player_assist_id = Players.id
THEN TRUE
END) AS assists

FROM Shots

INNER JOIN Players
ON Players.id = Shots.player_shooter_id
OR Players.id = Shots.player_assist_id

INNER JOIN Teams
ON Teams.id = Players.team_id


WHERE Shots.is_goal = 1

GROUP BY Shots.player_shooter_id

ORDER BY goals * 100 + assists DESC --One goal is 100 times more worth then one assist
LIMIT 10
