CREATE TABLE users (
    id BIGINT UNIQUE AUTO_INCREMENT,
    username VARCHAR(30) NOT NULL,
    password VARCHAR(26) NOT NULL,
    profile_picture LONGBLOB,
    last_login_time DATE,
    is_deleted TINYINT,
    CONSTRAINT pk_users PRIMARY KEY (id)
);

INSERT INTO users (username, password, last_login_time, is_deleted)
VALUES ('Ivo', '1234', '2017-01-31', FALSE),
('Didi', '4567', '2017-05-05', TRUE),
('Koko', '1111', '2015-12-12', TRUE),
('Asya', '7788', '2010-06-18', FALSE),
('Anna', '9293', '2017-05-25', TRUE);