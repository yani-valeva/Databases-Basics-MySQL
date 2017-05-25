CREATE TABLE minions (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    CONSTRAINT pk_minions PRIMARY KEY (id)
);

CREATE TABLE towns (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    CONSTRAINT pk_towns PRIMARY KEY (id)
);