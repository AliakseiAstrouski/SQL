
--1.	������� ���������� ��������� (���������, ����) ������� ����� �������� ������ 37 ���

SELECT stud.last_name, stud.f_name, faculty.faculty_name, hours.course 
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN form on hours.form_id = form.id
JOIN faculty on faculty.id = hours.faculty_id
WHERE (YEAR(getdate()) - 1 - YEAR(br_date)) < 37 AND form.form_name = '������'


--2.	���������� ���������� ��������� �� ������ ����������

SELECT faculty.faculty_name, COUNT(DISTINCT stud.last_name)
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
GROUP BY faculty.faculty_name


--3.	���������� ���������� ���������, �������� �� ������ ����� ��������

SELECT form.form_name, COUNT(DISTINCT stud.last_name)
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN form on hours.form_id = form.id
GROUP BY form.form_name


--4.	���������� ������� ������� ��������� ��� ������� ���������� �� ����� ���� (���)

SELECT faculty.faculty_name, AVG(YEAR(getdate()) - 1 - YEAR(br_date)) AS avg_age
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
GROUP BY faculty.faculty_name


--5.	����� ���� ���������-����������� (��� ��������), ������� �������� � ��� 
--(���� �����������, ���������, ����, ����� ��������)

SELECT stud.last_name, stud.f_name, stud.in_date, faculty.faculty_name, hours.course, form.form_name
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN form on hours.form_id = form.id
JOIN faculty on faculty.id = hours.faculty_id
WHERE stud.s_name IS NULL


--6.	����������, �� ����� ��������� ��������� ���������� ���������� ������� � 2015 ����

SELECT TOP(1)  faculty.faculty_name, COUNT(stud.in_date) AS number
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
WHERE YEAR(stud.in_date) = '2015'
GROUP BY faculty.faculty_name
ORDER BY number DESC


--7.	���������� ����� ��������� ����������� �� ������ ��������� � ����� �������� � 2014 ���� 

SELECT faculty.faculty_name, form.form_name, COUNT(DISTINCT stud.last_name) AS number
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
JOIN form on hours.form_id = form.id
WHERE YEAR(stud.in_date) = '2014'
GROUP BY faculty.faculty_name, form.form_name


--8.	������� ������ ���� �����������, �� ������� �������� ������� ����� ��������. 

SELECT DISTINCT faculty.faculty_name, form.form_name
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
JOIN form on hours.form_id = form.id
WHERE form.form_name = '������'


--9.	������� ������ �����������, ��� ������� ���������� ������� ������ ���� �������� � ������ ������, (*) 

SELECT faculty.faculty_name, hours.course, form.form_name
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
JOIN form on hours.form_id = form.id
GROUP BY faculty.faculty_name, hours.course, form.form_name


--10.	������� ������ �����������, � ��������� ����� ��������� ����������� �� ������ ����� ��������(*)

SELECT faculty.faculty_name, form.form_name, COUNT(DISTINCT stud.last_name) as number
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
JOIN form on hours.form_id = form.id
GROUP BY faculty.faculty_name, form.form_name

--11.	������� ����� ���� ��������� ������� � �������� ������ ��� ���� ����������� � ����(*)

SELECT faculty.faculty_name, form.form_name COUNT(DISTINCT stud.last_name) as number
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
JOIN form on hours.form_id = form.id
WHERE hours.course='1' or hours.course='3'
GROUP BY faculty.faculty_name, form.form_name


--12.	��� ���� ����������� � ������ ����� ����� �����������, ������� �� ��� ������(*)

SELECT faculty.faculty_name, hours.course, COUNT(DISTINCT stud.last_name) as number
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
WHERE stud.s_name is NULL
GROUP BY faculty.faculty_name, hours.course


--13.	��� ������� ����� � ������ ���������� ����� ���������� ���������, ������� ���� ������� ������ 7,5(*)

SELECT faculty.faculty_name, hours.course, COUNT(DISTINCT stud.last_name) as number
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
WHERE stud.exm > 7.5
GROUP BY  faculty.faculty_name, hours.course

--14.	������� ������ ����������� � ������ ����� � ��������� �����  ��������� ������ 45(*)

SELECT faculty.faculty_name, form.form_name, COUNT(DISTINCT stud.last_name) as number
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
JOIN form on hours.form_id = form.id
WHERE YEAR(getdate()) - 1 - YEAR(br_date) > 45
GROUP BY  faculty.faculty_name, form.form_name

--15.	������� ���������� ��� ������� ����������, �����, ����� � ���������� ��������� ������ 27(*)

SELECT faculty.faculty_name, form.form_name, hours.course, COUNT(DISTINCT stud.last_name) as number
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
JOIN form on hours.form_id = form.id
WHERE YEAR(getdate()) - 1 - YEAR(br_date) < 27
GROUP BY  faculty.faculty_name, form.form_name, hours.course


--16.	���������� ������� ��������� � ���������  �� C �� ������ ���������� (*)

SELECT faculty.faculty_name, COUNT(DISTINCT stud.last_name) as number
FROM stud
JOIN process on stud.id = process.stud_id
JOIN hours on process.hours_id = hours.id
JOIN faculty on faculty.id = hours.faculty_id
WHERE stud.last_name LIKE '�%'
GROUP BY faculty.faculty_name








