/* Populate database with sample data. */

CREATE TABLE animals (
 id SERIAL PRIMARY KEY,
  name VARCHAR(300),
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL(5, 2)
  
);

INSERT INTO animals (name, birthdate, weight, neutered, escape_attempts)
VALUES ('Charmander', '2020-02-08', -11, false, 0),
       ('Plantmon', '2021-11-15', -5.7, true, 2),
       ('Squirtle', '1993-04-02', -12.13, false, 3),
       ('Angemon', '2005-06-12', -45, true, 1),
       ('Boarmon', '2005-06-07', 20.4, true, 7),
       ('Blossom', '1998-10-13', 17, true, 3),
       ('Ditto', '2022-05-14', 22, true, 4);

SELECT * FROM animals
