CREATE TABLE Matches 
(
id INT AUTO_INCREMENT,
team1_id INT,
team2_id INT,
winner_id INT,
duration INT,
venue_id INT,
date DATE,
start_time_UTC INT,
crowd_size INT,
referee_id INT,
match_stage INT,
PRIMARY KEY (id),
FOREIGN KEY (team1_id) REFERENCES Teams(id),
FOREIGN KEY (team2_id) REFERENCES Teams(id),
FOREIGN KEY (winner_id) REFERENCES Teams(id),
FOREIGN KEY (venue_id) REFERENCES Venues(id),
FOREIGN KEY (referee_id) REFERENCES Referees(id)
)