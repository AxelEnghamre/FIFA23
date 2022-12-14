CREATE TABLE Shots 
(
id INT AUTO_INCREMENT,
match_id INT,
player_assist_id INT,
player_shooter_id INT,
team_id INT,
receiving_team_id INT,
shot_time INT,
is_goal BOOLEAN,
is_during_overtime BOOLEAN,
is_penalty_during_play BOOLEAN,
is_penalty_shootout BOOLEAN,
PRIMARY KEY (id),
FOREIGN KEY (match_id) REFERENCES Matches(id),
FOREIGN KEY (player_assist_id) REFERENCES Players(id),
FOREIGN KEY (player_shooter_id) REFERENCES Players(id),
FOREIGN KEY (team_id) REFERENCES Teams(id),
FOREIGN KEY (receiving_team_id) REFERENCES Teams(id)
)