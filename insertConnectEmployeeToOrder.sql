INSERT INTO orderFromBasement (orderNumber,branchId,agentId,orderDate,managerid)
VALUES (30,5,564441324,to_date('25/06/2019', 'DD/MM/YYYY'),158015987);
--
INSERT INTO shift (shid,startTime,EndTime, shDate,ManagerId) 
VALUES (30,8,13, to_date('25/06/2019', 'DD/MM/YYYY HH24:MI'),158010866); 
--
INSERT INTO EmployeeShift (employeeId, shid)  
VALUES (15801096,30);
--
INSERT INTO EmployeeShift (employeeId, shid)  
VALUES (564841324,30);
--
INSERT INTO EmployeeShift (employeeId, shid)  
VALUES (560458763,30);
--
commit;
--
select * from employeeorder where ordernumber = 30;

select * from employeeshift where shid = 30
--
select * from employeeshift natural join  where 
--
SELECT query1.*
FROM (SELECT employeeid, SUM(endtime-starttime) AS total_amt
      FROM employee natural join employeeshift natural join shift
      where EXTRACT(month FROM shdate)= EXTRACT(month from sysdate) and EXTRACT(year FROM shdate) = EXTRACT(year FROM sysdate)) query1
      group by employeeid
    --  (SELECT MAX(total_amt) AS highest_amt
      --FROM query1) query3
WHERE query1.total_amt = MAX(query1.total_amt)
-- query3.highest_amt;
INSERT INTO returns (productBarcode, returnsReason,returnsId,returnsDate)
VALUES (009,'defective',100,to_date('20/06/2018', 'DD/MM/YYYY'));
--
update product set product.productprice = 0
where productbarcode = 9;
