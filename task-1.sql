CREATE DATABASE clients-info_db;

CREATE TABLE customers (
  customerNumber SERIAL PRIMARY KEY,
  customerName VARCHAR(33) NOT NULL,
  contactLastName VARCHAR(33) NOT NULL,
  contactFirstName VARCHAR(33) NOT NULL,
  phone VARCHAR(33) NOT NULL UNIQUE,
  addressLine1 VARCHAR(100),
  addressLine2 VARCHAR(100),
  city VARCHAR(33),
  state VARCHAR(33),
  postalCode INT(15),
  country VARCHAR(33),
  salesRepEmployeeNumber INT(10),
  creditLimit INT(33)
);

INSERT INTO customers VALUES ('Sarvar', 'Urazbaev', ');
