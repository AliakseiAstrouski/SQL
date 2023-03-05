--Лабораторная №2

--1.	Вывести фамилии студентов, в которых присутствуют буквы "б" и/или
--"о" в любых комбинациях и порядке
SELECT stud.last_name 
FROM stud 
WHERE stud.last_name LIKE '%о%' OR stud.last_name LIKE '%б%'

--2.	Вывести сведения о  студентах, фамилии которых начинаются с буквы К,
--при этом они являются иностранцами (NULL в поле отчества) 	

SELECT * 
FROM stud 
WHERE stud.last_name 
LIKE 'К%' AND s_name IS NULL

--3.	Вывести сведения о  студентах, фамилии которых содержат 8 символов и более 

SELECT * 
FROM stud 
WHERE LEN(stud.last_name) >= 8;

--4.	Вывести сведения о  студентах, фамилии которых содержат или больше,
--или меньше семи символов (но не ровно семь символов), при этом одна из букв фамилии 'a'

SELECT * 
FROM stud 
WHERE LEN(stud.last_name) != 7 AND stud.last_name LIKE '%а%';
--5.	Найти всех студентов учащихся на ФПМ очном 1 или 2 курсе, 
--отсортировать результаты по полю отчества.
SELECT * 
FROM stud 
WHERE faculty = 'ФПМ' AND form = 'очная' AND year <=2;

--6.	Найти всех студентов учащихся на ФПК заочном со средним балом успеваемости больше 6, 
--отсортировать результаты по оценки в убывающем порядке
SELECT * 
FROM stud 
WHERE form = 'заочная' AND exm > 6 ORDER BY exm DESC

--7.	Вывеси список всех преподавателей, которые работают на ФПК (не зависимо от формы обучения) 
--отсортировать по алфавиту фамилии в пределах каждой формы обучения

SELECT * 
FROM teach 
WHERE faculty = 'ФПК' ORDER BY form, last_name

--8.	Вывести список всех преподавателей, которые работают на ФПМ, первом курсе и 
--читают дисциплины более 100 часов.
SELECT * 
FROM teach 
WHERE faculty = 'ФПМ' AND year = '1' AND hours > 100;

--9.	Вывести список преподавателей иностранцев, 
--работающих в университете более трех лет на текущий момент

SELECT DISTINCT * 
FROM teach 
WHERE s_name is NULL AND DATEDIFF(YEAR, start_work_date, '2022-03-01') > 3;

--10.	Вывести информацию о дисциплинах, читаемых для студентов третьего курса ФПМ

SELECT subj, faculty, year 
FROM teach 
WHERE year='3' AND faculty = 'ФПМ'

--11.	Вывести информацию о дисциплинах (курс, форма обучения, Фио преподавателя), 
--читаемых на ФПК, число часов по которым больше 100.

SELECT year, form, last_name, f_name, s_name 
FROM teach 
WHERE faculty ='ФПК' AND hours > 100;

--12.	Вывести информацию о дисциплинах (факультет, курс, форма обучения, Фио преподавателя), 
--которые ведут преподаватели иностранцы.

SELECT subj, year, form, last_name, f_name 
FROM teach 
WHERE s_name IS NULL

--13.	Вывести список преподавателей старше 30 лет на начало текущего года 
SELECT distinct last_name, f_name, s_name 
FROM teach 
WHERE DATEDIFF(YEAR, br_date, '2022-03-01') > 30

--14.	Вывести список преподавателей, от 35 до 40 лет на настоящий момент, 
--отсортировать их по алфавиту фамилии.

SELECT Distinct last_name, f_name, s_name 
FROM teach 
WHERE DATEDIFF(YEAR, br_date, '2022-03-01') BETWEEN 35 AND 40 
ORDER BY last_name ASC

--15.	 Вывести список преподавателей, день рождения у которых в октябре, 
--Вывести в порядке возрастания даты рождения.
SELECT DISTINCT last_name, f_name, s_name
FROM teach
WHERE DATEPART(month, br_date ) = 10
ORDER BY last_name ASC

