
CREATE TABLE footballers (
	id SERIAL4 PRIMARY KEY,
	image_url VARCHAR(400),
	name VARCHAR(200),
	age VARCHAR(20),
	goals_scored VARCHAR(20),
	assists VARCHAR(20)
);

INSERT INTO footballers (name, image_url, age, goals_scored, assists) VALUES ('Thierry Henry',
'https://statics.sportskeeda.com/wp-content/uploads/2013/01/Henry_Arsenakl-151292.jpg', 40, 100, 10);

INSERT INTO footballers (name, image_url, age, goals_scored, assists) VALUES ('Robert Pires',
'https://pbs.twimg.com/media/B1HB5lyCUAE9HZB.jpg', 40, 100, 10);

INSERT INTO footballers (name, image_url, age, goals_scored, assists) VALUES ('Patrick Vieira',
'https://statics.sportskeeda.com/wp-content/uploads/2012/11/Vieira-1006024.jpg', 40, 100, 10);