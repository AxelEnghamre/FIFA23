SELECT
Teams.abbreviation,
Teams.country,
Teams.flag_url,
Teams.group_name,
Coaches.first_name AS "coach_first_name",
Coaches.last_name AS "coach_last_name",
Shots_left.goals,
Shots_left.assists,
Shots_left_receiving.conceded_goals,
Shots_left_receiving.conceded_shots,

(1 -
CAST(Shots_left_receiving.conceded_goals AS FLOAT) / 
CAST(Shots_left_receiving.conceded_shots AS FLOAT)) * 100
AS "save_percentage_for_the_goalkeepers",

COUNT(Players.id) AS "amount_of_players",

Disciplinaries_left.disciplinaries_amount

FROM Teams

INNER JOIN Coaches
ON Coaches.team_id = Teams.id

LEFT JOIN (SELECT 
	COUNT(
	CASE
	WHEN Shots.is_goal
	THEN TRUE
	END) AS goals,
	
	COUNT(
	CASE
	WHEN Shots.player_assist_id AND Shots.is_goal
	THEN TRUE
	END) AS assists,
	
	
	team_id --To make the on work in the left join
	
	FROM Shots 
	
	WHERE Shots.team_id
	
	GROUP BY Shots.team_id
	
	) AS Shots_left --Name from left join

ON Shots_left.team_id = Teams.id


LEFT JOIN (SELECT 
	COUNT(
	CASE
	WHEN Shots.receiving_team_id AND Shots.is_goal
	THEN TRUE
	END) AS conceded_goals,
	
	COUNT(
	CASE
	WHEN Shots.receiving_team_id
	THEN TRUE
	END) AS conceded_shots,
	
	receiving_team_id--To make the on work in the left join
	
	FROM Shots 
	
	GROUP BY Shots.receiving_team_id
	
	) AS Shots_left_receiving --Name from left join

ON Shots_left_receiving.receiving_team_id = Teams.id

INNER JOIN Players
ON Players.team_id = Teams.id

LEFT JOIN (SELECT
	team_id,
	COUNT(
	CASE
	WHEN Disciplinaries.team_id = team_id AND 
	(Disciplinaries.penalty_type = "yellow" OR Disciplinaries.penalty_type = "red")
	THEN TRUE
	END) AS disciplinaries_amount
	
	FROM Disciplinaries
	GROUP BY Disciplinaries.team_id

) AS Disciplinaries_left
ON Disciplinaries_left.team_id = Teams.id

WHERE Teams.id = 13

GROUP BY Teams.id