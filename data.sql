/* Populate database with sample data. */


INSERT INTO animals (
	name,
	date_of_birth,
	escape_attempts,
	neutered,
	weight_kg
) VALUES
('Agumon', '2020-02-03', 0, true, 10.23),
('Gabumon', '2018-11-15', 2, true, 8),
('Pikachu', '2021-01-07', 1, false, 15.04),
('Devimon', '2017-05-12', 5, true, 11);

INSERT INTO owners (full_name, age) VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);
  
  INSERT INTO species (name) VALUES
  ('Pokemon'),
  ('Digimon');
  
UPDATE animals
SET species_id = CASE
  WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
  ELSE (SELECT id FROM species WHERE name = 'Pokemon')
  END;

UPDATE animals AS a
SET owner_id = o.id
FROM owners AS o
WHERE a.owner_id IS NULL
  AND (
    (a.name = 'Agumon' AND o.full_name = 'Sam Smith') OR
    (a.name IN ('Gabumon', 'Pikachu') AND o.full_name = 'Jennifer Orwell') OR
    (a.name IN ('Devimon', 'Plantmon') AND o.full_name = 'Bob') OR
    (a.name IN ('Charmander', 'Squirtle', 'Blossom') AND o.full_name = 'Melody Pond') OR
    (a.name IN ('Angemon', 'Boarmon') AND o.full_name = 'Dean Winchester')
  );
=======
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

INSERT INTO vets (name, age, date_of_graduation) VALUES
  ('William Tatcher', 45, '2000-04-23'),
  ('Maisy Smith', 26, '2019-01-17'),
  ('Stephanie Mendez', 64, '1981-05-04'),
  ('Jack Harkness', 38, '2008-06-08');
  
  INSERT INTO specializations (vet_id, species) VALUES
  (1, 'Pokemon'),
  (3, 'Digimon'),
  (3, 'Pokemon'),
  (4, 'Digimon');
  
