select * from employees where SALARY < AVG(SALARY);
select * from employees where SALARY < (select AVG(SALARY) from employees);
select EMP_ID, SALARY, MAX(SALARY) as MAX_SALARY from employees;
select EMP_ID, SALARY, (select MAX(SALARY) from employees) as MAX_SALARY from employees;
select * from (select F_NAME, L_NAME, EMP_ID, JOB_ID, MANAGER_ID, DEP_ID from employees) as EMP4ALL;
