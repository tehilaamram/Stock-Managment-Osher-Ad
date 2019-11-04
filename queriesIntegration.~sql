-- query 1 with params
SELECT productBarcode AS "Barcode", productName AS "Name",companyName AS "Made By" ,COUNT(returnsId) AS "Amount", returnsDate AS "Return Date"
FROM product p NATURAL JOIN company c NATURAL JOIN  returns r 
where 
r.returnsDate BETWEEN to_date(&<name=d_from type="string">,'DD/MM/YYYY HH24:MI') AND to_date(&<name=d_to type="string">,'DD/MM/YYYY HH24:MI')
GROUP BY returnsId, productBarcode, productName, companyName,returnsDate;--to do
-- query 2 
SELECT * from 
(SELECT sum(op.orderamount) as "amout of products", ordernumber
                FROM ORDEREDPRODUCT op  NATURAL JOIN ORDERFROMBASEMENT OFB
                group by ordernumber) maxresults;
                
    
              
    -- todo 
select *
from
(SELECT count(maxresults.ordernumber) as "<=100" from 
(SELECT sum(op.orderamount) as amout_of_products, ordernumber
                FROM ORDEREDPRODUCT op  NATURAL JOIN ORDERFROMBASEMENT OFB
                group by ordernumber) maxresults 
where maxresults.amout_of_products<=100) q1,
(SELECT count(maxresults.ordernumber) as  "<=500 and >100" from 
(SELECT sum(op.orderamount) as amout_of_products, ordernumber
                FROM ORDEREDPRODUCT op  NATURAL JOIN ORDERFROMBASEMENT OFB
                group by ordernumber) maxresults 
where maxresults.amout_of_products>100 and maxresults.amout_of_products<=500) q2,
(SELECT count(maxresults.ordernumber) as ">500" from 
(SELECT sum(op.orderamount) as amout_of_products, ordernumber
                FROM ORDEREDPRODUCT op  NATURAL JOIN ORDERFROMBASEMENT OFB
                group by ordernumber) maxresults 
where maxresults.amout_of_products>500) q3;
-- query 3 
SELECT query1.*
FROM (SELECT productBarcode as "barcode", SUM(orderedproduct.orderamount) AS total_amt, productName as "name"
      FROM orderedproduct natural join product
      GROUP BY productbarcode, productName) query1,
      (SELECT MAX(query2.total_amt) AS highest_amt
      FROM (SELECT productBarcode, SUM(orderedproduct.orderamount) AS total_amt
            FROM orderedproduct
            GROUP BY orderedproduct.productbarcode) query2) query3
WHERE query1.total_amt = query3.highest_amt;
-- query 4 with params 
SELECT branchName as "branch name", cityName as "city", productName as "product name", productBarcode as "barcode", expiryDate as "expiry date"
from orderedproduct natural join orderfrombasement natural join branch natural join product
where (SYSDATE - expiryDate )<&<name="days till expiry" type="integer" hint="enter integer value"> and SYSDATE >=expiryDate;

--date after 14 days whish prodect 
select * from orderedproduct;
SELECT branchName as "branch name", cityName as "city", productName as "product name", productBarcode as "barcode", expiryDate as "expiry date"
from orderedproduct natural join orderfrombasement natural join branch natural join product
where expiryDate =(to_date(&<name=d_from type="string">,'DD/MM/YYYY')+14);
-- query 5 with params
select * from (SELECT sum(orderedproduct.orderamount-orderedproduct.soldamount) AS "in stock",productbarcode
      FROM orderedproduct natural join orderfrombasement natural join branch
      where branchid = &<name="branch" list="select branchid, branchname from branch order by branchname" description="yes" restricted="yes">
      GROUP BY ordernumber,productbarcode) natural join product 
