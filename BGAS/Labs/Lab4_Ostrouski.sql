
--1.	Вывести информацию  об одном (любом) предмете, 
--по которому читается наибольшее количество часов (не зависимо от факультета).
SELECT TOP(1) subj,form,faculty, hours 
FROM teach
WHERE hours = (SELECT  max(hours) FROM teach)

--2.	Вывести список, в котором будет указана информация о всех предметах 
--по которым число читаемых часов наибольшее (не зависимо от факультета).
SELECT subj,form,faculty, hours 
FROM teach 
WHERE hours = (SELECT  max(hours) FROM teach)

3.	Определит факультет (один, любой),  на котором учится максимальное количество 
студентов до 35 к текущей дате

SELECT TOP(1) faculty, COUNT(*) as Number 
FROM stud 
WHERE (YEAR(getdate()) - 1 - YEAR(br_date)) < 35 
GROUP BY faculty
ORDER BY count(*) DESC


--4.	Определить факультет, на котором учится максимальное число первокурсников очников или заочников

SELECT TOP(1) faculty, COUNT(*) 
FROM stud 
WHERE year='1' and (form='очная' OR form='заочная')
GROUP BY faculty 
ORDER BY count(*) DESC


--5.	Определить факультет с минимальным числом студентов на заочной форме обучения
SELECT TOP(1) faculty,form, COUNT(*) as MinNumber 
FROM stud 
WHERE form='заочная' 
GROUP BY faculty,form
ORDER BY count(*) ASC


--6.	Вывести информацию о самом успевающем студенте университета.

SELECT last_name, f_name, faculty,year, exm 
FROM stud 
WHERE exm = (SELECT max(exm) from stud)


--7.	Вывести информацию о самых успевающих студенах университета.
SELECT TOP(3) with ties  last_name, f_name, faculty,year, exm 
FROM stud 
ORDER BY exm DESC

--8.	Вывести список студентов средняя оценка которых на 20% меньше максимальной по университету (подзапрос)

SELECT last_name, f_name, faculty,year,exm 
FROM stud 
WHERE exm < ((SELECT MAX(exm) FROM stud) - (SELECT MAX(exm) FROM stud) * 0.2)

--9.	Вывести список студентов средняя оценка которых, равна максимальной по университету (подзапрос)

SELECT last_name, f_name, faculty,year,exm 
FROM stud
WHERE exm=(SELECT MAX(exm) FROM stud)

--10.	Вывести список фамилий студентов, которые учатся на самом многочисленном факультете(подзапрос)
SELECT last_name, f_name, faculty FROM stud WHERE faculty = (SELECT TOP(1)  faculty 
FROM stud 
GROUP BY faculty
ORDER BY count(distinct last_name) DESC)


--11.	Вывести список форм обучения в университете 
SELECT DISTINCT form 
FROM stud

--12.	Определить процент учащихся иностранцев к  числу студентов в университете*

SELECT convert(float,(SELECT COUNT(*) 
FROM stud 
WHERE s_name IS NULL) * 100 / (SELECT COUNT(distinct last_name) FROM stud))




