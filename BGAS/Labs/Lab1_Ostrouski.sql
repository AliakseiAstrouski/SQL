
CREATE DATABASE MyDB

GO
USE MyDB
--1) �������� ��������� �������
		--a) ������� STUDENTS  ���������� ����
				--- ������������� ��������
				--- ���
				---�������
				---��������
				---������������� ������
				--- ���� ��������
				---���� �������������� �������� ������ ���� ��������� ������ � �������


CREATE TABLE STUDENTS (
	IDStudent INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(30),
	LastName NVARCHAR(30),
	MiddleName NVARCHAR(30),
	IDGroup INT,
	Birtrhay DATE,
)

		--b)	������� GROUPS ���������� ����
				--- ������������� ������
				--- ����� ������
				--- ����
				--- ���� �������������� ������ ������ ���� ��������� ������ � �������

CREATE TABLE GROUPS (
	IDGroup INT PRIMARY KEY IDENTITY,
	NumberGroup NVARCHAR(30),
	Course INT
)
		--c) ������� PLANS ���������� ����
				--- ������������� ������
				--- ������������� ��������
				--- ��� ���� �������� ��������� ����
CREATE TABLE PLANS (
	IDGroup INT,
	IDSubject INT,
	PRIMARY KEY(IDGroup, IDSubject)
)

		--d) ������� SUBJECTS ���������� ����
				--- ������������� ��������
				--- ������������ ��������
				--- ���������� ����� �� ��������
				---���� �������������� �������� ������ ���� ��������� ������ � �������

CREATE TABLE SUBJECTS (
	IDSubject INT PRIMARY KEY IDENTITY,
	NameOfSubject NVARCHAR(30),
	NumberOfHours INT
	)

--	2. �������� �������, ������ ����� ����� ����
				--- STUDENTS. ������������� ������ -- GROUPS.������������� ������
				--- PLANS.������������� �������� -- SUBJECTS.������������� ��������
				--- PLANS.������������� ������ -- GROUPS.������������� ������


ALTER TABLE STUDENTS add CONSTRAINT FK_St foreign key (IDGroup) references GROUPS(IDGroup);

ALTER TABLE PLANS add CONSTRAINT FK_St1 foreign key (IDSubject) references SUBJECTS(IDSubject);

ALTER TABLE PLANS add CONSTRAINT FK_St2 foreign key (IDGroup) references GROUPS(IDGroup);


--3) ��������� ������� �������� ������ ������� 1.1 � ������� 1.2
INSERT INTO STUDENTS(FirstName, LastName, MiddleName, Birtrhay,IDGroup) VALUES ('Fedorebko', 'P', 'R', '1997-12-25', NULL )
INSERT INTO STUDENTS(FirstName, LastName, MiddleName, Birtrhay,IDGroup) VALUES ('Mixeenko', 'P', 'G', '1993-02-05', NULL )
INSERT INTO STUDENTS(FirstName, LastName, MiddleName, Birtrhay,IDGroup) VALUES ('Savickaya', 'N', 'V', '1987-09-22', NULL )
INSERT INTO STUDENTS(FirstName, LastName, MiddleName, Birtrhay,IDGroup) VALUES ('Kovalchuk', 'M', 'E', '1992-06-17', NULL )
INSERT INTO STUDENTS(FirstName, LastName, MiddleName, Birtrhay,IDGroup) VALUES ('Zabolotnaya', 'N', 'G', '1992-06-18', NULL )	
INSERT INTO STUDENTS(FirstName, LastName, MiddleName, Birtrhay,IDGroup) VALUES ('Charapo', 'H', NULL, '1992-06-17', NULL )

INSERT INTO GROUPS(NumberGroup, Course) VALUES ('PO135', '1');
INSERT INTO GROUPS(NumberGroup, Course) VALUES ('PO134', '1');
INSERT INTO GROUPS(NumberGroup, Course) VALUES ('PO235', '2');
INSERT INTO GROUPS(NumberGroup, Course) VALUES ('PO335', '3')

INSERT INTO SUBJECTS(NameOfSubject,NumberOfHours) VALUES ('physicist', '200')
INSERT INTO SUBJECTS(NameOfSubject,NumberOfHours) VALUES ('mathematics', '120')
INSERT INTO SUBJECTS(NameOfSubject,NumberOfHours) VALUES ('Fundamentals of algorithm', '70')
INSERT INTO SUBJECTS(NameOfSubject,NumberOfHours) VALUES ('database design', '130')
INSERT INTO SUBJECTS(NameOfSubject,NumberOfHours) VALUES ('Visual programming tools', '90')
INSERT INTO SUBJECTS(NameOfSubject,NumberOfHours) VALUES ('Object Oriented Programming', '70')


--4) � ������� STUDENTS ������� ��������� ����� �������, ����� ��� �������� �������� � ������ ��135 ��������� � ������ 134.
UPDATE STUDENTS SET NumberGroup=134 where NumberGroup=PO135;

--5) �� ������� ����� ������� ������ � ������ �� 135

DELETE FROM GROUPS WHERE NumberGroup='PO135'

--6) � ������� SUBJECTS ��������� ���������� ����� �� 30 ��� ���������   
--�������� ����������� ����������������, ��������-��������������� ����������������

UPDATE SUBJECTS SET NumberOfHours = NumberOfHours + 30 WHERE NameOfSubject='Object Oriented Programming' OR NameOfSubject='Visual programming tools'

--7) � ������� SUBJECTS �������� �������, � ������� ����� ������� ������ ��� ����� �������� �� 
--��������� (�� ���� ��������� ������� ��������, ����� " ������ �������������� " -�����). 
--�������� ������� SUBJECTS � ������ ���� �������� �� ���������.

ALTER TABLE SUBJECTS ADD FormControl NVARCHAR(30) NULL;
UPDATE SUBJECTS SET FormControl = 'exam' WHERE NameOfSubject != 'Fundamentals of algorithm'
UPDATE SUBJECTS SET FormControl = 'offset' WHERE NameOfSubject = 'Fundamentals of algorithm'
--8) �� ������� STUDENTS ������� ������� � ������� ��������.

ALTER TABLE STUDENTS DROP COLUMN MiddleName

� ���� ���������� ������� � ���� ������ ��� ��������:
	1) ����� 2. � �� ������, ��� ������� �������� ���������, �.�. ������ SELECT * FROM "�������" 
	�� ������ ������ ��������� ������� �������.  � ��� ���������, ��� ����� foreign key ��������?
	2) ����� �� ������������ ���������  ����� INSERT�� ��������� ������� ��� �������,
	��� ������ �������� � ������ �������. ��� � ������ 3, ����� ������ ������ �� ������� 1.1 ����� �
	2 ������� ������������, ������� ������� foreign key ��� ����� ������� ��� �� �����������?

	�������)