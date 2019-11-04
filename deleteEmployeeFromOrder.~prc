create or replace procedure deleteEmployeeFromOrder(oNumber number) is
cursor c_employee_order is
 select *
 from employeeorder ;
rec_employee_order employeeorder%rowtype;
order_number employeeorder.ordernumber%type;
begin
 open c_employee_order;
 loop
 fetch c_employee_order into rec_employee_order;
 exit when c_employee_order%notfound;
 if(rec_employee_order.ordernumber = oNumber)then
 delete
 from employeeorder
 where rec_employee_order.ordernumber = oNumber;
 end if;
 end loop;
 close c_employee_order;
end deleteEmployeeFromOrder;
/