where productbarcode in (&<name="product" list="select productbarcode, productname from product order by productname" description="yes" multiselect="yes">);
--todo
select * from (SELECT sum(orderedproduct.orderamount-orderedproduct.soldamount) AS "in stock",productbarcode
      FROM orderedproduct natural join orderfrombasement natural join branch
      where branchid = &<name="branch" list="select branchid, branchname from branch order by branchname" description="yes" restricted="yes">
      GROUP BY ordernumber,productbarcode) natural join product 
      
 &<name="product" list="select productbarcode, productname from product order by productname" description="yes" multiselect="yes" prefix =" where productbarcode in">
 

-- query 6 
SELECT query1.*
FROM (SELECT categoryid, SUM(orderamount) AS total_amt, categoryName
      FROM orderedproduct natural join product natural join category
      GROUP BY categoryId, categoryName ) query1,
      (SELECT MAX(query2.total_amt) AS highest_amt
      FROM (SELECT categoryId, SUM(orderamount) AS total_amt
            FROM orderedproduct natural join product natural join category
            GROUP BY categoryId) query2) query3
WHERE query1.total_amt = query3.highest_amt;
-- query 7 with params
select * from
(SELECT SUM(orderedproduct.orderamount) AS total_amt, ordernumber, orderdate, agentId
      FROM orderedproduct natural join orderfrombasement 
      where branchid = &<name="branch" list="select branchid, branchname from branch order by branchname" description="yes" restricted="yes">
      GROUP BY ordernumber,orderdate, agentId) query1

-- query 8 
SELECT 100*(query1.s-query2.c)*1.0/query1.s as "satisfaction rates", query1.companyname as "company"
FROM (select sum(orderamount) as s, companyname,companyid
from orderedproduct natural join product natural join company
group by companyid,companyname) query1,
      (select count(productbarcode) as c, companyid, companyname
from returns natural join product natural join company
group by companyid,companyname) query2 
WHERE query1.companyid = query2.companyid and query1.s>0
order by 1 desc;
-- update from empty to unknows
select * from returns;

update returns
set returnsreason= 'not known'
where returnsreason is null;

rollback;
select * from returns;
-- update from over sold to amount
select * from orderedproduct;

update orderedproduct
set soldamount = orderamount
where soldamount > orderamount;

rollback;
select * from orderedproduct;
-- delete from less than 3 letters per category
select * from category 

delete from category
where length(categoryName)<3;

-- delete if order date small then today
select * from returns

delete from returns
where returnsdate > sysdate;

