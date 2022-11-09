--Select a teams matches and results
SELECT
Teams.country,
COUNT(Matches.id) AS "matches played",
COUNT(
CASE
WHEN winner_id = 17
THEN TRUE --Return true so that count adds one
END) 
AS "matches won"

FROM Matches

INNER JOIN Teams
ON Teams.id = 17

WHERE team1_id = 17
OR team2_id = 17