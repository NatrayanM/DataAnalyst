--#1 Select the names and job start dates of all employees who work for the department number 5.
--select E.F_NAME, E.L_NAME, E.DEP_ID, JH.START_DATE from EMPLOYEES E INNER JOIN JOB_HISTORY JH ON E.EMP_ID = JH.EMPL_ID where E.DEP_ID=5;

--#2 Select the names, job start dates, and job titles of all employees who work for the department number 5.
--select E.F_NAME, E.L_NAME, E.DEP_ID, E.JOB_ID, JH.START_DATE, J.JOB_TITLE 
--from EMPLOYEES E INNER JOIN JOB_HISTORY JH ON  E.EMP_ID = JH.EMPL_ID
--INNER JOIN JOBS J ON E.JOB_ID= J.JOB_IDENT where E.DEP_ID=5

--#3 Perform a Left Outer Join on the EMPLOYEES and DEPARTMENT tables and select employee id, last name, department id and department name for all employees.
--select E.EMP_ID, E.L_NAME, E.DEP_ID, D.DEP_NAME from employees E 
--LEFT OUTER JOIN departments D on E.DEP_ID=D.DEPT_ID_DEP

--#4 Re-write the previous query but limit the result set to include only the rows for employees born before 1980.
--select E.EMP_ID, E.L_NAME, E.DEP_ID, E.B_DATE, D.DEP_NAME from employees E 
--LEFT OUTER JOIN departments D on E.DEP_ID=D.DEPT_ID_DEP where YEAR(E.B_DATE) < 1980

--#4-ALT Re-write the previous query but limit the result set to include only the rows for employees born before 1980.
-- Alternatively, you could also use an INNER JOIN.
--select E.EMP_ID, E.L_NAME, E.DEP_ID, E.B_DATE, D.DEP_NAME from employees E 
--INNER JOIN departments D on E.DEP_ID=D.DEPT_ID_DEP where YEAR(E.B_DATE) < 1980


--#5 Re-write the previous query but have the result set include all the employees but department names for only the employees who were born before 1980.
--select E.EMP_ID, E.L_NAME, E.DEP_ID, E.B_DATE, D.DEP_NAME from employees E 
--LEFT OUTER JOIN departments D on E.DEP_ID=D.DEPT_ID_DEP AND YEAR(E.B_DATE) < 1980

--#6 Perform a Full Join on the EMPLOYEES and DEPARTMENT tables and select the First name, Last name and Department name of all employees.
--select E.F_NAME, E.L_NAME, E.DEP_ID, D.DEP_NAME from employees E 
--FULL OUTER JOIN departments D on E.DEP_ID=D.DEPT_ID_DEP

--#7 Re-write the previous query but have the result set include all employee names but department id and department names only for male employees.
--select E.F_NAME, E.L_NAME, E.SEX, D.DEPT_ID_DEP, D.DEP_NAME from employees E 
--FULL OUTER JOIN departments D on E.DEP_ID=D.DEPT_ID_DEP and E.SEX='M'

--#7ALT Re-write the previous query but have the result set include all employee names but department id and department names only for male employees.
-- Alternatively, you can also use Left Outer Join.
select E.F_NAME, E.L_NAME, E.SEX, D.DEPT_ID_DEP, D.DEP_NAME from employees E 
LEFT OUTER JOIN departments D on E.DEP_ID=D.DEPT_ID_DEP and E.SEX='M'


