
--1.	����� ������� ���������(����!!), ������� �������� ������ ������������� � ������������

SELECT stud.last_name, stud.f_name, stud.exm
FROM stud 
WHERE exm = (select min(exm) FROM stud)

--OR

SELECT stud.last_name, stud.f_name, stud.exm, faculty.faculty_name
FROM stud 
JOIN process on process.stud_id = stud.id
JOIN hours on hours.id = process.hours_id
JOIN faculty on faculty.id = hours.faculty_id
JOIN(select min(exm) as min_exm FROM stud) tmp on stud.exm=tmp.min_exm


--2.	����� ���� ���������, ������� ������ �� ����� ���������� � ����� �� ��������� �����.

SELECT stud.last_name, faculty.faculty_name, hours.course
FROM stud
JOIN process on process.stud_id = stud.id
JOIN hours on hours.id = process.hours_id
JOIN faculty on faculty.id = hours.faculty_id
JOIN (SELECT faculty_name, course
FROM stud 
JOIN process on process.stud_id = stud.id
JOIN hours on hours.id = process.hours_id
JOIN faculty on faculty.id = hours.faculty_id
WHERE last_name='�����') tmp on hours.course = tmp.course and faculty.faculty_name = tmp.faculty_name 

--3.	����� ���������, ������� ������ ����� �������� ������������ �� ��� ����������

SELECT stud.last_name, stud.f_name, stud.exm, faculty.faculty_name
FROM stud
JOIN process on process.stud_id = stud.id
JOIN hours on hours.id = process.hours_id
JOIN faculty on faculty.id = hours.faculty_id
JOIN (SELECT stud.exm, faculty.faculty_name
FROM stud
JOIN process on process.stud_id = stud.id
JOIN hours on hours.id = process.hours_id
JOIN faculty on faculty.id = hours.faculty_id
WHERE stud.last_name='�����������') tmp on stud.exm > tmp.exm and faculty.faculty_name = tmp.faculty_name 

--4.	����� ���� ���������, ������� ������ ���� �������� �� ����� ����������

SELECT stud.id, stud.last_name, faculty.faculty_name, stud.exm 
FROM stud 
JOIN process on process.stud_id = stud.id
JOIN hours on hours.id = process.hours_id
JOIN faculty on faculty.id = hours.faculty_id
JOIN (select faculty.faculty_name, AVG(stud.exm) AS avg_exm from stud 
		JOIN process on process.stud_id = stud.id
		JOIN hours on hours.id = process.hours_id
		JOIN faculty on faculty.id = hours.faculty_id
		GROUP BY faculty.faculty_name) tmp on stud.exm < tmp.avg_exm and faculty.faculty_name = tmp.faculty_name

--5.	����� ���� ���������, ������� ������ �� ���������� ����� � ������������ (��������� �����������)

SELECT stud.last_name, stud.f_name, stud.s_name, faculty.faculty_name 
FROM stud 
JOIN process on stud.id = process.stud_id 
JOIN hours on hours.id = process.hours_id
JOIN faculty on faculty.id = hours.faculty_id
WHERE s_name IS NOT NULL
GROUP BY faculty.faculty_name, stud.last_name, stud.f_name, stud.s_name



--6. ����� ���������, ������� ������ �������� ����� �� ���� �������� � ������ � ��� �� ����� ����������

SELECT stud.last_name, stud.f_name, stud.br_date, faculty.faculty_name
FROM stud
JOIN process on process.stud_id = stud.id
JOIN hours on hours.id = process.hours_id
JOIN faculty on faculty.id = hours.faculty_id
JOIN (SELECT stud.br_date, faculty.faculty_name
FROM stud
JOIN process on process.stud_id = stud.id
JOIN hours on hours.id = process.hours_id
JOIN faculty on faculty.id = hours.faculty_id
WHERE stud.last_name='�����') tmp on stud.br_date < tmp.br_date and faculty.faculty_name = tmp.faculty_name 



--7. ����� ������� ���������, ������� �������� ������ ����������� �� ����� ����������

SELECT stud.last_name,stud.f_name, faculty.faculty_name, stud.exm 
FROM stud 
JOIN process on process.stud_id = stud.id
JOIN hours on hours.id = process.hours_id
JOIN faculty on faculty.id = hours.faculty_id
JOIN (SELECT faculty.faculty_name, MAX(stud.exm) AS max_exm from stud 
		JOIN process on process.stud_id = stud.id
		JOIN hours on hours.id = process.hours_id
		JOIN faculty on faculty.id = hours.faculty_id
		GROUP BY faculty.faculty_name) tmp on stud.exm = tmp.max_exm and faculty.faculty_name = tmp.faculty_name
			   		 	
						
--8. ����� ������� ���������, ������� �������� ������ ������������� �� ����� �����

SELECT stud.last_name,stud.f_name, hours.course, stud.exm 
FROM stud 
JOIN process on process.stud_id = stud.id
JOIN hours on hours.id = process.hours_id
JOIN (SELECT hours.course, MIN(stud.exm) AS min_exm FROM stud 
		JOIN process on process.stud_id = stud.id
		JOIN hours on hours.id = process.hours_id
		GROUP BY hours.course) tmp on stud.exm = tmp.min_exm and hours.course = tmp.course