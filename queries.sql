/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT *FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

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
