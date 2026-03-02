Use master
GO

IF db_name(db_id(N'Fly Safe Airways')) is NULL
BEGIN
    CREATE DATABASE [Fly Safe Airways]
End;
GO
USE [Fly Safe Airways]
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
        Meal_Code VARCHAR(20),
        Meal_Name VARCHAR(50)
    
    );
END;

IF object_id(N'Service',N'U') is NULL
BEGIN
    CREATE TABLE Service(
        Service_Code VARCHAR(20),
        Service_Name VARCHAR(50)
    )
END;

IF object_id(N'Status_Master',N'U') is NULL
BEGIN
    CREATE TABLE Status_Master(
        Status_Code VARCHAR(20), 
        DESCRIPTION VARCHAR(50)
    );
END;

IF OBJECT_ID(N'Airlines_Service',N'U') is NULL
BEGIN
    CREATE TABLE Airlines_Service(
        Aircode char(2),
        Service_Code VARCHAR(3)
    );
 END;   

 IF OBJECT_ID(N'Airline_Meal',N'U') IS NULL
 BEGIN
   CREATE TABLE Airline_Meal(
    Aircode char(2),
    Meal_Code VARCHAR(5)
   );
END;

if OBJECT_ID(N'Flight',N'U') is NULL
BEGIN
    CREATE TABLE Flight(
        Aircraft_code VARCHAR(10),
        Aircode char(10),
        [Type] VARCHAR(50),
        [Source] VARCHAR(50),
        Destination VARCHAR(50),
        Category VARCHAR(20),
        Dep_time VARCHAR(30),
        Journey_hrs int
    )
End;

if object_id(N'Flight_Days',N'U') is NULL
BEGIN
  CREATE table Flight_Days(
    Aircraft_code VARCHAR(20),
    Day_Code int
  )
End;

IF OBJECT_ID(N'Flight_Details',N'U') is NULL
BEGIN
    CREATE TABLE Flight_Details
    (
        Aircraft_code VARCHAR(20),
        Class_Code CHAR(5),
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