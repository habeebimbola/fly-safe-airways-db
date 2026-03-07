USE [Fly Safe Airways];
GO
/*---
Author: ANIMASHAUN HABEEB ABIMBOLA
Email:  habeebimbola@yahoo.com
Solution Description: Increase Fare prices by 15percent for Aircraft_code : IC01
---*/
--Solution: Question A
UPDATE dbo.Flight_Details
SET Fare = Fare + (Fare * .15)
WHERE Aircraft_code = 'IC01';
GO

-- Solution: Question B
DELETE From dbo.Airline_Meal
WHERE Aircode = 'AI' And Meal_Code = 'CONV';
GO

-- Solution: Question C
Exec SP_Help 'dbo.Reservation'
GO

-- Solution: Question D
Alter table dbo.Flight
drop column [Type]
GO

-- Solution: Question E
DROP TABLE dbo.Status_Master;
GO

--- Solution: Question G
UPDATE  dbo.Passenger
SET Sex = 'M' WHERE Sex = 'Male';
GO

UPDATE dbo.Passenger
SET Sex = 'F' WHERE Sex = 'Female';
GO

ALTER TABLE dbo.Passenger
ALTER COLUMN Sex VARCHAR(1);
GO