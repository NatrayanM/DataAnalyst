--problem 1.1
--Write and execute a SQL query to list the school names, community names and average attendance for communities with a 
--hardship index of 98.

/*select CPS.NAME_OF_SCHOOL, CPS.COMMUNITY_AREA_NAME, CPS.AVERAGE_STUDENT_ATTENDANCE, CD.HARDSHIP_INDEX from 
CHICAGO_PUBLIC_SCHOOLS CPS LEFT OUTER JOIN CENSUS_DATA CD ON CPS.COMMUNITY_AREA_NUMBER = CD.COMMUNITY_AREA_NUMBER
WHERE CD.HARDSHIP_INDEX=98;*/

/*select CPS.NAME_OF_SCHOOL, CPS.COMMUNITY_AREA_NAME, CPS.AVERAGE_STUDENT_ATTENDANCE, CD.HARDSHIP_INDEX from 
CHICAGO_PUBLIC_SCHOOLS CPS LEFT OUTER JOIN CENSUS_DATA CD ON UPPER(CPS.COMMUNITY_AREA_NUMBER) = UPPER(CD.COMMUNITY_AREA_NUMBER)
WHERE CD.HARDSHIP_INDEX=98;*/

--problem 1.2
--Write and execute a SQL query to list all crimes that took place at a school. Include case number, crime type and 
--community name.

/*select CCD.CASE_NUMBER, CCD.PRIMARY_TYPE as CRIME_TYPE, CCD.LOCATION_DESCRIPTION, CD.COMMUNITY_AREA_NAME from 
CHICAGO_CRIME_DATA as CCD LEFT OUTER JOIN CENSUS_DATA CD on CCD.COMMUNITY_AREA_NUMBER = CD.COMMUNITY_AREA_NUMBER  
where CCD.LOCATION_DESCRIPTION LIKE UPPER('%school%');*/

--problem 2.1
/* Write and execute a SQL statement to create a view showing the columns listed in the following table, 
with new column names as shown in the second column.
Column name in CHICAGO_PUBLIC_SCHOOLS	Column name in view
NAME_OF_SCHOOL							School_Name
Safety_Icon								Safety_Rating
Family_Involvement_Icon					Family_Rating
Environment_Icon						Environment_Rating
Instruction_Icon						Instruction_Rating
Leaders_Icon							Leaders_Rating
Teachers_Icon							Teachers_Rating
Write and execute a SQL statement that returns all of the columns from the view.
Write and execute a SQL statement that returns just the school name and leaders rating from the view. */


--DROP VIEW CHICAGO_SCHOOLS;
/*CREATE VIEW CHICAGO_SCHOOLS (School_Name, Safety_Rating, Family_Rating, Environment_Rating, Instruction_Rating, Leaders_Rating,
Teachers_Rating) AS SELECT NAME_OF_SCHOOL, Safety_Icon, Family_Involvement_Icon, Environment_Icon, Instruction_Icon, 
Leaders_Icon, Teachers_Icon from CHICAGO_PUBLIC_SCHOOLS;

SELECT COLNAME FROM syscat.columns WHERE tabname = 'CHICAGO_SCHOOLS';
SELECT COLNAME FROM syscat.columns WHERE tabname = 'CHICAGO_SCHOOLS' AND (COLNAME LIKE UPPER('%school_name%') or COLNAME LIKE UPPER('%leaders_rating%')); */



-- Problem 3.1 STORED PROCEDURE
/* Write the structure of a query to create or replace a stored procedure called UPDATE_LEADERS_SCORE that takes a in_School_ID parameter 
as an integer and a in_Leader_Score parameter as an integer. Don't forget to use the #SET TERMINATOR statement to use the @ for the CREATE statement terminator. */

/* --#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE  UPDATE_LEADERS_SCORE (in_School_ID INTEGER,  in_Leader_Score  INTEGER) 

LANGUAGE SQL                                                -- Language used in this routine
MODIFIES SQL DATA                                           -- This routine will only write/modify data in the table

BEGIN 
    
    /* SOME CODE HERE */
   
