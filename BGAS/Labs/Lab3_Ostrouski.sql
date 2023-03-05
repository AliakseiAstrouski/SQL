
--1.	Определить среднее значение средних баллов (то значение которое в таблице) 
--за экзамены для студентов заочной форме обучения каждого факультета.
SELECT faculty, AVG(exm) as Average 
FROM stud 
WHERE form = 'заочная' 
GROUP BY faculty

--2.	Найти значения максимальных средних баллов для каждого факультета с учетом курса
SELECT faculty, MAX(exm) as MaxPoint 
FROM stud 
GROUP BY faculty

--3.	Определить список факультетов, среднее значение средних баллов успеваемости 
--на которых больше 7
SELECT faculty, AVG(exm) as Average 
FROM stud  
GROUP BY faculty 
HAVING AVG(exm) > 7

--4.	Определить список курсов с указанием факультета и формы обучения, 
--средний балл успеваемости на которых больше 7.5
SELECT year, faculty, form, AVG(exm) as Average
FROM stud GROUP BY year, faculty, form 
HAVING AVG(exm) > 7.5

--5.	Определить минимальное значение средних баллов успеваемости 
--на каждом факультете с привязкой к курсу
SELECT faculty, year, MIN(exm) 
FROM stud 
GROUP BY faculty, year 

--6.	Определить перечень факультетов с привязкой к форме минимальное значение 
--средних баллов успеваемости, для которых больше 6 
SELECT faculty, MIN(exm) as Min, AVG(exm) as Average 
FROM stud 
GROUP BY faculty 
HAVING AVG(exm) > 6;


--7.	 Определить, какое количество часов один студент ФПК 3-го курса заочной формы обучения 
--тратит на самостоятельную подготовку
SELECT DISTINCT all_h 
FROM stud 
WHERE faculty = 'ФПК'AND year = '3' AND form = 'заочная';


--8.	Вывести список факультетов, курсов, форм обучения, учась на которых студент   тратит  
--более 150 часов на самостоятельную подготовку
SELECT DISTINCT faculty, year, form 
FROM stud 
WHERE (all_h + inclass_h) > 150


--9.	Вывести количество предметов, читаемых каждым преподавателем
SELECT last_name, f_name, s_name, count(distinct subj)as NumberOfItems 
FROM teach 
GROUP BY last_name, f_name, s_name;

--10.	Вывести количество преподавателей, работающих на каждом факультете
SELECT faculty, count(distinct last_name) 
FROM teach 
GROUP BY faculty


--11.	Вывести список предметов с указанием числа часов являющихся максимальным для данного предмета
SELECT DISTINCT subj, MAX(hours) as MaxHours 
FROM teach 
GROUP BY subj


--12.	Вывести список преподавателей, читающих более одного предмета.
SELECT last_name, count(distinct subj) as NumberOfSubj
FROM teach GROUP BY last_name 
HAVING count(distinct subj) > 1


--13.	Вывести количество предметов, читаемых на каждом факультете на  втором курсе; 
SELECT faculty, count(distinct subj) 
FROM teach
WHERE year = '2' 
GROUP BY faculty


--14.	Вывести количество  предметов, читаемых на каждом факультете преподавателями иностранцами
SELECT faculty, count(distinct subj) as NumberOfSubj 
FROM teach 
WHERE s_name IS NULL 
GROUP BY faculty

