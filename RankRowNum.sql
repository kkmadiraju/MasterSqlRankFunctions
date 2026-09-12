--Use online SQL practise
--https://www.programiz.com/sql/online-compiler

select item,amount, rank() over (order  by amount asc) as rankamt from orders;
select item,amount, dense_rank() over (order  by amount asc) as densamount from orders;
select item,amount, row_number() over (order by amount asc) as rn from orders;
