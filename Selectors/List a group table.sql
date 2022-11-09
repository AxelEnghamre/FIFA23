--Group table
SELECT
Teams.country AS team,
Teams.group_name,

COUNT(
CASE
WHEN Matches.winner_id = Teams.id
THEN TRUE
END) AS winns,

COUNT(
CASE
WHEN NOT Matches.winner_id = Teams.id 
OR NOT Matches.winner_id = NULL
THEN TRUE
END) AS losses,

COUNT(
CASE
WHEN Matches.winner_id = NULL
THEN TRUE
END) AS draws,

Shots_left.goals - Shots_left_receiving.conceded_goals AS "goal difference",

COUNT(
CASE
WHEN Matches.winner_id = Teams.id
THEN TRUE
END) * 3 +
COUNT(
CASE
WHEN Matches.winner_id = NULL
THEN TRUE
END)
AS points

FROM Teams


INNER JOIN Matches
ON Matches.team1_id = Teams.id
OR Matches.team2_id = Teams.id

LEFT JOIN (SELECT 
	COUNT(
	CASE
	WHEN Shots.is_goal
	THEN TRUE
	END) AS goals,
	
	team_id, --To make the on work in the left join
	receiving_team_id
	
	FROM Shots 
	
	GROUP BY Shots.team_id
	
	) AS Shots_left --Name from left join

ON Shots_left.team_id = Teams.id


LEFT JOIN (SELECT 
	COUNT(
	CASE
	WHEN Shots.receiving_team_id
	THEN TRUE
	END) AS conceded_goals,
	
	receiving_team_id--To make the on work in the left join
	
	FROM Shots 
	
	GROUP BY Shots.receiving_team_id
	
	) AS Shots_left_receiving --Name from left join

ON Shots_left_receiving.receiving_team_id = Teams.id

WHERE Teams.group_name = 'Group G'
GROUP BY Teams.id