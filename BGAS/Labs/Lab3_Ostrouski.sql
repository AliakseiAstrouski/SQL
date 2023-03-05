
--1.	���������� ������� �������� ������� ������ (�� �������� ������� � �������) 
--�� �������� ��� ��������� ������� ����� �������� ������� ����������.
SELECT faculty, AVG(exm) as Average 
FROM stud 
WHERE form = '�������' 
GROUP BY faculty

--2.	����� �������� ������������ ������� ������ ��� ������� ���������� � ������ �����
SELECT faculty, MAX(exm) as MaxPoint 
FROM stud 
GROUP BY faculty

--3.	���������� ������ �����������, ������� �������� ������� ������ ������������ 
--�� ������� ������ 7
SELECT faculty, AVG(exm) as Average 
FROM stud  
GROUP BY faculty 
HAVING AVG(exm) > 7

--4.	���������� ������ ������ � ��������� ���������� � ����� ��������, 
--������� ���� ������������ �� ������� ������ 7.5
SELECT year, faculty, form, AVG(exm) as Average
FROM stud GROUP BY year, faculty, form 
HAVING AVG(exm) > 7.5

--5.	���������� ����������� �������� ������� ������ ������������ 
--�� ������ ���������� � ��������� � �����
SELECT faculty, year, MIN(exm) 
FROM stud 
GROUP BY faculty, year 

--6.	���������� �������� ����������� � ��������� � ����� ����������� �������� 
--������� ������ ������������, ��� ������� ������ 6 
SELECT faculty, MIN(exm) as Min, AVG(exm) as Average 
FROM stud 
GROUP BY faculty 
HAVING AVG(exm) > 6;


--7.	 ����������, ����� ���������� ����� ���� ������� ��� 3-�� ����� ������� ����� �������� 
--������ �� ��������������� ����������
SELECT DISTINCT all_h 
FROM stud 
WHERE faculty = '���'AND year = '3' AND form = '�������';


--8.	������� ������ �����������, ������, ���� ��������, ����� �� ������� �������   ������  
--����� 150 ����� �� ��������������� ����������
SELECT DISTINCT faculty, year, form 
FROM stud 
WHERE (all_h + inclass_h) > 150


--9.	������� ���������� ���������, �������� ������ ��������������
SELECT last_name, f_name, s_name, count(distinct subj)as NumberOfItems 
FROM teach 
GROUP BY last_name, f_name, s_name;

--10.	������� ���������� ��������������, ���������� �� ������ ����������
SELECT faculty, count(distinct last_name) 
FROM teach 
GROUP BY faculty


--11.	������� ������ ��������� � ��������� ����� ����� ���������� ������������ ��� ������� ��������
SELECT DISTINCT subj, MAX(hours) as MaxHours 
FROM teach 
GROUP BY subj


--12.	������� ������ ��������������, �������� ����� ������ ��������.
SELECT last_name, count(distinct subj) as NumberOfSubj
FROM teach GROUP BY last_name 
HAVING count(distinct subj) > 1


--13.	������� ���������� ���������, �������� �� ������ ���������� ��  ������ �����; 
SELECT faculty, count(distinct subj) 
FROM teach
WHERE year = '2' 
GROUP BY faculty


--14.	������� ����������  ���������, �������� �� ������ ���������� ��������������� ������������
SELECT faculty, count(distinct subj) as NumberOfSubj 
FROM teach 
WHERE s_name IS NULL 
GROUP BY faculty