--
delete from category c
where
(select categoryid from category where categoryid not in
(select query1.categoryid from ( select count(categoryid) as c,categoryid from product group by categoryid) query1)
where query1.c = 0
where (select query1.productbarcode from (select sum(productbarcode) as s,productbarcode from product) query1)
where query1.s = 0

commit
-- delete all category with 0 product
delete from category c
where
c.categoryid not in
(select query1.categoryid from ( select count(categoryid) as c,categoryid from product group by categoryid) query1)
select * from category
rollback;
-- delete all orderfrombasement with no product
delete from orderfrombasement ofb
where
ofb.ordernumber not in
(select query1.ordernumber from ( select count(ordernumber) as c,ordernumber from orderedproduct group by ordernumber) query1)
select * from orderfrombasement
rollback;
--
UPDATE orderfrombasement 
SET orderdate = orderdate+7
WHERE EXISTS (SELECT productbarcode
              FROM orderedproduct
              WHERE (productbarcode = &<name="product" list="select productbarcode, productname from product order by productname" description="yes" multiselect="no">)
              and (orderdate -sysdate<1 or
              sysdate- orderdate<1));

select * from orderedproduct
select * from orderfrombasement
commit
--
UPDATE product
set productprice = productprice*0.9
where not exists (select productbarcode from orderedproduct where product.productbarcode=orderedproduct.productbarcode);
select * from orderedproduct
select * from product                                     
---רשימת העובדים שעבדו מעל שעות הממוצע והגרלה בינהם
select*
from(select *
from(
select sum(during) as hours, emp,emn
from
(
select e.employeename as emn,es.employeeid as emp, s.startTime, s.endTime, s.endTime -s.startTime as during 
from shift s, EmployeeShift es,employee e
where es.shid = s.shid and e.employeeid = es.employeeid
)  
group by emp,emn)
where hours>
(select avg(hours)
from
(
select hours, emp,emn
from(
select sum(during) as hours, emp,emn
from
(
select e.employeename as emn,es.employeeid as emp, s.startTime, s.endTime, s.endTime -s.startTime as during 
from shift s, EmployeeShift es,employee e
where es.shid = s.shid and e.employeeid = es.employeeid
)  
group by emp,emn)))
order by DBMS_RANDOM.VALUE)
where ROWNUM=1;



--עובד מצטיין 
select hours, emp,emn
from(
select sum(during) as hours, emp,emn
from
(
select e.employeename as emn,es.employeeid as emp, s.startTime, s.endTime, s.endTime -s.startTime as during 
from shift s, EmployeeShift es,employee e
where es.shid = s.shid and e.employeeid = es.employeeid
) 

group by emp,emn)
where hours=(select max(hourss)
from(
select sum(during) as hourss
from
(
select e.employeename as emn,es.employeeid as emp, s.startTime, s.endTime, s.endTime -s.startTime as during 
from shift s, EmployeeShift es,employee e
where es.shid = s.shid and e.employeeid = es.employeeid
) 

group by emp))



--- רוצים לדעת את רשימת הסוכנים שנשכרו משנת 2000 והמשכורת שלהם מעל 10000 בסדר עולה או יורד 
select agentName,agentId,agentSalary
from agent
where agentHireYear>2000 and agentSalary>10000
order by agentSalary &<name="Descending salary sort order" checkbox="desc,">;


--q5 העובד שעובד יותר מ2 משמרות
select employeeId,cityName
from cityEmployee natural join (select e.employeeid  ,count(e.shid) as sumOfShifts
from employeeShift e
group by e.employeeid)
where sumofShifts>2 and cityName=&<name="city" type="string" list="SELECT cityName
FROM cityEmployee">


 --q6
SELECT employeeId, employeeName
FROM Employee e
WHERE NOT EXISTS(
SELECT shid
FROM shift s
WHERE s.shid NOT IN
(SELECT shid
FROM EmployeeShift es
WHERE e.employeeId = es.employeeid))AND e.hiringYear>=2000


--update 1 שינוי משמרת
update  Manager
set manager_Adress=(&<name="new adress" type="string">)
where managerName=(&<name="managerName" list="select managerName from Manager order by managerName"
type="string">);

--update2
update employee
set employeeSalary=employeeSalary*1.1
where hiringYear in(select hiringYear
                     from employee 
                     group by hiringYear
                     having count(hiringYear)<=ALL
                                                  (select count(hiringYear)
                                                  from employee
                                                 group by hiringYear))
 


                                         
--מוחק את המשמרת הכי ארוכה
--delete1
DELETE FROM agentt
WHERE agentId  IN(
select agentId
  from ((select MIN(Rating) as Rating
       from(select agentId , Rating 
            from agentt
            group by agentId,Rating))NATURAL JOIN( select agentId , Rating
                                                       from agentt
                                                       group by agentId,Rating )))


--delete2
DELETE FROM schedule
WHERE meetingTime IN
 (SELECT meetingTime
 FROM schedule
 WHERE meetingTime NOT IN(
 SELECT meetingTime
 FROM schedule
 WHERE (EXTRACT(YEAR FROM meetingTime) > EXTRACT(YEAR FROM
CURRENT_DATE)-3)
 AND EXISTS (
 SELECT meetingTime
FROM schedule
 )))
commit;


create index IDX_agentName on agentt(agentName);
 create index IDX_phoneNr on client(phoneNr);                                            
create index IDX_employeeName on employee(employeeName);
    

drop index IDX_employeeName;
drop index IDX_agentName;
drop index IDX_phoneNr;