END
@                                                           -- Routine termination character */

--Problem 3.2
/*Inside your stored procedure, write a SQL statement to update the Leaders_Score field in the CHICAGO_PUBLIC_SCHOOLS table for the 
school identified by in_School_ID to the value in the in_Leader_Score parameter. */

/* --#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE  UPDATE_LEADERS_SCORE (IN in_School_ID INTEGER,  IN in_Leader_Score  INTEGER) 

LANGUAGE SQL                                                -- Language used in this routine
MODIFIES SQL DATA                                           -- This routine will only write/modify data in the table

BEGIN 
    
    UPDATE CHICAGO_PUBLIC_SCHOOLS SET Leaders_score=in_Leader_Score where School_ID=in_School_ID;
    
END
@                                                           -- Routine termination character */

-- Problem 3.3
/* Inside your stored procedure, write a SQL IF statement to update the Leaders_Icon field in the CHICAGO_PUBLIC_SCHOOLS table for 
the school identified by in_School_ID using the following information. */

/* --#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE  UPDATE_LEADERS_SCORE (IN in_School_ID INTEGER,  IN in_Leader_Score  INTEGER) 

LANGUAGE SQL                                                -- Language used in this routine
MODIFIES SQL DATA                                           -- This routine will only write/modify data in the table

BEGIN 

	UPDATE CHICAGO_PUBLIC_SCHOOLS SET Leaders_score=in_Leader_Score where School_ID=in_School_ID;
	
    IF in_Leader_Score >=0 and in_Leader_Score <=19 THEN
    UPDATE CHICAGO_PUBLIC_SCHOOLS SET Leaders_Icon='Very weak' where School_ID=in_School_ID;
    
    ELSEIF in_Leader_Score >19 and in_Leader_Score <=39 THEN
    UPDATE CHICAGO_PUBLIC_SCHOOLS SET Leaders_Icon='Weak' where School_ID=in_School_ID;
    
    ELSEIF in_Leader_Score >39 and in_Leader_Score <=59 THEN
    UPDATE CHICAGO_PUBLIC_SCHOOLS SET Leaders_Icon='Average' where School_ID=in_School_ID;

	ELSEIF in_Leader_Score >59 and in_Leader_Score <=79 THEN
    UPDATE CHICAGO_PUBLIC_SCHOOLS SET Leaders_Icon='Strong' where School_ID=in_School_ID;

	ELSEIF in_Leader_Score >79 and in_Leader_Score <=99 THEN
    UPDATE CHICAGO_PUBLIC_SCHOOLS SET Leaders_Icon='Very strong' where School_ID=in_School_ID;
    
    END IF;                                                 -- End of conditional statement
END
@                                                           -- Routine termination character */

--Problem 3.4 Run your code to create the stored procedure.

/* 
select LEADERS_ICON, LEADERS_SCORE from CHICAGO_PUBLIC_SCHOOLS where SCHOOL_ID=610098;

CALL UPDATE_LEADERS_SCORE(610098, 50);        -- Caller query

select LEADERS_ICON, LEADERS_SCORE from CHICAGO_PUBLIC_SCHOOLS where SCHOOL_ID=610098; */

--Problem 4.1 Update your stored procedure definition. Add a generic ELSE clause to the IF statement that rolls back the current work 
-- if the score did not fit any of the preceding categories.

