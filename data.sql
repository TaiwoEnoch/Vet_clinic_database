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
