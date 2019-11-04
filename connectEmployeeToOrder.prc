--order_date orderfrombasement.orderdate%type;
create or replace procedure connectEmployeeToOrder(oNumber number) is 
CURSOR c_employee is 
      SELECT employeeid,shid FROM employeeshift ;
  order_date orderfrombasement.orderdate%type;
  shift_id shift.shid%type;
    shift_id_e shift.shid%type;
  employee_id employeeshift.employeeid%type;
begin
  -- order date
  select orderDate
   into order_date
  from orderfrombasement
  where orderfrombasement.ordernumber = oNumber;
  -- select first shift in the same date with at least 1 employee
  select s.shid
  into shift_id
  from shift s, (SELECT count(shid) AS total_amt,shid
      FROM  employeeshift
      GROUP BY shid) query1
where s.shdate = order_date and query1.total_amt>0 and rownum = 1;
-- all the employee in the selected shift
 OPEN c_employee; 
   LOOP 
   FETCH c_employee into employee_id,shift_id_e; 
      EXIT WHEN c_employee%notfound; 
       if(shift_id = shift_id_e)then
     dbms_output.put_line(employee_id|| ' ' || oNumber); 
     insert into EMPLOYEEORDER (EMPLOYEEID, ORDERNUMBER)
     values (employee_id, oNumber);
      END IF;
   END LOOP; 
   CLOSE c_employee; 
 
end connectEmployeeToOrder;
/
