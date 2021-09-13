--Accessing Multiple Tables with Sub-Queries
select * from employees where JOB_ID IN (select JOB_IDENT from JOBS)
select * from employees where JOB_ID IN (select JOB_IDENT from JOBS where JOB_TITLE='Jr. Designer')
select j.JOB_IDENT, j.JOB_TITLE, j.MIN_SALARY, j.MAX_SALARY from jobs j where j.JOB_IDENT IN (select JOB_ID from employees where SALARY > 70000)
select j.JOB_IDENT, j.JOB_TITLE, j.MIN_SALARY, j.MAX_SALARY from jobs j where j.JOB_IDENT IN (select JOB_ID from employees where YEAR(B_DATE) > 1976)
select j.JOB_IDENT, j.JOB_TITLE, j.MIN_SALARY, j.MAX_SALARY from jobs j where j.JOB_IDENT IN (select JOB_ID from employees where YEAR(B_DATE) > 1976 and SEX='F')

--Accessing Multiple Tables with Implicit Joins
select * from employees,jobs
select  * from employees, jobs where employees.JOB_ID = jobs.JOB_IDENT
select  * from employees as e, jobs as j where e.JOB_ID = j.JOB_IDENT
select  EMP_ID, F_NAME, L_NAME, job_id, JOB_TITLE from employees as e, jobs as j where e.JOB_ID = j.JOB_IDENT
select  e.EMP_ID, e.F_NAME, e.L_NAME, e.job_id, j.JOB_TITLE from employees as e, jobs as j where e.JOB_ID = j.JOB_IDENT
