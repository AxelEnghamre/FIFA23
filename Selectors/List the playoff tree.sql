--List the play of tree
SELECT

CASE 
WHEN Matches.match_stage = 1
THEN "round of sixteen"
WHEN Matches.match_stage = 2
THEN "quarter final"
WHEN Matches.match_stage = 3
THEN "semi final"
WHEN Matches.match_stage = 4
THEN "third place"
WHEN Matches.match_stage = 5
THEN "final"
ELSE match_stage
END AS "match_stage",
Matches.id,
Matches.date,
Matches.start_time_UTC,
Venues.city,
Venues.name AS "Venue",
Team1.abbreviation AS "team_1",
Team1.flag_url AS "team_1_flag",
Team2.abbreviation AS "team_2",
Team2.flag_url AS "team_2_flag"

FROM Matches

INNER JOIN Venues
ON Venues.id = Matches.venue_id

LEFT JOIN Teams --Left join due to no team playing
AS Team1
ON Team1.id = Matches.team1_id

LEFT JOIN Teams --Left join due to no team playing
AS Team2
ON Team2.id = Matches.team2_id


WHERE Matches.match_stage > 0