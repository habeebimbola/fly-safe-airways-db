USE [Fly Safe Airways]
GO

/** Author: ANIMASHAUN HABEEB ABIMBOLA
**  Email: habeebimbola@yahoo.com
**  Chapter 5: Question 5
**  Using Subqueries find City name and Address
**  Of Passengers with Reservations Booked
**/

SELECT C.City_Name, R.Address FROM Reservation R, City_Master C, Flight F
       WHERE
            R.Aircraft_Code = F.Aircraft_Code AND
            C.City_Code = F.Source
GO
