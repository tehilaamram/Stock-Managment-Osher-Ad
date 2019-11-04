create or replace trigger returnTrigger
  before insert
  on returns 
  -- didn't mark statements
  for each row
declare
cursor ordered_product is select * from orderedproduct;
  -- local variables here
begin
  for i in ordered_product loop
    if i.productbarcode !=  :new.productbarcode then
      raise_application_error(-20008,'the product was never sold');
      end if;
   end loop;
end returnTrigger;
/
