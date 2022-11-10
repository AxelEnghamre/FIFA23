SELECT
Players.first_name,
Players.last_name,
Players.shirt_number,


CASE
WHEN unplayers.cant_play
THEN TRUE
WHEN unplayers.yellow_in_total = 2
THEN TRUE
END AS no_play_for_you



FROM Players

INNER JOIN (SELECT
	penalty_type,
	player_id,
	
	COUNT(
	CASE
	WHEN Disciplinaries.player_id = player_id AND penalty_type = "yellow"
	THEN TRUE
	END) AS yellow_in_total,
	
	CASE
	WHEN penalty_type = "red"
	THEN TRUE
	END AS cant_play
	
	
	
	FROM Disciplinaries
	
		
	GROUP BY Disciplinaries.player_id
) AS unplayers
ON unplayers.player_id = Players.id
AND 
(
unplayers.penalty_type = "red"
OR
unplayers.penalty_type = "yellow"
)

WHERE no_play_for_you = 1