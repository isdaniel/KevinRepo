--INNER JOIN 
--CROSS JOIN
--OUTER JOIN

CREATE TABLE Person(
	Id INT,
	[Name] VARCHAR(50),
	Age INT
)

INSERT INTO Person VALUES (1,'DANIEL',26)
INSERT INTO Person VALUES (1,'Kevin',27)

CREATE TABLE Adress(
	PId INT,
	[AdressName] NVARCHAR(50)
)

INSERT INTO Adress VALUES (1,N'宜蘭縣宜蘭市海洋路20號')
INSERT INTO Adress VALUES (2,N'台北市三重街10號')
INSERT INTO Adress VALUES (3,N'TEST')

SELECT *
FROM Person p JOIN Adress a ON p.Id = a.PId
