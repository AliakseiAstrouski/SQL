
--1.	Вывести информацию студентах (факультет, курс) заочной формы обучения младше 37 лет

SELECT stud.last_name, stud.f_name, faculty.faculty_name, hours.course 
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN form on hours.form_id = form.id
JOIN faculty on faculty.id = hours.faculty_id
WHERE (YEAR(getdate()) - 1 - YEAR(br_date)) < 37 AND form.form_name = 'заочно'


--2.	Определить количество студентов на каждом факультете

SELECT faculty.faculty_name, COUNT(DISTINCT stud.last_name)
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
GROUP BY faculty.faculty_name


--3.	Определить количество студентов, учащихся на каждой форме обучения

SELECT form.form_name, COUNT(DISTINCT stud.last_name)
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN form on hours.form_id = form.id
GROUP BY form.form_name


--4.	Определить средний возраст студентов для каждого факультета на конец года (лет)

SELECT faculty.faculty_name, AVG(YEAR(getdate()) - 1 - YEAR(br_date)) AS avg_age
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
GROUP BY faculty.faculty_name


--5.	Найти всех студентов-иностранцев (без отчества), вывести сведения о них 
--(дата поступления, факультет, курс, форма обучения)

SELECT stud.last_name, stud.f_name, stud.in_date, faculty.faculty_name, hours.course, form.form_name
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN form on hours.form_id = form.id
JOIN faculty on faculty.id = hours.faculty_id
WHERE stud.s_name IS NULL


--6.	Определить, на какой факультет поступило наибольшее количество человек в 2015 году

SELECT TOP(1)  faculty.faculty_name, COUNT(stud.in_date) AS number
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
WHERE YEAR(stud.in_date) = '2015'
GROUP BY faculty.faculty_name
ORDER BY number DESC


--7.	Определить число студентов поступивших на каждый факультет и форму обучения в 2014 году 

SELECT faculty.faculty_name, form.form_name, COUNT(DISTINCT stud.last_name) AS number
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
JOIN form on hours.form_id = form.id
WHERE YEAR(stud.in_date) = '2014'
GROUP BY faculty.faculty_name, form.form_name


--8.	Вывести список всех факультетов, на которых доступна заочная форма обучения. 

SELECT DISTINCT faculty.faculty_name, form.form_name
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
JOIN form on hours.form_id = form.id
WHERE form.form_name = 'заочно'


--9.	Вывести список факультетов, для каждого факультета вывести список форм обучения и номера курсов, (*) 

SELECT faculty.faculty_name, hours.course, form.form_name
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
JOIN form on hours.form_id = form.id
GROUP BY faculty.faculty_name, hours.course, form.form_name


--10.	Вывести список факультетов, с указанием числа студентов обучающихся на каждой форме обучения(*)

SELECT faculty.faculty_name, form.form_name, COUNT(DISTINCT stud.last_name) as number
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
JOIN form on hours.form_id = form.id
GROUP BY faculty.faculty_name, form.form_name

--11.	Вывести число всех студентов первого и третьего курсов для всех факультетов и форм(*)

SELECT faculty.faculty_name, form.form_name COUNT(DISTINCT stud.last_name) as number
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
JOIN form on hours.form_id = form.id
WHERE hours.course='1' or hours.course='3'
GROUP BY faculty.faculty_name, form.form_name


--12.	Для всех факультетов и курсов найти число иностранцев, которое на них учится(*)

SELECT faculty.faculty_name, hours.course, COUNT(DISTINCT stud.last_name) as number
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
WHERE stud.s_name is NULL
GROUP BY faculty.faculty_name, hours.course


--13.	Для каждого курса с учетом факультета найти количество студентов, средний балл которых больше 7,5(*)

SELECT faculty.faculty_name, hours.course, COUNT(DISTINCT stud.last_name) as number
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
WHERE stud.exm > 7.5
GROUP BY  faculty.faculty_name, hours.course

--14.	Вывести список факультетов с учетом формы с указанием числа  студентов старше 45(*)

SELECT faculty.faculty_name, form.form_name, COUNT(DISTINCT stud.last_name) as number
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
JOIN form on hours.form_id = form.id
WHERE YEAR(getdate()) - 1 - YEAR(br_date) > 45
GROUP BY  faculty.faculty_name, form.form_name

--15.	Вывести информацию для каждого факультета, формы, курса о количестве студентов младше 27(*)

SELECT faculty.faculty_name, form.form_name, hours.course, COUNT(DISTINCT stud.last_name) as number
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
JOIN form on hours.form_id = form.id
WHERE YEAR(getdate()) - 1 - YEAR(br_date) < 27
GROUP BY  faculty.faculty_name, form.form_name, hours.course


--16.	Определить сколько студентов с фамилиями  на C на каждом факультете (*)

SELECT faculty.faculty_name, COUNT(DISTINCT stud.last_name) as number
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
WHERE stud.last_name LIKE 'С%'
GROUP BY faculty.faculty_name








