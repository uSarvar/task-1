CREATE DATABASE clients-info_db;

CREATE TABLE customers (
  customerNumber int(15) NOT NULL,
  customerName varchar(33) NOT NULL,
  contactLastName varchar(33) NOT NULL,
  contactFirstName varchar(33) NOT NULL,
  phone varchar(33) NOT NULL UNIQUE,
  addressLine1 varchar(100),
  addressLine2 varchar(100),
  
);

INSERT INTO customers VALUES ('Sarvar', 'Urazbaev', ');
