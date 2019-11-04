create index index_returns
on returns(returnsDate);
drop index index_returns;
--
create index index_orderedProduct
on orderedproduct(EXPIRYDATE);
drop index index_orderedProduct;
--
create index index_orderedProduct_best
on orderedproduct(orderAmount);
drop index index_orderedProduct_best;
--
create index index_left
on orderedproduct(orderAmount,soldamount);
drop index index_left;
