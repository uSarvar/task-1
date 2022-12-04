-- (PostgreSQL)
-- CREATE DATABASE clients-info_db;

-- creating table 'productlines'
CREATE TABLE productlines (
  productLine VARCHAR(33) NOT NULL,
  textDescription TEXT DEFAULT NULL,
  htmlDescription TEXT,
  image BYTEA NULL
)

-- inserting data for the table 'productlines'
INSERT INTO productlines VALUES ('Motocycles', 'Ducati MY21, Kawasaki Ninja H2R, Suzuki Hayabusa and other super bikes in fixed prices.', NULL, NULL),
INSERT INTO productlines VALUES ('Business cars and Sedans', 'Different types of cars for your business and short term travels', NULL, NULL),
INSERT INTO productlines VALUES ('Ships', 'Like cruise? We can find nost suitable yacht or ships for you and your family',NULL,NULL)

-- creating table 'products'
CREATE TABLE products (
  productCode INT NOT NULL PRIMARY KEY,
  productName VARCHAR(33) NOT NULL,
  productLine VARCHAR(33) REFERENCES productlines (productLine),
  productScale VARCHAR(33),
  productVendor VARCHAR(33),
  productDescription TEXT NOT NULL,
  quantityInStock INT,
  buyPrice NUMERIC(10,2) NOT NULL,
  MSRP NUMERIC(100,2) NOT NULL
)

-- inserting data for the table 'products'
INSERT INTO products VALUES ('PC_1846', 'Ducati MY21', 'Motocycles', NULL, NULL, 'Super bike for journey, have fun!', NULL, '125000.', '145000.00'),
INSERT INTO products VALUES ('PC_1235', 'Rolls-Royce', 'Business cars', NULL, NULL, 'the excellent choice for your business.', NULL, '275000.00', '292000.00'),
INSERT INTO products VALUES ('PC_2579', 'Malibu', 'Business cars', NULL, NULL, 'Cheap and comfortable business car', NULL, '22000.00', '25000.00')

-- creating table 'orders'
CREATE TABLE orders (
  orderNumber INT NOT NULL PRIMARY KEY,
  orderDate TIMESTAMP NOT NULL,
  requiredDate DATE NOT NULL,
  shippedDate DATE NOT NULL,
  status VARCHAR(33) NOT NULL,
  comments TEXT,
  customerNumber INT NOT NULL
)

-- inserting data for the table 'orders'
INSERT INTO orders VALUES (300, '2022-01-07, 15:32', '2022-01-14', '2022-01-10', 'Shipped', NULL, '123'), 
INSERT INTO orders VALUES (301, '2022-03-25, 08:24', '2022-04-02', '2022-03-31', 'Shipped', NULL, '333'), 
INSERT INTO orders VALUES (302, '2022-05-09, 18:49', '2022-05-16', '2022-05-15', 'Shipped', NULL, '456')

-- creating table 'orderdetails'
CREATE TABLE orderdetails (
  orderNumber INT REFERENCES orders (orderNumber),
  productCode INT REFERENCES products (productCode),
  quantityOrdered INT NOT NULL,
  priceEach NUMERIC(10,2) NOT NULL,
  orderLineNumber INT NOT NULL   -- also we can use SMALLINT in here
)

-- inserting data for the table 'orderdetails'
INSERT INTO orderdetails VALUES (300, 'PC_1984', 102, '150000.00', 5),
INSERT INTO orderdetails VALUES (303, 'PC_4562', 124, '275000.00', 7),
INSERT INTO orderdetails VALUES (311, 'PC_1024', 156, '215000.00', 8)

-- creating table 'offices'
CREATE TABLE offices (
  officeCode VARCHAR(15) NOT NULL PRIMARY KEY,
  city VARCHAR(33) NOT NULL,
  phone VARCHAR(33) NOT NULL PRIMARY KEY,
  addressLine1 VARCHAR(100),
  addressLine2 VARCHAR(100),
  state VARCHAR(33) NOT NULL,
  country VARCHAR(33) NOT NULL,
  postalCode VARCHAR(15) NOT NULL, 
  territory VARCHAR(15)
)

-- inserting data for the table 'offices'
INSERT INTO offices VALUES ('1', 'London', '+44 7975 333777', NULL, NULL, 'London', 'UK', '0551230', 'LN'),
INSERT INTO offices VALUES ('2', 'Paris', '+33 162 618965', NULL, NULL, 'Paris', 'France', '115684', 'PS'),
INSERT INTO offices VALUES ('3', 'Tashkent', '+998 123 45 67', NULL, NULL, 'Yunusabad', 'Uzbekistan', '10084', 'TT')

-- creating table 'employees'
CREATE TABLE employees (
  employeeNumber SERIAL PRIMARY KEY,
  lastName VARCHAR(33) NOT NULL,
  firstName VARCHAR(33) NOT NULL,
  extension VARCHAR(15),
  email VARCHAR(55) NOT NULL,
  officeCode VARCHAR(15) REFERENCES offices (officeCode),
  reportsTo INT,
  jobTitle VARCHAR(33)
)

-- inserting data for the table 'employees'
INSERT INTO employees VALUES (101, 'Doe', 'John', NULL, 'johndoe@gmail.com', '1', NULL, 'Product Manager'),
INSERT INTO employees VALUES (109, 'Jobs', 'Steve', NULL, 'sjobs333@gmail.com', '1', NULL, 'Sales Manager'),
INSERT INTO employees VALUES (116, 'Smith', 'Will', NULL, 'wsmith1995@gmail.com', '3', NULL, 'HR Manager')

-- creating table 'customers'
CREATE TABLE customers (
  customerNumber INT NOT NULL PRIMARY KEY,
  customerName VARCHAR(33) NOT NULL,
  contactLastName VARCHAR(33) NOT NULL,
  contactFirstName VARCHAR(33) NOT NULL,
  phone VARCHAR(33) NOT NULL PRIMARY KEY,
  addressLine1 VARCHAR(100),
  addressLine2 VARCHAR(100),
  city VARCHAR(33) NOT NULL,
  state VARCHAR(33) NOT NULL,
  postalCode INT NOT NULL,
  country VARCHAR(33) NOT NULL,
  salesRepEmployeeNumber INT REFERENCES employees (employeeNumber),
  creditLimit INT NOT NULL
)

-- inserting data for the table 'customers'
INSERT INTO cusstomers VALUES (107, 'Safia', 'Jamal', 'Sofia', '7465138635', NULL, NULL, 'Berlin', 'Berlin', '646411', 'Germany', 102, '55000.00'),
INSERT INTO cusstomers VALUES (111, 'Emaux', 'Salah', 'Yusuf', '150054561', NULL, NULL, 'New-York', 'NYC', '3633577', 'USA', 121, '250000.00'),
INSERT INTO cusstomers VALUES (123, 'ZizaPro', 'Tompson', 'Azi', '1234567', NULL, NULL, 'Tashkent', 'Yunusabad', '10084', 'Uzbekistan', 133, '48000.00')

-- creating table 'payments'
CREATE TABLE payments (
  customerNumber INT REFERENCES customers (customerNumber),
  checkNumber SERIAL PRIMARY KEY,
  paymentDate DATE NOT NULL,
  amount INT
)

-- inserting data for the table 'payments'
INSERT INTO payments VALUES (101, 'AB724442', '2022-05-05', '15600.25'),
INSERT INTO payments VALUES (123, 'AB753126', '2022-06-15', '12500.50'),
INSERT INTO payments VALUES (123, 'AB786585', '2022-08-21', '17800.24')

