use [Fly Safe Airways]
GO
/*
-- Author: ANIMASHAUN HABEEB ABIMBOLA
-- Email:  habeebimbola@yahoo.com
-- Description: Chapter 4 Exercise
*/


-- Solution: Question 4.1
--
SELECT distinct PNR_NO from dbo.Passenger;
go

--- Solution: Question 4.2
SELECT top 4 * from dbo.Passenger
GO

--- Solution: Question 4.3
SELECT * from Flight WHERE Aircraft_code = 'BA01'
GO

--- Solution: Question 4.4
SELECT PNR_NO, [PP No], [Meal Pref] from dbo.Passenger
WHERE PNR_NO = 1 or PNR_NO = 2;
GO

SELECT @@VERSION, @@PROCID, @@LANGUAGE, @@TRANCOUNT, @@ROWCOUNT, @@NESTLEVEL;
GO

--- Solution: Question 5
SELECT Name from dbo.Passenger
where Name like 'A%';
GO

---  Solution: Question 6
SELECT * from dbo.Flight 
WHERE Destination = 'NY'
ORDER BY Source ASC
GO

--- Solution: Question 7

SELECT 'Mr. '+Name from dbo.Passenger
WHERE Sex = 'M'
GO

--- Solution: Question 8
SELECT Aircraft_code AS Aircraft, Fare AS 'Regular Fare', (Fare * .25) AS 'Discounted Fare' FROM dbo.Flight_Details
WHERE Class_Code = 'FC';
GO

--- Solution: Question 9
SELECT * FROM dbo.Flight 
WHERE Destination = 'Lon'
ORDER BY Journey_hrs ASC
GO

--- Solution: Question 10
SELECT Meal_Name from dbo.Meal
WHERE Meal_Code LIKE '%NV%'
GO

--- Solution: Question 11
SELECT Status_Code, Description FROM dbo.Status_Master
Where Description Not like '%d';
GO

--- Solution: Question 12
SELECT Aircraft_Code, Day_Code FROM dbo.Flight_Days
WHERE Day_Code = 1 OR Day_Code = 4;
GO

--- Solution: Question 13
SELECT Distinct City_Country FROM City_Master
GO

--- Solution: Question 14
SELECT @@ROWCOUNT

--- Solution: Question 15
SELECT @@SERVERNAME, @@SERVICENAME;