create or replace trigger updateProductPriceToZero
  before update
  on product 
  for each row
declare
  -- local variables here
begin
  if :new.productprice= 0 then
    raise_application_error(-20009,'product price must be >0');
      end if;
end updateProductPriceToZero;
/