/* --#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE  UPDATE_LEADERS_SCORE (IN in_School_ID INTEGER,  IN in_Leader_Score  INTEGER) 

LANGUAGE SQL                                                -- Language used in this routine
MODIFIES SQL DATA                                           -- This routine will only write/modify data in the table

BEGIN 

	UPDATE CHICAGO_PUBLIC_SCHOOLS SET Leaders_score=in_Leader_Score where School_ID=in_School_ID;
	
    IF in_Leader_Score >=0 and in_Leader_Score <=19 THEN
    UPDATE CHICAGO_PUBLIC_SCHOOLS SET Leaders_Icon='Very weak' where School_ID=in_School_ID;
    
    ELSEIF in_Leader_Score >19 and in_Leader_Score <=39 THEN
    UPDATE CHICAGO_PUBLIC_SCHOOLS SET Leaders_Icon='Weak' where School_ID=in_School_ID;
    
    ELSEIF in_Leader_Score >39 and in_Leader_Score <=59 THEN
    UPDATE CHICAGO_PUBLIC_SCHOOLS SET Leaders_Icon='Average' where School_ID=in_School_ID;

	ELSEIF in_Leader_Score >59 and in_Leader_Score <=79 THEN
    UPDATE CHICAGO_PUBLIC_SCHOOLS SET Leaders_Icon='Strong' where School_ID=in_School_ID;

	ELSEIF in_Leader_Score >79 and in_Leader_Score <=99 THEN
    UPDATE CHICAGO_PUBLIC_SCHOOLS SET Leaders_Icon='Very strong' where School_ID=in_School_ID;
    
    ELSE
    ROLLBACK WORK;
    
    END IF;                                                 -- End of conditional statement
END
@                                                           -- Routine termination character */


/* select LEADERS_ICON, LEADERS_SCORE from CHICAGO_PUBLIC_SCHOOLS where 
SCHOOL_ID=610209;

CALL UPDATE_LEADERS_SCORE(610209, 500);        -- Caller query

select LEADERS_ICON, LEADERS_SCORE from CHICAGO_PUBLIC_SCHOOLS where 
SCHOOL_ID=610209; */


-- Problem 4.2 Update your stored procedure definition again. Add a statement to commit the current unit of work at the end of the procedure.

/* --#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE  UPDATE_LEADERS_SCORE (IN in_School_ID INTEGER,  IN in_Leader_Score  INTEGER) 

LANGUAGE SQL                                                -- Language used in this routine
MODIFIES SQL DATA                                           -- This routine will only write/modify data in the table

BEGIN 

	UPDATE CHICAGO_PUBLIC_SCHOOLS SET Leaders_score=in_Leader_Score where School_ID=in_School_ID;
	
    IF in_Leader_Score >=0 and in_Leader_Score <=19 THEN
    UPDATE CHICAGO_PUBLIC_SCHOOLS SET Leaders_Icon='Very weak' where School_ID=in_School_ID;
    
    ELSEIF in_Leader_Score >19 and in_Leader_Score <=39 THEN
    UPDATE CHICAGO_PUBLIC_SCHOOLS SET Leaders_Icon='Weak' where School_ID=in_School_ID;
    
    ELSEIF in_Leader_Score >39 and in_Leader_Score <=59 THEN
    UPDATE CHICAGO_PUBLIC_SCHOOLS SET Leaders_Icon='Average' where School_ID=in_School_ID;

	ELSEIF in_Leader_Score >59 and in_Leader_Score <=79 THEN
    UPDATE CHICAGO_PUBLIC_SCHOOLS SET Leaders_Icon='Strong' where School_ID=in_School_ID;

	ELSEIF in_Leader_Score >79 and in_Leader_Score <=99 THEN
    UPDATE CHICAGO_PUBLIC_SCHOOLS SET Leaders_Icon='Very strong' where School_ID=in_School_ID;
    
    ELSE
    ROLLBACK WORK;
    
    END IF;                                                 -- End of conditional statement
    
    COMMIT WORK;
END
@                                                           -- Routine termination character */

/* select LEADERS_ICON, LEADERS_SCORE from CHICAGO_PUBLIC_SCHOOLS where 
SCHOOL_ID=610084;

CALL UPDATE_LEADERS_SCORE(609837, 101);        -- Caller query

select LEADERS_ICON, LEADERS_SCORE from CHICAGO_PUBLIC_SCHOOLS where 
SCHOOL_ID=610084; */

/* select LEADERS_ICON, LEADERS_SCORE from CHICAGO_PUBLIC_SCHOOLS where 
SCHOOL_ID=610353;

CALL UPDATE_LEADERS_SCORE(610353, 98);        -- Caller query

select LEADERS_ICON, LEADERS_SCORE from CHICAGO_PUBLIC_SCHOOLS where 
SCHOOL_ID=610353; */
