-----------------------------------------------------
--SELECT exercises
-----------------------------------------------------

/* We want to find out all the first and last names
as well as their birthdates of the patients data */

select first,last,birthdate 
from patients

/* We want to find out the distinct encounters
that occurs at the hospital */

select distinct encounterclass 
from encounters

-----------------------------------------------------
--WHERE exercises
-----------------------------------------------------

/* Show me encounters that are inpatients and are
ICU Admissions */

select * 
from encounters
where encounterclass='inpatient' 
and description='ICU Admission'

/* I want rows that takes place only in 2023 */

select * 
from encounters
where encounterclass='inpatient' 
and description='ICU Admission'
and stop between '2023-01-01 00:00' and '2023-12-31 23:59'

/* What if I want to include either 'Ambulatory' and 'Outpatients' */

select * 
from encounters
where encounterclass in ('outpatient','ambulatory')

-----------------------------------------------------
--GROUP BY Exercise
-----------------------------------------------------

/* Want to gorup the descriptions and give a count */

select description, count(*) as count_of_cond
from conditions
group by description
order by count(*) DESC

-----------------------------------------------------
--HAVING Exercise
-----------------------------------------------------

/* What if we want grouped descriptions with a count of over 2000 */

select description, count(*) as count_of_cond
from conditions
group by description
having count(*) >2000
order by count(*) DESC

/* What if we want grouped descriptions with a count of over 5000
without the "Body Mass Index 30.0-30.9, adult" description */

select description, count(*) as count_of_cond
from conditions
where description !='Body Mass Index 30.0-30.9, adult'
group by description
having count(*) >5000
order by count(*) DESC

-----------------------------------------------------
--TEST TEST TEST
-----------------------------------------------------

/* Write a query that selects all of the patients from Boston */
select *
from patients
where city='Boston'

/* Write a query that displays all the patients who have been
diagnosed with Chronic Kidney Disease. Condition code 585.1,
585.2, 585.3 and 585.4 are all conditions to Kidney Disease*/

select * 
from conditions
where code in ('585.1','585.2','585.3','585.4')

/* List out number of patients per city in desc order (not Boston)
and must have at least 100 patients from that city */

select city, count(*)
from patients
where city != 'Boston'
group by city
having count(*) > 100
order by count(*) desc

-----------------------------------------------------
--JOIN Exercise
-----------------------------------------------------

/* Combine the patients and immunizations tables
and bring out the first name, last name and birthdates */

select t1.*,t2.first, t2.last,t2.birthdate
from immunizations as t1
left join patients as t2
on t1.patient=t2.id