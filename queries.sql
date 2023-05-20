/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT *FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;




SELECT a.name
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Melody Pond';


SELECT a.name
FROM animals a
JOIN species s ON a.species_id = s.id
WHERE s.name = 'Pokemon';


SELECT o.full_name, COALESCE(a.name, 'No animal') AS animal
FROM owners o
LEFT JOIN animals a ON o.id = a.owner_id;


SELECT s.name, COUNT(*) AS animal_count
FROM animals a
JOIN species s ON a.species_id = s.id
GROUP BY s.name;

SELECT a.name
FROM animals a
JOIN species s ON a.species_id = s.id
JOIN owners o ON a.owner_id = o.id
WHERE s.name = 'Digimon' AND o.full_name = 'Jennifer Orwell';

SELECT a.name
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester';

SELECT o.full_name, COUNT(*) AS animal_count
FROM owners o
JOIN animals a ON o.id = a.owner_id
GROUP BY o.full_name
ORDER BY animal_count DESC
LIMIT 1;
=======
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals; -- Verify the change
ROLLBACK;
SELECT * FROM animals; -- Verify the rollback

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals; -- Verify the changes
COMMIT;
SELECT * FROM animals; -- Verify the changes persist after commit

BEGIN;
DELETE FROM animals;
SELECT * FROM animals; -- Verify all records are deleted
ROLLBACK;
SELECT * FROM animals; -- Verify all records are restored

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT weight_update;
UPDATE animals SET weight = weight * -1;
SELECT * FROM animals; -- Verify the weight update
ROLLBACK TO weight_update;
SELECT * FROM animals; -- Verify the rollback of weight changes
COMMIT;
SELECT * FROM animals; -- Verify changes are committed

SELECT COUNT(*) AS total_animals FROM animals;

SELECT COUNT(*) AS animals_no_escape FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight) AS average_weight FROM animals;

SELECT neutered, SUM(escape_attempts) AS total_escape_attempts


