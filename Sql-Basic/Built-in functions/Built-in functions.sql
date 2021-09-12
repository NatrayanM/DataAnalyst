select SUM(COST) as TOTAL_COST from PETRESCUE;
select MAX(QUANTITY) as MAX_QTY from PETRESCUE;
select AVG(COST) as AVG_COST from PETRESCUE;
-- this query gives the average cost for each rescue of dog--
select COST, QUANTITY, COST/QUANTITY as COST_PER_DOG from PETRESCUE where ANIMAL='Dog';
-- This query would provide overall average of the cost of dog rescue--
select COST, AVG(COST/QUANTITY) from PETRESCUE where ANIMAL='Dog';
select ROUND(COST) from PETRESCUE;
select ANIMAL, LENGTH(ANIMAL) as ANIMAL_LENGTH from PETRESCUE;
select UPPER(ANIMAL) from PETRESCUE;
select DISTINCT(UPPER(ANIMAL)) from PETRESCUE;
--or--
select DISTINCT(UCASE(ANIMAL)) from PETRESCUE;
select * from PETRESCUE where LOWER(ANIMAL) = 'cat';
--or--
select * from PETRESCUE where LCASE(ANIMAL) = 'cat';

-- Date Functions --
select DAYOFMONTH(RESCUEDATE) as DAY_OF_MONTH from PETRESCUE where upper(ANIMAL) = 'CAT';
select SUM(QUANTITY) from PETRESCUE where MONTH(RESCUEDATE)=5;
select SUM(QUANTITY) from PETRESCUE where DAYOFMONTH(RESCUEDATE)=14;
select DAYOFMONTH(RESCUEDATE) as RESCUEDATE, DAYOFMONTH(RESCUEDATE+3) as VET_VISIT from PETRESCUE;
--for exact vet visit date--
select RESCUEDATE+3 from PETRESCUE;
select CURRENT_DATE-RESCUEDATE as RESCUE_TIME from PETRESCUE;
