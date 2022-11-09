--List all matches with their teams for a specific date
SELECT Matches.date,

CASE --From Inner join on teams with team1
WHEN Teams1.id = Matches.team1_id
THEN Teams1.abbreviation --Return team1 abbreviation
END AS Team_1,

CASE --From Inner join on teams with team2
WHEN Teams2.id = Matches.team2_id
THEN Teams2.abbreviation  --Return team2 abbreviation
END AS Team_2

FROM Matches

INNER JOIN Teams AS Teams1 --Inner join on teams with team1
ON Teams1.id = Matches.team1_id

INNER JOIN Teams AS Teams2 --Inner join on teams with team2
ON Teams2.id = Matches.team2_id

WHERE Matches.date = '2023-07-27' --Specify the date