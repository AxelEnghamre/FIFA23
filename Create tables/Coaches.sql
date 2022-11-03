CREATE TABLE Coaches (
id INT,
first_name VARCHAR(30),
last_name VARCHAR(50),
team_id INT,
PRIMARY KEY (id),
FOREIGN KEY (team_id) REFERENCES Teams(id)
)

