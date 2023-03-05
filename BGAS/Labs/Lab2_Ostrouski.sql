--������������ �2

--1.	������� ������� ���������, � ������� ������������ ����� "�" �/���
--"�" � ����� ����������� � �������
SELECT stud.last_name 
FROM stud 
WHERE stud.last_name LIKE '%�%' OR stud.last_name LIKE '%�%'

--2.	������� �������� �  ���������, ������� ������� ���������� � ����� �,
--��� ���� ��� �������� ������������ (NULL � ���� ��������) 	

SELECT * 
FROM stud 
WHERE stud.last_name 
LIKE '�%' AND s_name IS NULL

--3.	������� �������� �  ���������, ������� ������� �������� 8 �������� � ����� 

SELECT * 
FROM stud 
WHERE LEN(stud.last_name) >= 8;

--4.	������� �������� �  ���������, ������� ������� �������� ��� ������,
--��� ������ ���� �������� (�� �� ����� ���� ��������), ��� ���� ���� �� ���� ������� 'a'

SELECT * 
FROM stud 
WHERE LEN(stud.last_name) != 7 AND stud.last_name LIKE '%�%';
--5.	����� ���� ��������� �������� �� ��� ����� 1 ��� 2 �����, 
--������������� ���������� �� ���� ��������.
SELECT * 
FROM stud 
WHERE faculty = '���' AND form = '�����' AND year <=2;

--6.	����� ���� ��������� �������� �� ��� ������� �� ������� ����� ������������ ������ 6, 
--������������� ���������� �� ������ � ��������� �������
SELECT * 
FROM stud 
WHERE form = '�������' AND exm > 6 ORDER BY exm DESC

--7.	������ ������ ���� ��������������, ������� �������� �� ��� (�� �������� �� ����� ��������) 
--������������� �� �������� ������� � �������� ������ ����� ��������

SELECT * 
FROM teach 
WHERE faculty = '���' ORDER BY form, last_name

--8.	������� ������ ���� ��������������, ������� �������� �� ���, ������ ����� � 
--������ ���������� ����� 100 �����.
SELECT * 
FROM teach 
WHERE faculty = '���' AND year = '1' AND hours > 100;

--9.	������� ������ �������������� �����������, 
--���������� � ������������ ����� ���� ��� �� ������� ������

SELECT DISTINCT * 
FROM teach 
WHERE s_name is NULL AND DATEDIFF(YEAR, start_work_date, '2022-03-01') > 3;

--10.	������� ���������� � �����������, �������� ��� ��������� �������� ����� ���

SELECT subj, faculty, year 
FROM teach 
WHERE year='3' AND faculty = '���'

--11.	������� ���������� � ����������� (����, ����� ��������, ��� �������������), 
--�������� �� ���, ����� ����� �� ������� ������ 100.

SELECT year, form, last_name, f_name, s_name 
FROM teach 
WHERE faculty ='���' AND hours > 100;

--12.	������� ���������� � ����������� (���������, ����, ����� ��������, ��� �������������), 
--������� ����� ������������� ����������.

SELECT subj, year, form, last_name, f_name 
FROM teach 
WHERE s_name IS NULL

--13.	������� ������ �������������� ������ 30 ��� �� ������ �������� ���� 
SELECT distinct last_name, f_name, s_name 
FROM teach 
WHERE DATEDIFF(YEAR, br_date, '2022-03-01') > 30

--14.	������� ������ ��������������, �� 35 �� 40 ��� �� ��������� ������, 
--������������� �� �� �������� �������.

SELECT Distinct last_name, f_name, s_name 
FROM teach 
WHERE DATEDIFF(YEAR, br_date, '2022-03-01') BETWEEN 35 AND 40 
ORDER BY last_name ASC

--15.	 ������� ������ ��������������, ���� �������� � ������� � �������, 
--������� � ������� ����������� ���� ��������.
SELECT DISTINCT last_name, f_name, s_name
FROM teach
WHERE DATEPART(month, br_date ) = 10
ORDER BY last_name ASC

