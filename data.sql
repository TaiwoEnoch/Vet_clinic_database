/* Populate database with sample data. */

CREATE TABLE animals (
 id SERIAL PRIMARY KEY,
  name VARCHAR(300),
  birthdate DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight DECIMAL(5, 2)
  
);

ALTER TABLE animals
ADD COLUMN species VARCHAR(255);

INSERT INTO animals (name, birthdate, weight, neutered, escape_attempts, species)
VALUES ('Charmander', '2020-02-08', -11, false, 0, NULL),
       ('Plantmon', '2021-11-15', -5.7, true, 2, NULL),
       ('Squirtle', '1993-04-02', -12.13, false, 3, NULL),
       ('Angemon', '2005-06-12', -45, true, 1, NULL),
       ('Boarmon', '2005-06-07', 20.4, true, 7, NULL),
       ('Blossom', '1998-10-13', 17, true, 3, NULL),
       ('Ditto', '2022-05-14', 22, true, 4, NULL);

SELECT * FROM animals
