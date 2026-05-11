use [Fly Safe Airways]
GO

/*
** Solution: Question 8.1
** Descriptive Text Joining 'Ticket No' with 'Age' Of Passenger
*/

SELECT 'The Passenger on Ticket Number: '
        +convert(varchar(10), Ticket_No)+
        ' is '+convert(varchar(5),Age)+' yrs Old' 
    FROM Passenger
GO

/*
** Solution: Question 8.2
** Month Of Travel For Passenger 'Alex Lee'
*/

SELECT DATENAME(mm, Journey_Date) FROM Reservation
        Where PNR_NO = (
                        SELECT PNR_NO FROM Passenger 
                                WHERE [Name] ='Alex Lee'
                       )
GO

/*
** Solution: Question 8.3
** Postponement of Travel Date by '1 Week'
*/

SELECT  DATEADD(WEEK,1, Journey_Date) 'New Travel Date', 
        Journey_Date 'Current Travel Date' FROM Reservation
        WHERE PNR_No = (SELECT PNR_NO FROM Passenger WHERE Ticket_No = 2)
GO

/*
** Solution: Question 8.4
** Smallest Number Greater Than Age Number Seats On All Flights
*/
SELECT CEILING(AVG(Seats)) 'Smallest Number Greater Than Avg Seat Count',
       AVG(Seats) FROM Flight_Details
GO

/*
** Solution: Question 8.5
** Total 'British Airways' Flight Exponentiated By Current Power
*/

SELECT  COUNT(*) 'Total British Airways Flight', 
        POWER(COUNT(*),count(*))  'Exponentiated Flights Count' 
        FROM Flight
        WHERE Aircode = 'BA'
GO    

/**
** Solution: Question 8.6
** Position Of "Air" in Names of Airlines
*/

SELECT Airline_Name 'Airline Name', 
       CHARINDEX('Air', Airline_Name) 'Position Of "Air"' 
       FROM Airlines_Master
GO

/*
** Solution: Question 8.7
** List 'First Names' Of Passengers
*/

SELECT [Name], 
        SUBSTRING([Name], 0, CHARINDEX(' ', [name])) 'First Names' 
        From Passenger
GO

/*
** Solution: Question 8.8
** Workstation Name
*/

SELECT HOST_NAME() 'Workstation Name'
GO

/*
** Solution: Question 8.9
** [Fly Safe Airways] Identification Number
*/

SELECT DB_ID('Fly Safe Airways') 'Identification Number For Fly Safe Airways'
GO

/*
** Solution: Question 8.10
** Description Of Class, No_of_Seats and Journey_Seats 
** For PNR_No '4'
*/

SELECT R.Journey_Date, R.No_Of_Seats, C.Class_Name FROM Reservation R
       INNER JOIN Class_Master C ON R.Class_Code = C.Class_Code
       WHERE PNR_NO = 4
GO       

/*
** Solution: Question 8.11
**
*/
SELECT R.PNR_NO, S.DESCRIPTION FROM Reservation R
        RIGHT OUTER JOIN Status_Master S
        ON R.[Status] = S.Status_Code
GO        

/*
** Solution: Question 8.12
** Names Of Meals Not Booked By Any Passenger
*/
SELECT M.Meal_Name 'Unbooked Meal Names' FROM Meal M
       WHERE M.Meal_Code NOT IN ( SELECT P.[Meal Pref] FROM Passenger P 
                                        LEFT OUTER JOIN Meal ON M.Meal_Code = P.[Meal Pref]
                                )
GO   

/*
** Solution: Question 8.13
** Total Journey Hours, Total Flights Per Aircraft
*/

SELECT F.Aircraft_Code, 
      SUM(F.Journey_hrs) 'Total Hours', 
      COUNT(FD.Day_Code) 'Total Flights' FROM Flight F
      INNER JOIN Flight_Days FD ON F.Aircraft_code = FD.Aircraft_code
      GROUP BY F.Aircraft_code
GO       

/*
** Solution: Question 8.14
** 'Frequent Flier Discount' For Passenger 'Peter Jones'
*/
SELECT R.PNR_NO,(FD.Fare - (FD.Fare *.17)) 'Frequent Flier Discount',R.Aircraft_code FROM Flight_Details FD
        INNER JOIN Reservation R ON FD.Aircraft_code = R.Aircraft_code
        WHERE R.PNR_NO = (
                            SELECT PNR_NO FROM Passenger P WHERE Name ='Peter Jones'
                         )
GO

/*
** Solution: Question 8.15
** Total Flights Per Destination Country
*/
SELECT  'There are '+CONVERT(char(2),COUNT(C.City_Country))+
        'Total Flights to '+C.City_Country 'Total Flights Per Country' FROM
        Flight F Join City_Master C ON F.Destination = C.City_Code
        GROUP BY C.City_Country
GO        

SELECT  HOST_ID(),
        HOST_NAME(), 
        USER_NAME( USER_ID()), 
        USER_ID(),
        DB_ID('Fly Safe Airways'),
        DB_NAME(DB_ID('Fly Safe Airways')),
        SUSER_NAME(), 
        SUSER_SNAME(),
        @@SERVERNAME, 
        @@SERVICENAME,
        @@TRANCOUNT,
        @@ROWCOUNT,
        @@PROCID

