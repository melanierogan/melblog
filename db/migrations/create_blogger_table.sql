CREATE TABLE blogger (
  id SERIAL PRIMARY KEY, 
  name VARCHAR(60),
  message VARCHAR(260),
  created_on TIMESTAMP
);