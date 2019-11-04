create or replace function bonusTheBestMonthlyEmployee return number is
 FunctionResult number;
CURSOR c_employee is 
      SELECT employeesalary, employeeid FROM employee;
  CURSOR c_shift is 
     SELECT starttime,endtime,shdate,employeeid FROM shift natural join employeeshift;
  current_sum number;
  max_sum number;
  counter number;
  one_number integer;
begin
  one_number := 1;
    current_sum:=0;
  max_sum:=0;
  counter:=0;
FOR i IN c_employee LOOP
current_sum := 0;
      
       for j in c_shift loop

         if(j.employeeid= i.employeeid and extract(year from j.shdate) = EXTRACT(year from sysdate) and 
         EXTRACT(month from sysdate) = EXTRACT(month from j.shdate)) then
current_sum:= current_sum + (j.endtime-j.starttime);
         end if;
       
 end loop;
  if (current_sum >= max_sum) then
           dbms_output.put_line(counter);
           dbms_output.put_line(i.employeeid);
          max_sum:= current_sum;
        counter:=counter+1;
        end if;
 END LOOP;
       FunctionResult:=counter;
    return(FunctionResult);
end bonusTheBestMonthlyEmployee;
/
