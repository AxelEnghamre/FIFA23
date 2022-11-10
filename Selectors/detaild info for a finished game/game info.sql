--Select overview for a finished game
SELECT
Matches.date,
Referees.first_name AS "referee_first_name",
Referees.last_name AS "referee_last_name",
Referees.is_bribed AS "referee_is_bribed",
Venues.city,
Venues.name AS "Venue",
Matches.crowd_size,
Venues.capacity AS "Max_crowd",
Matches.duration,
COUNT(Shots.id) AS "Total goals",
winner.country AS "Winner",
team1.abbreviation AS "team_1",
team2.abbreviation AS "team_2"

FROM Matches

INNER JOIN Referees
ON Referees.id = Matches.referee_id

INNER JOIN Venues
ON Venues.id = Matches.venue_id

INNER JOIN Shots
ON Shots.match_id = Matches.id 
AND Shots.is_goal = 1 --To ensure that the shot is a goal

INNER JOIN Teams
AS winner
ON winner.id = Matches.winner_id

INNER JOIN Teams
AS team1
ON team1.id = Matches.team1_id

INNER JOIN Teams
AS team2
ON team2.id = Matches.team2_id



WHERE Matches.id = 4

