/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
 id SERIAL PRIMARY KEY,
  name VARCHAR(300),
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL(5, 2)
);

ADD COLUMN species VARCHAR(255);

CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(255),
  age INTEGER
);

CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

ALTER TABLE animals
  DROP COLUMN species,
  ADD COLUMN species_id INTEGER REFERENCES species(id),
  ADD COLUMN owner_id INTEGER REFERENCES owners(id);
  
CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name TEXT,
  age INTEGER,
  date_of_graduation DATE
);
