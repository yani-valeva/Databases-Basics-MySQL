CREATE DATABASE movies;

USE movies; 

CREATE TABLE directors (
    id INT NOT NULL AUTO_INCREMENT,
    director_name VARCHAR(50) NOT NULL,
    notes TEXT(65535),
    CONSTRAINT pk_directors PRIMARY KEY (id)
);

CREATE TABLE genres (
    id INT NOT NULL AUTO_INCREMENT,
    genre_name VARCHAR(50) NOT NULL,
    notes TEXT(65535),
    CONSTRAINT pk_genres PRIMARY KEY (id)
);

CREATE TABLE categories (
    id INT NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL,
    notes TEXT(65535),
    CONSTRAINT pk_categories PRIMARY KEY (id)
);

CREATE TABLE movies (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    director_id INT,
    copyright_year DATE,
    length INT,
    genre_id INT,
    category_id INT,
    rating FLOAT(2, 1),
    notes TEXT(65535),
    CONSTRAINT pk_movies PRIMARY KEY (id)
);

INSERT INTO directors (director_name, notes)
VALUES ('James Ponsoldt', 'Aenean enim libero, elementum at lectus non, porta interdum elit. Sed id enim diam. Morbi egestas nulla nec erat molestie vulputate. Nunc suscipit eget enim vel blandit. Maecenas blandit nulla semper pretium placerat.'), 
('Tom McGrath', NULL), ('F. Gary Gray', NULL), 
('Ridley Scott', ' Integer sodales, nulla sed consequat viverra, mauris sapien condimentum nisl, nec volutpat nulla ligula ac est. Maecenas dignissim mauris et feugiat porta.'),
('David Hand', 'Donec quis odio eu erat cursus gravida quis eget elit.');

INSERT INTO genres (genre_name, notes)
VALUES ('Drama', 'Fusce ante quam.'), ('Comedy', NULL), ('Action', NULL), ('Fantasy', 'Donec consectetur velit.'), ('Romantic', NULL);

INSERT INTO categories (category_name, notes)
VALUES ('A', NULL), ('B', 'Proin pretium.'), ('C', 'Aliquam viverra, diam in efficitur bibendum.'), 
('D', 'Praesent semper purus a nisl rutrum, id aliquet velit laoreet.'), ('X', 'Curabitur suscipit, nibh in vestibulum facilisis.');

INSERT INTO movies (title, director_id, genre_id, category_id, rating)
VALUES ('The Circle', 1, 1, 3, 6.7), ('The Fate of the Furious', 3, 3, 3, 9.7), ('Alien: Convenant', 4, 4, 4, 7.9), 
('Boss Baby', 2, 2, 2, 5.4), ('Three Little Wolves', 5, 2, 1, 4.8);