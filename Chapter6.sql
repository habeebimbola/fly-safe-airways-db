/**
** APTECH SQL Server 2000 Book
** Solution to Chapter 6 Exercises
** Date: 8th May 2026
** Author: HABEEB ABIMBOLA ANIMASHAUN
** email: habeebimbola@yahoo.com
*/

-- Switch To [Fly Safe Airways] Database
USE [Fly Safe Airways]
GO

/** Question 1:
**. Display Meals And Services Offered using UNION statement
**/


SELECT Aircode, Service_Code 'Meals And Services' FROM Airlines_Service
    UNION 
SELECT Aircode, Meal_Code FROM Airline_Meal
GO


/*
** Question 2: 
** Display Meal names of From 'British Airways' Flight
*/

SELECT Meal_Name FROM Meal
      WHERE Meal_Code IN( SELECT Meal_code from Airline_Meal 
                        WHERE Aircode = (SELECT Aircode FROM Airlines_Master
                                            WHERE Airline_Name ='British Airways')
                        )
GO  

/*
** Question: 3
** Names of Airlines That Fly From 'Mumbai'
*/
SELECT Airline_Name FROM Airlines_Master 
     WHERE Aircode IN (SELECT Aircode FROM Flight 
            WHERE Source = ( SELECT City_Code FROM City_Master WHERE City_Name = 'Mumbai'
                           )
                      )
/*
** Question: 4
** Average Age Of Female Passengers.
**/                      

SELECT AVG(Age) FROM Passenger WHERE Sex = 'F' OR Sex ='Female'
GO
/*
** Question: 5
** Total number Passengers with booked flights.
*/

SELECT COUNT(*) FROM Reservation;
GO

/*
** Question: 6
** Minimum, Maximum and Average Duration of Flights to 'New York'
*/

SELECT MIN(Journey_hrs) 'Minimum Duration', Max(Journey_hrs) 'Maximum Duration', AVG(Journey_hrs) 'Average Duration' FROM Flight
    WHERE Destination = 'NY'
GO

/*
** Question: 7
** Maximum Per Aircraft For 'Economy' Class
*/

SELECT Aircraft_code, MAX(Seats) FROM Flight_Details
       WHERE Class_Code = 'E'
       GROUP BY Aircraft_code
       ORDER BY Aircraft_code DESC 
GO    

/*
** Question: 8
** PNR_No Distribution - Occurrence Count of PNR_NOs
*
*/
SELECT PNR_No, Count(Ticket_No) 'Frequency' FROM Passenger 
        GROUP BY PNR_NO
GO

/*
**
** Question: 9
** Frequency Of Flights per Week
*/
SELECT Aircraft_Code, Count(day_code) 'Frequency' FROM Flight_Days
       GROUP BY Aircraft_code
GO       

/*
** Question: 10
** Aircrafts with Total Seats greater than 500
*/

SELECT Aircraft_Code, SUM(seats) 'Seats Count' FROM Flight_Details
        GROUP BY Aircraft_code
            HAVING SUM(Seats) > 500
GO  

/*
** Question: 11
** Eldest Passenger From Each PNR_NO - Age Must Be Less Than 35
*/

SELECT PNR_No, MAX(Age) FROM Passenger
       GROUP BY PNR_NO 
         HAVING MAX(Age) < 35
         ORDER BY PNR_NO
GO    

/*
** Question: 12
** Count - Frequency, of Non-Vegetarian Meals By Each Airline
*/

SELECT Aircode, count(Meal_Code) 'Non Vegetarian Meals Count' FROM Airline_Meal
       WHERE Meal_Code LIKE '%NV' 
            GROUP BY Aircode 
GO        

/*
** Question: 13
** Total Count Of PNR_NOs Where Passenger Age is Greater Than 40 Years 
*/

SELECT PNR_NO, COUNT(pnr_no) 'Count OF PNR_NO Where Age Greater Than 40' FROM Passenger
        WHERE Age > 40
        GROUP BY PNR_NO
GO           

/*
** Question: 13
** Total PNR_NO Categorization, Age Greater Than 40 is IGNORED
*/

SELECT PNR_NO, COUNT(PNR_No) 'PNR_NO Categorization Age > 40 Ignored' FROM Passenger
     WHERE Age > 40
        GROUP BY ALL PNR_NO
GO

/*
** Question: 14
** Total Flights On Each Airline, Total Flights Per Destination Per Airline,
** Total Flights Booked For 'Fly Safe Airways'
*/

SELECT Aircode, Destination, COUNT(Destination) 'Total Flights Booked Per Airline, Total Flights Booked For Fly Safe Services' FROM Flight
        GROUP BY Aircode, Destination WITH ROLLUP
GO        

/*
** Question: 15
** Total Meals Booked By All Passengers, Total Meal Booked Per [Meal Pref] Per Sex
*/

SELECT Sex, [Meal Pref], COUNT(Sex) 'Meal Prefs Per Sex And Total Meals Booked' FROM Passenger
        GROUP BY Sex, [Meal Pref] WITH CUBE 
GO        

/*
** Question: 16
** Expected Total Revenue For The Airline,
** Expected Revenue Per Airline, Per Class
*/

SELECT Aircraft_Code, Class_code, SUM(Fare) 'Expected Total Airline Revenue, Revenue Per Airline Per Class' FROM Flight_Details
        GROUP BY Aircraft_code, Class_Code WITH ROLLUP
GO        




