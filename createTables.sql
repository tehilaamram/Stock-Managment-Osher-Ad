CREATE TABLE area
(
  areaName VARCHAR(20),
  areaId NUMERIC(3),
  PRIMARY KEY (areaId)
);

CREATE TABLE city
(
  cityName VARCHAR(20),
  areaId NUMERIC(3),
  PRIMARY KEY (cityName),
  FOREIGN KEY (areaId) REFERENCES area(areaId)
);

CREATE TABLE company
(
  companyId NUMERIC(9),
  companyName VARCHAR(30),
  companyCountry VARCHAR(30),
  companyEstablishedYear DATE,
  PRIMARY KEY (companyId)
);

CREATE TABLE category
(
  categoryId NUMERIC(9),
  categoryName VARCHAR(20),
  PRIMARY KEY (categoryId)
);

CREATE TABLE branch
(
  branchId NUMERIC(9),
  branchName VARCHAR(30),
  cityName VARCHAR(20),
  PRIMARY KEY (branchId),
  FOREIGN KEY (cityName) REFERENCES city(cityName)
);

CREATE TABLE agent
(
  agentName VARCHAR(20),
  agentRating NUMERIC(2),
  agentHireYear NUMERIC(4),
  bossId NUMERIC(9),
  agentSalary FLOAT,
  agentId NUMERIC(9),
  areaId NUMERIC(3),
  PRIMARY KEY (agentId),
  FOREIGN KEY (areaId) REFERENCES area(areaId)
);

CREATE TABLE orderFromBasement
(
  orderNumber NUMERIC(9),
  branchId NUMERIC(9),
  agentId NUMERIC(9),
  orderDate DATE,
  FOREIGN KEY (agentId) REFERENCES agent(agentId),
  PRIMARY KEY (orderNumber),
  FOREIGN KEY (branchId) REFERENCES branch(branchId)
);


CREATE TABLE product
(
  productBarcode NUMERIC(10),
  productName CHAR(30),
  categoryId NUMERIC(9),
  companyId NUMERIC(9),
  productPrice FLOAT,
  PRIMARY KEY (productBarcode),
  FOREIGN KEY (categoryId) REFERENCES category(categoryId),
  FOREIGN KEY (companyId) REFERENCES company(companyId)
);

CREATE TABLE represent
(
  companyId NUMERIC(9) NOT NULL,
  agentId NUMERIC(9) NOT NULL,
  PRIMARY KEY (companyId, agentId),
  FOREIGN KEY (companyId) REFERENCES company(companyId),
  FOREIGN KEY (agentId) REFERENCES agent(agentId)
);

CREATE TABLE orderedProduct
(
  productBarcode NUMERIC(10) NOT NULL,
  orderNumber NUMERIC(9) NOT NULL,
  orderAmount INT,
  EXPIRYDATE date,
  SOLDAMOUNT INT,
  PRIMARY KEY (productBarcode, orderNumber),
  FOREIGN KEY (productBarcode) REFERENCES product(productBarcode),
  FOREIGN KEY (orderNumber) REFERENCES orderFromBasement(orderNumber)
);

CREATE TABLE client
(
  clientId NUMERIC(9),
  clientName VARCHAR(20),
  clientAddress VARCHAR(25),
  clientPhoneNr VARCHAR(10),
  agentId NUMERIC(9),
  cityName VARCHAR(20),
  PRIMARY KEY (clientId),
  FOREIGN KEY (agentId) REFERENCES agent(agentId),
  FOREIGN KEY (cityName) REFERENCES city(cityName)
);

CREATE TABLE schedule
(
  meetingTime DATE,
  clientId NUMERIC(9),
  agentId NUMERIC(9),
  PRIMARY KEY (meetingTime, clientId, agentId),
  FOREIGN KEY (clientId) REFERENCES client(clientId),
  FOREIGN KEY (agentId) REFERENCES agent(agentId)
);

CREATE TABLE returns
(
  returnsReason VARCHAR(500),
  returnsId NUMERIC(9),
  returnsDate DATE,
  productBarcode NUMERIC(10),
  PRIMARY KEY (returnsId),
  FOREIGN KEY (productBarcode) REFERENCES product(productBarcode)
);
