
--1.	������� ����������  �� ����� (�����) ��������, 
--�� �������� �������� ���������� ���������� ����� (�� �������� �� ����������).
SELECT TOP(1) subj,form,faculty, hours 
FROM teach
WHERE hours = (SELECT  max(hours) FROM teach)

--2.	������� ������, � ������� ����� ������� ���������� � ���� ��������� 
--�� ������� ����� �������� ����� ���������� (�� �������� �� ����������).
SELECT subj,form,faculty, hours 
FROM teach 
WHERE hours = (SELECT  max(hours) FROM teach)

3.	��������� ��������� (����, �����),  �� ������� ������ ������������ ���������� 
��������� �� 35 � ������� ����

SELECT TOP(1) faculty, COUNT(*) as Number 
FROM stud 
WHERE (YEAR(getdate()) - 1 - YEAR(br_date)) < 35 
GROUP BY faculty
ORDER BY count(*) DESC


--4.	���������� ���������, �� ������� ������ ������������ ����� �������������� ������� ��� ���������

SELECT TOP(1) faculty, COUNT(*) 
FROM stud 
WHERE year='1' and (form='�����' OR form='�������')
GROUP BY faculty 
ORDER BY count(*) DESC


--5.	���������� ��������� � ����������� ������ ��������� �� ������� ����� ��������
SELECT TOP(1) faculty,form, COUNT(*) as MinNumber 
FROM stud 
WHERE form='�������' 
GROUP BY faculty,form
ORDER BY count(*) ASC


--6.	������� ���������� � ����� ���������� �������� ������������.

SELECT last_name, f_name, faculty,year, exm 
FROM stud 
WHERE exm = (SELECT max(exm) from stud)


--7.	������� ���������� � ����� ���������� �������� ������������.
SELECT TOP(3) with ties  last_name, f_name, faculty,year, exm 
FROM stud 
ORDER BY exm DESC

--8.	������� ������ ��������� ������� ������ ������� �� 20% ������ ������������ �� ������������ (���������)

SELECT last_name, f_name, faculty,year,exm 
FROM stud 
WHERE exm < ((SELECT MAX(exm) FROM stud) - (SELECT MAX(exm) FROM stud) * 0.2)

--9.	������� ������ ��������� ������� ������ �������, ����� ������������ �� ������������ (���������)

SELECT last_name, f_name, faculty,year,exm 
FROM stud
WHERE exm=(SELECT MAX(exm) FROM stud)

--10.	������� ������ ������� ���������, ������� ������ �� ����� �������������� ����������(���������)
SELECT last_name, f_name, faculty FROM stud WHERE faculty = (SELECT TOP(1)  faculty 
FROM stud 
GROUP BY faculty
ORDER BY count(distinct last_name) DESC)


--11.	������� ������ ���� �������� � ������������ 
SELECT DISTINCT form 
FROM stud

--12.	���������� ������� �������� ����������� �  ����� ��������� � ������������*

SELECT convert(float,(SELECT COUNT(*) 
FROM stud 
WHERE s_name IS NULL) * 100 / (SELECT COUNT(distinct last_name) FROM stud))




