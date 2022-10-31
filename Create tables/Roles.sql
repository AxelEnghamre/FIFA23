CREATE TABLE Roles 
(
id INT AUTO_INCREMENT,
player_id INT,
match_id INT,
minutes_played INT,
role VARCHAR(30),
PRIMARY KEY (id),
FOREIGN KEY (player_id) REFERENCES Players(id),
FOREIGN KEY (match_id) REFERENCES Matches(id)
)