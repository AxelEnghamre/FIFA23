CREATE TABLE Players
(
id INT AUTO_INCREMENT,
first_name VARCHAR(30),
last_name VARCHAR(30),
shirt_number INT,
team_id INT,
PRIMARY KEY (id),
FOREIGN KEY (team_id) REFERENCES Teams(id)
)