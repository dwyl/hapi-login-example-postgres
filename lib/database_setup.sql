/* first drop test tables from previous session so we have a clean database */
/* DROP SCHEMA public cascade; https://stackoverflow.com/a/13823560/1148249 */
CREATE SCHEMA IF NOT EXISTS public;
/* DROP DATABASE IF EXISTS test; */
/* CREATE DATABASE test; */
/* create the people table */
CREATE TABLE IF NOT EXISTS people (
  id SERIAL PRIMARY KEY,
  email VARCHAR(254) UNIQUE NOT NULL,
  name VARCHAR(100) DEFAULT NULL,
  password VARCHAR(60) NOT NULL
);
/* insert a person into the people table if it does not already exist */
/* https://stackoverflow.com/questions/4069718/postgres-insert-if-does-not-exist-already */
INSERT INTO people (email, name, password)
  SELECT email, name, password FROM people
  UNION
  VALUES (
    'test@test.net',
    'Jimmy Tester',
    '$2a$12$OgPE9DUNM0KaSodSQVJvw.36GjolssAeO.dfi7a9cmc9KbQTDTj7W'
  )
  EXCEPT
  SELECT email, name, password FROM people;
/* sessions */
CREATE TABLE IF NOT EXISTS sessions (
  session_id VARCHAR(36),
  person_id INTEGER NOT NULL REFERENCES people (id),
  start_timestamp INTEGER DEFAULT EXTRACT(EPOCH FROM CURRENT_TIMESTAMP),
  end_timestamp INTEGER DEFAULT null
);
INSERT INTO sessions (session_id, person_id)
VALUES (
  '525be54a-1101-46bf-97d7-2e9c89dd1b16',
  '1'
);
