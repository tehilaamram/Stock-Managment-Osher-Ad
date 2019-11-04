create or replace function getMaxSellsCompany return varchar2 is
  FunctionResult varchar2(30);
  CURSOR c_company is 
      SELECT companyid,companyname FROM company ;
  CURSOR c_orderedProduct is 
     SELECT orderamount,productprice,companyid FROM product natural join orderedproduct;
  product_barcode product.productbarcode%type;
  product_amount orderedproduct.orderamount%type;
  product_price product.productprice%type;
  ccompany_id company.companyid%type;
  pcompany_id product.companyid%type;
  company_name company.companyname%type;
  current_sum number;
  max_sum number;
  current_company varchar2(30);
begin
  current_sum:=0;
  max_sum:=0;
  current_company:= 'no company was found';
FOR i IN c_company LOOP
current_sum := 0;
      
       for j in c_orderedProduct loop

         if(j.companyid= i.companyid) then
current_sum:= current_sum + (j.orderamount*j.productprice);
         end if;
        if (current_sum > max_sum) then
          max_sum:= current_sum;
          current_company := i.companyname;
        end if;
 end loop;
  END LOOP;
  FunctionResult:= current_company;
  return(FunctionResult);
end getMaxSellsCompany;
/
