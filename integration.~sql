-- drop
drop table schedule;
drop table client;
-- create
CREATE TABLE Manager
(
  managerId INT NOT NULL,
  managerPN varchar2(20) NOT NULL,
  manager_Adress varchar2(20) NOT NULL,
  managerName varchar2(20) NOT NULL,
  PRIMARY KEY (managerId)
);

CREATE TABLE shift
(
  shid INT NOT NULL,
  shDate date NOT NULL,
  startTime int NOT NULL,
  EndTime int NOT NULL,
  managerId INT NOT NULL,
  PRIMARY KEY (shid),
  FOREIGN KEY (managerId) REFERENCES Manager(managerId)
);
CREATE TABLE Duty
(
  dutyName varchar2(20) NOT NULL,
  Ddescription varchar2(50) NOT NULL,
  PRIMARY KEY (dutyName)
);
CREATE TABLE employee
(
  employeeId INT NOT NULL,
  employeePN number NOT NULL,
  employee_Adress varchar2(20) NOT NULL,
  employeeName varchar2(20) NOT NULL,
  employeeSalary INT NOT NULL,
  hiringYear INT NOT NULL,
  managerId INT NOT NULL,
  PRIMARY KEY (employeeId),
  FOREIGN KEY (managerId) REFERENCES Manager(managerId)
);
CREATE TABLE cityManager
(
  cityName varchar2(20) NOT NULL,
  managerId INT NOT NULL,
  PRIMARY KEY (cityName, managerId),
  FOREIGN KEY (cityName) REFERENCES city(cityName),
  FOREIGN KEY (managerId) REFERENCES Manager(managerId)
);
CREATE TABLE EmployeeShift
(
  employeeId INT NOT NULL,
  shid INT NOT NULL,
  PRIMARY KEY (employeeId, shid),
  FOREIGN KEY (employeeId) REFERENCES employee(employeeId),
  FOREIGN KEY (shid) REFERENCES shift(shid)
);
CREATE TABLE employeeDuty
(
  employeeId INT NOT NULL,
  dutyName varchar2(20) NOT NULL,
  PRIMARY KEY (employeeId, dutyName),
  FOREIGN KEY (employeeId) REFERENCES employee(employeeId),
  FOREIGN KEY (dutyName) REFERENCES Duty(dutyName)
);
CREATE TABLE cityEmployee
(
  cityName varchar2(20) NOT NULL,
  employeeId INT NOT NULL,
  PRIMARY KEY (cityName, employeeId),
  FOREIGN KEY (cityName) REFERENCES city(cityName),
  FOREIGN KEY (employeeId) REFERENCES employee(employeeId)
);
CREATE TABLE employeeOrder
(
  employeeId INT NOT NULL,
  orderNumber INT NOT NULL,
  PRIMARY KEY (employeeId, orderNumber),
  FOREIGN KEY (employeeId) REFERENCES employee(employeeId),
  FOREIGN KEY (orderNumber) REFERENCES orderFromBasement(orderNumber)
);
-- Add/modify columns 
alter table ORDERFROMBASEMENT add managerid integer;
-- Add/modify columns 
alter table BRANCH add street varchar2(30);
-- check 1
-- Create/Recreate check constraints 
alter table ORDEREDPRODUCT
  add constraint amountBiggerThanZero
  check (orderAmount > 0);
  -- check 2
  -- Create/Recreate check constraints 
alter table CATEGORY
  add constraint CategoryNameNotNull
  check (categoryName is not null);
-- check 3
-- Create/Recreate check constraints 
alter table SHIFT
  add constraint startShiftBeforeEndShift
  check (startTime < endTime);
-- check4
-- Create/Recreate check constraints 
alter table SHIFT
  add constraint min3HoursPerShift
  check (endTime - startTime >=3);
 -- drop constrait
 alter table SHIFT drop constraint min3HoursPerShift;
--views1
  CREATE or replace VIEW employeeShiftDetails 
  (employeeId, shid,employeeName,employeePN,employee_Adress,employeeSalary,hiringYear,ManagerId,startTime,EndTime, shDate)
  AS
  SELECT employeeId, shid,employeeName,employeePN,employee_Adress,employeeSalary,hiringYear,ManagerId,startTime,EndTime, shDate
  FROM shift  natural join employee  natural join EmployeeShift ;
 --query view1
SELECT employeeId as id, employeeName as name, employeeSalary as salary,startTime as "start",EndTime as "end"
FROM employeeShiftDetails
where shid = &<name="shift" list="select shid from shift" description="no" restricted="yes">
 --drop view 1
drop view  employeeShiftDetails;
  -- view2
  create or replace view ordersProductDetails 
  (orderNumber,branchId,agentId,orderDate,productBarcode, productName, categoryId, productPrice,companyId,orderAmount,expiryDate, soldAmount)
  as select orderNumber,branchId,agentId,orderDate,productBarcode, productName, categoryId, productPrice,companyId,orderAmount,expiryDate, soldAmount
  from orderfrombasement natural join product natural join orderedproduct
 --query view 2

SELECT *
FROM ordersProductDetails
where orderDate =  to_date(&<name=d_from type="string">,'DD/MM/YYYY') and
      orderamount=soldamount


 
  --drop view 2
drop view  ordersProductDetails;
  
  
  
  
  
