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
