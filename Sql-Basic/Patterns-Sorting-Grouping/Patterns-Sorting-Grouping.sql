select * from employees where address like '%Elgin,IL%';
select * from employees where year(B_DATE) between 1970 and 1979;
select * from employees where B_DATE LIKE '%197%'
select * from employees where DEP_ID='5' and SALARY between 60000 and 70000;
select * from employees order by DEP_ID;
select * from employees order by DEP_ID DESC, L_NAME DESC;
select E.F_NAME, E.L_NAME, D.DEP_NAME from employees as E, departments as D where E.DEP_ID IN D.DEPT_ID_DEP order by D.DEP_NAME , E.L_NAME DESC;
select DEP_ID, count(*) as emp_cnt from employees group by DEP_ID;
select DEP_ID, count(*) as NUM_EMPLOYEES, AVG(SALARY) as AVG_SAL from employees group by DEP_ID;
select DEP_ID, count(*) as NUM_EMPLOYEES, AVG(SALARY) as AVG_SAL from employees group by DEP_ID order by AVG_SAL ;
select DEP_ID, count(*) as NUM_EMPLOYEES, AVG(SALARY) as AVG_SAL from employees group by DEP_ID having count(*) < 4 order by AVG_SAL ;