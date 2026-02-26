USE [FLY SAFE Airways]
GO
IF OBJECT_ID(N'Airlines_Master',N'U') IS NULL
BEGIN
    create table [Airlines_Master]
    (
        Aircode char(2),
        Airline_Name VARCHAR(15)
    );
End;

IF OBJECT_ID(N'Category_Master',N'U') IS NULL
BEGIN
    CREATE TABLE Category_Master(
        Category_Code char(2),
        [Description] VARCHAR(15)
    );
END;

IF OBJECT_ID(N'Class_Master',N'U') IS NULL
BEGIN
    CREATE TABLE Class_Master(
        Class_Code CHAR(3),
        Class_Name varchar(15)
    );
END;

IF OBJECT_ID(N'City_Master',N'U') IS NULL
BEGIN
    CREATE TABLE City_Master(
        City_Code VARCHAR(5),
        City_Name VARCHAR(15),
        City_Country VARCHAR(15)
    );
End;

IF Object_id(N'Day_Master',N'U') is NULL
BEGIN
    CREATE TABLE Day_Master(
        Day_Code int,
        Day_Name VARCHAR(12)
    );
End;

IF object_id(N'Meal',N'U') is NULL
BEGIN
    CREATE TABLE Meal(
        Meal_Code VARCHAR,
        Meal_Name VARCHAR
    
    );
END;

IF object_id(N'Service',N'U') is NULL
BEGIN
    CREATE TABLE Service(
        Service_Code VARCHAR,
        Service_Name VARCHAR
    )
END;

IF object_id(N'Status_Master',N'U') is NULL
BEGIN
    CREATE TABLE Status_Master(
        Status_Code VARCHAR, 
        DESCRIPTION VARCHAR
    );
END;

IF OBJECT_ID(N'Airlines_Service',N'U') is NULL
BEGIN
    CREATE TABLE Airlines_Service(
        Aircode char(2),
        Service_Code VARCHAR(3)
    );
 END;   

 IF OBJECT_ID(N'Airline_Name',N'U') IS NULL
 BEGIN
   CREATE TABLE Airline_Name(
    Aircode char(2),
    Meal_Code VARCHAR(5)
   );
END;

if OBJECT_ID(N'Flight',N'U') is NULL
BEGIN
    CREATE TABLE Flight(
        Aircraft_code VARCHAR,
        Aircode char,
        [Type] VARCHAR,
        Destination VARCHAR,
        Category VARCHAR,
        Dep_time VARCHAR,
        Journey_hrs int
    )
End;

if object_id(N'Flight_Days',N'U') is NULL
BEGIN
  CREATE table Flight_Days(
    Aircraft_code VARCHAR,
    Day_Code int
  )
End;

IF OBJECT_ID(N'Flight_Details',N'U') is NULL
BEGIN
    CREATE TABLE Flight_Details
    (
        Aircraft_code VARCHAR,
        Class_Code CHAR,
        Fare NUMERIC,
        Seats NUMERIC
    );
End;

if object_id(N'Passenger',N'U') IS NULL
BEGIN
   CREATE TABLE Passenger(
     PNR_NO NUMERIC(9),
     Ticket_No NUMERIC(9),
     [Name] VARCHAR(15),
     Age int,
     Sex char(10),
     [PP No] VARCHAR(15),
     [Meal Pref] VARCHAR(20)
   )
END;

IF OBJECT_ID(N'Reservation',N'U') is NULL
BEGIN
    CREATE TABLE Reservation(
        PNR_NO NUMERIC(9),
        Aircraft_code VARCHAR(5),
        Journey_Date DATETIME,
        Class_Code CHAR(3),
        No_Of_Seats bigint,
        Address VARCHAR(50),
        Contact_no NUMERIC(9),
        [Status] CHAR(2)

    )
END;