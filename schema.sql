/* Database schema to keep the structure of entire database. */

Create Table animals (
Id Integer Primary Key,
	name varchar(100),
	date_of_birth date,
	escape_attempt Integer,
	neutered boolean,
	weight_kg decimal(5, 2)
);
