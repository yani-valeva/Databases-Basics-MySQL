CREATE TABLE people (
    id INT UNIQUE AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    picture BLOB,
    height FLOAT(2),
    weight FLOAT(2),
    gender ENUM('m', 'f') NOT NULL,
    birthdate DATE NOT NULL,
    biography TEXT(65535),
    CONSTRAINT pk_people PRIMARY KEY (id)
);

INSERT INTO people (name, height, weight, gender, birthdate, biography)
VALUES ('Pesho', 1.85, 82, 'm', '1984-04-28', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent lacinia ultrices tortor, et imperdiet mauris viverra ac. Nunc eget ullamcorper ligula, quis pretium nisl. In facilisis rutrum dignissim. Nulla facilisi. Donec at est faucibus, varius diam sed, tincidunt arcu. Nam tempor diam sollicitudin, semper diam in, lacinia erat.'), 
('Gosho', 1.50, 48, 'm', '2007-01-01', 'Mauris lacus lectus, maximus nec aliquam eget, bibendum a nibh. Sed laoreet, sem eget tempor venenatis, erat augue egestas felis, quis pulvinar erat libero quis lorem.'),
('Iva', 1.65, 50, 'f', '1987-08-10', 'Nam elit urna, tristique eget sem ut, interdum rhoncus nisl. Quisque cursus arcu nulla, quis aliquet enim hendrerit vel. Ut non porta mi.'),
('Katya', 1.72, 66, 'f', '1990-10-18', 'Vestibulum venenatis libero luctus magna venenatis accumsan. Donec pretium magna in viverra rutrum. Pellentesque sollicitudin sodales consequat.'),
('Misho', 1.93, 105, 'm', '1976-03-10', 'Nam id tellus vel felis egestas aliquet in eget risus. Nunc egestas placerat fringilla. Sed iaculis viverra arcu.');