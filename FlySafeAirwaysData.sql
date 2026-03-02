USE [FLY SAFE Airways];
GO


INSERT into dbo.Airlines_Master(Aircode,Airline_Name)
VALUES('9W','Jet Airways'),
      ('AI','Air India'),
      ('BA','British Airways'),
      ('IA','Indian Airlines');
go
insert into dbo.Category_Master(Category_Code,DESCRIPTION)
VALUES('D','Domestic'),
      ('I','International');
GO

insert into dbo.Class_Master(Class_Code,Class_Name)
 values('FC','First Class'),
       ('E','Economy'),
       ('Ex','Executive');
 GO

 insert into dbo.City_Master(City_Code, City_Name,City_Country)
 VALUES('Bang','Bangalore','India'),
       ('Cal','Calcutta','India'),
       ('Che','Chennai','India'),
       ('Del','Delhi','India'),
       ('Mum','Mumbai','India'),
       ('NY','New York','USA');
 GO
 INSERT INTO dbo.Day_Master(Day_Code, Day_Name)
 VALUES(1,'Sunday'),
       (2,'Monday'),
       (3,'Tuesday'),
       (4,'Wednesday'),
       (5,'Thursday'),
       (6,'Friday'),
       (7,'Saturday');
GO

INSERT INTO dbo.Meal(Meal_Code, Meal_Name)
      VALUES('CV','Chinese Vegetarian'),
            ('CNV','Chinese Non-Vegetarian'),
            ('CONNV','Continental Non-Vegetarian'),
            ('CONV','Continental Vegetarian'),
            ('CV','Chinese Vegetarian'),
            ('NV','Non-Vegetarian'),
            ('V','Vegetarian');
  GO

  INSERT INTO dbo.Service(Service_Code, [Service_Name])          
  VALUES('CC','Child Care'),
        ('N','Nurse'),
        ('WC','Wheel Chair');
 GO

 INSERT INTO dbo.Status_Master(Status_Code, [DESCRIPTION])
 VALUES('C','Cancelled'),
       ('R','Reserved'),
       ('T','Travelled'),
       ('U','Untravelled'),
       ('W','Waitlist');
  GO

  INSERT INTO dbo.Airlines_Service 
  VALUES('IA','CC'),
        ('IA','N'),     
        ('IA','WC'),     
        ('BA','CC'),     
        ('BA','N'),     
        ('BA','WC'),     
        ('9W','CC'),     
        ('9W','N'),     
        ('9W','WC'),     
        ('AI','CC'),     
        ('AI','N'),     
        ('AI','WC');
GO

INSERT into dbo.Airline_Meal(Aircode,Meal_Code)
VALUES('9W','V'),
      ('9W','NV'),
      ('AI','V'),
      ('AI','NV'),
      ('AI','CV'),
      ('AI','CNV'),
      ('AI','CONV'),
      ('AI','CONNV'),
      ('BA','CONV'),
      ('BA','CONNV'),
      ('BA','V'),
      ('BA','NV'),
      ('BA','CV'),
      ('BA','CNV'),
      ('IA','V'),
      ('IA','NV');
GO


INSERT INTO dbo.Flight(Aircraft_Code, Aircode, [TYPE], [Source], Destination, Category, Dep_time, Journey_hrs)
 VALUES
 ('9W01','9W','Airbus','Cal','Che','D','15.30',3),
 ('9W02','9W','Airbus','Mum','Del','D','9.30',2),
 ('9W03','9W','Airbus','Che','Mum','D','10.45',2),
 ('AI01','AI','Boeing','Cal','NY','I','2.20',18),
 ('AI02','AI','Boeing','Mum','NY','I','1.30',20),
 ('AI03','AI','Boeing','Del','NY','I','3.00',17),
 ('BA01','BA','Boeing','Mum','Lon','I','23.30',9),
 ('BA02','BA','Boeing','Del','Lon','I','2.15',11),
 ('BA03','BA','Boeing','Mum','NY','I','3.30',20),
 ('IC01','IA','Airbus','Bang','Che','D','10.45',1),
 ('IC02','IA','Airbus','Bang','Mum','D','2.00',2),
 ('IC03','IA','Boeing','Del','Cal','D','17.45',1),
 ('IC04','IA','Boeing','Mum','Cal','D','18.30',1);
 GO

 INSERT INTO dbo.Flight_Days(Aircraft_Code,Day_Code) 
 VALUES
      ('9W01',1),
      ('9W02',2),
      ('9W03',1),
      ('AI01',2),
      ('AI02',1),
      ('AI03',2),
      ('BA01',2),
      ('BA02',1),
      ('BA03',2),
      ('IC01',1),
      ('IC02',3),
      ('IC03',1),
      ('IC04',2),
      ('9W01',3),
      ('9W02',4),
      ('9W03',4),
      ('AI01',4),
      ('AI02',3),
      ('AI03',4);
 GO

 INSERT INTO dbo.Flight_Details (Aircraft_Code,Class_Code,Fare, Seats)
 values
      ('IC01','E',3409,300),
      ('IC01','Ex',5117,150),
      ('IC02','E',4000,300),
      ('IC02','Ex',4600,150),
      ('IC03','E',5048,425),
      ('IC03','Ex',7574,125),
      ('IC04','E',5817,425),
      ('9W01','E',6100,300),
      ('9W01','Ex',6895,150),
      ('9W02','E',5900,300),
      ('9W02','Ex',6850,150),
      ('9W03','E',4175,300),
      ('9W03','Ex',5400,150),
      ('AI01','E',72215,350),
      ('AI01','Ex',77145,175),
      ('AI01','FC',81215,100),
      ('AI02','E',60100,350),
      ('AI02','Ex',70150,175);
GO

INSERT INTO dbo.Passenger(PNR_No,Ticket_No,[Name], Age, Sex, [PP No], [Meal Pref])
VALUES
      (1,1,'Allan Smith',45,'Male',117889,'CONNV'),
      (1,2,'Stella Smith',23,'Female',322901,'V'),
      (1,3,'Pam Smith',26,'Female',279011,'NV'),
      (2,4,'Peter Jones',27,'Male',293211,'NV'),
      (2,5,'Lily Jones',30,'Female',347821,'NV'),
      (3,6,'James Crawford',44,'Male',123111,'NV'),
      (3,7,'Kitty Crawford',30,'Female',123112,'NV'),
      (4,8,'Alex Lee',22,'Male',40103,'V'),
      (4,9,'Greta Lee',20,'Female',41312,'V'),
      (4,10,'Shania Lee',30,'Female',34784,'NV'),
      (4,11,'Christopher Lee',40,'Male',12453,'NV'),
      (5,12,'Stella Morris',27,'Female',31567,'V');
 GO     

 INSERT INTO dbo.Reservation(PNR_No, Aircraft_Code,Journey_Date, Class_Code, No_Of_Seats,[Address],Contact_No,[Status]) 
 values
      (1, 'IC01','2001-03-15','EX',2,'25, Jose Fonte',3317575,'C'),
      (1, 'BA02','2001-03-21','FC',2,'Pusan Road, Hidetoshi, Seoul',3317575,'C'),
      (1, 'IC01','2001-03-15','EX',2,'11A, Avenida Merido, Coimbra',3317575,'C'),
      (1, 'BA02','2001-03-21','E',2,'Vide, Seixal, Fidalguinhos',3317575,'C'),
      (1, 'IC01','2001-03-15','FC',2,'Nari, Upper Saddle River, NJ',3317575,'C');
GO