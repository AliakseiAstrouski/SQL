
CREATE DATABASE MyDB

GO
USE MyDB
--1) Создайте следующие таблицы
		--a) таблица STUDENTS  содержащая поля
				--- идентификатор студента
				--- имя
				---фамилию
				---отчество
				---идентификатор группы
				--- дату рождения
				---поле идентификатора студента должно быть первичным ключом в таблице


CREATE TABLE STUDENTS (
	IDStudent INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(30),
	LastName NVARCHAR(30),
	MiddleName NVARCHAR(30),
	IDGroup INT,
	Birtrhay DATE,
)

		--b)	Таблица GROUPS содержащая поля
				--- идентификатор группы
				--- номер группы
				--- курс
				--- поле идентификатора группы должно быть первичным ключом в таблице

CREATE TABLE GROUPS (
	IDGroup INT PRIMARY KEY IDENTITY,
	NumberGroup NVARCHAR(30),
	Course INT
)
		--c) Таблица PLANS содержащая поля
				--- идентификатор группы
				--- идентификатор предмета
				--- все поля образуют первичный ключ
CREATE TABLE PLANS (
	IDGroup INT,
	IDSubject INT,
	PRIMARY KEY(IDGroup, IDSubject)
)

		--d) Таблица SUBJECTS содержащая поля
				--- идентификатор предмета
				--- наименование предмета
				--- количество часов по предмету
				---поле идентификатора предмета должно быть первичным ключом в таблице

CREATE TABLE SUBJECTS (
	IDSubject INT PRIMARY KEY IDENTITY,
	NameOfSubject NVARCHAR(30),
	NumberOfHours INT
	)

--	2. Измените таблицы, создав связи между ними
				--- STUDENTS. идентификатор группы -- GROUPS.идентификатор группы
				--- PLANS.идентификатор предмета -- SUBJECTS.идентификатор предмета
				--- PLANS.идентификатор группы -- GROUPS.идентификатор группы


ALTER TABLE STUDENTS add CONSTRAINT FK_St foreign key (IDGroup) references GROUPS(IDGroup);

ALTER TABLE PLANS add CONSTRAINT FK_St1 foreign key (IDSubject) references SUBJECTS(IDSubject);

ALTER TABLE PLANS add CONSTRAINT FK_St2 foreign key (IDGroup) references GROUPS(IDGroup);


--3) Заполнить таблицы согласно данным Таблицы 1.1 и Таблицы 1.2
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


--4) В таблице STUDENTS внесите изменения таким образом, чтобы все студенты учащиеся в группе ПО135 числились в группе 134.
UPDATE STUDENTS SET NumberGroup=134 where NumberGroup=PO135;

--5) Из таблицы групп удалите запись о группе по 135

DELETE FROM GROUPS WHERE NumberGroup='PO135'

--6) в таблице SUBJECTS увеличьте количество часов на 30 для предметов   
--Средства визуального программирования, Объектно-ориентированное программирование

UPDATE SUBJECTS SET NumberOfHours = NumberOfHours + 30 WHERE NameOfSubject='Object Oriented Programming' OR NameOfSubject='Visual programming tools'

--7) в таблицу SUBJECTS добавьте столбец, в который будут внесены данные для формы контроля по 
--предметам (по всем предметам сдаются экзамены, кроме " Основы алгоритмизации " -зачет). 
--Обновите таблицу SUBJECTS с учетом форм контроля по предметам.

ALTER TABLE SUBJECTS ADD FormControl NVARCHAR(30) NULL;
UPDATE SUBJECTS SET FormControl = 'exam' WHERE NameOfSubject != 'Fundamentals of algorithm'
UPDATE SUBJECTS SET FormControl = 'offset' WHERE NameOfSubject = 'Fundamentals of algorithm'
--8) Из таблицы STUDENTS удалите столбец с данными отчества.

ALTER TABLE STUDENTS DROP COLUMN MiddleName

В ходе выполнения заданий у меня возник ряд вопросов:
	1) Пункт 2. Я не уверен, что команда написана правильно, т.к. запрос SELECT * FROM "таблица" 
	не выдает данные связанные внешним колючом.  И как проверить, что связь foreign key работает?
	2) Можно ли одновременно заполнять  одним INSERTом связанные таблицы при условии,
	что данные вносятся в разные таблицы. Как в пункте 3, нужно внести данные из таблицы 1.1 сразу в
	2 таблицы одновременно, которые связаны foreign key или нужно вносить все по отдельности?

	СПАСИБО)