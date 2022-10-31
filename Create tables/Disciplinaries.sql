CREATE TABLE Disciplinaries 
(
id INT AUTO_INCREMENT,
disciplinary_name VARCHAR(100),
penalty_type VARCHAR(8),
time INT,
player_id INT,
match_id INT,
team_id INT,
referee_id INT,
coach_id INT,
PRIMARY KEY (id),
FOREIGN KEY (player_id) REFERENCES Players(id),
FOREIGN KEY (match_id) REFERENCES Matches(id),
FOREIGN KEY (team_id) REFERENCES Teams(id),
FOREIGN KEY (referee_id) REFERENCES Referees(id),
FOREIGN Key (coach_id) REFERENCES Coaches(id)
)