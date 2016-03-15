/* first drop test tables from previous session so we have a clean database */
DROP SCHEMA public cascade;  /* http://stackoverflow.com/a/13823560/1148249 */
CREATE SCHEMA public;
/* create the people table */
CREATE TABLE people (
  id SERIAL PRIMARY KEY,
  email VARCHAR(254) UNIQUE NOT NULL,
  name VARCHAR(100) DEFAULT NULL,
  password VARCHAR(60) NOT NULL
);
/* insert a person into the people table */
INSERT INTO people (email, name, password)
VALUES (
  'test@test.net',
  'Jimmy Tester',
  '$2a$12$OgPE9DUNM0KaSodSQVJvw.36GjolssAeO.dfi7a9cmc9KbQTDTj7W'
);
/* sessions */
CREATE TABLE sessions (
  session_id SERIAL PRIMARY KEY,
  person_id INTEGER NOT NULL,
  start_timestamp INTEGER DEFAULT EXTRACT(EPOCH FROM CURRENT_TIMESTAMP),
  end_timestamp INTEGER DEFAULT null
);
INSERT INTO sessions (person_id)
VALUES (
  '1'
);
