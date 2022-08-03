CREATE SCHEMA hotelmgmtsys;
USE hotelmgmtsys;

CREATE TABLE CUSTOMER (
	CustomerID VARCHAR (10) NOT NULL,
    FirstName VARCHAR (50) NOT NULL,
    Middle VARCHAR (50), 
    Surname VARCHAR (50) NOT NULL,
    StreetAddress VARCHAR (50) NOT NULL,
    City VARCHAR (50) NOT NULL,
    Zipcode VARCHAR (50) NOT NULL, 
    PhoneNo VARCHAR (50) NOT NULL, 
    DoB DATETIME NOT NULL,
    Gender VARCHAR (1) NOT NULL,
    EMail VARCHAR (50) NOT NULL,
    IsMember VARCHAR (1) NOT NULL,
    PrefferedCCNo VARCHAR (50) NOT NULL
);

ALTER TABLE CUSTOMER 
	ADD CONSTRAINT PK_CUSTOMER PRIMARY KEY (CustomerID);
    
INSERT INTO CUSTOMER (CustomerID, FirstName, Middle, Surname, StreetAddress,
		City, Zipcode, PhoneNo, DoB, Gender, EMail, IsMember, PrefferedCCNo)
        VALUES ("1", "Berk", NULL , "Sezer", "Yakamoz Sok.", "Bursa", "161001", "5321823284", STR_TO_DATE('09-05-2000','%m-%d-%Y'), "M", "berksezer@hotmail.com", "N","1212342356789765");
 INSERT INTO CUSTOMER (CustomerID, FirstName, Middle, Surname, StreetAddress,
		City, Zipcode, PhoneNo, DoB, Gender, EMail, IsMember, PrefferedCCNo)
        VALUES ("2", "Eren", NULL , "Turunc", "Fındık Sok.", "Istanbul", "34100", "5321824567", STR_TO_DATE('11-12-2001','%m-%d-%Y'), "M", "erenturunc@hotmail.com", "Y","1212312357789765");   
INSERT INTO CUSTOMER (CustomerID, FirstName, Middle, Surname, StreetAddress,
		City, Zipcode, PhoneNo, DoB, Gender, EMail, IsMember, PrefferedCCNo)
        VALUES ("3", "Cem", NULL , "Sezer", "Yakamoz Sok.", "Bursa", "161001", "5321823424", STR_TO_DATE('09-15-2000','%m-%d-%Y'), "M", "cemsezer@hotmail.com", "N","1212324356754321");    
INSERT INTO CUSTOMER (CustomerID, FirstName, Middle, Surname, StreetAddress,
		City, Zipcode, PhoneNo, DoB, Gender, EMail, IsMember, PrefferedCCNo)
        VALUES ("4", "Selina", NULL , "Sezer", "Yakamoz Sok.", "Bursa", "161001", "53218234536", STR_TO_DATE('09-16-2000','%m-%d-%Y'), "F", "selinasezer@hotmail.com", "N","1295847385679754");   
INSERT INTO CUSTOMER (CustomerID, FirstName, Middle, Surname, StreetAddress,
		City, Zipcode, PhoneNo, DoB, Gender, EMail, IsMember, PrefferedCCNo)
        VALUES ("5", "Alper", "Mustafa" , "Vatansever", "Mavi Sok.", "İzmir", "351001", "5321823356", STR_TO_DATE('11-24-2000','%m-%d-%Y'), "M", "vatansever@hotmail.com", "Y","4567873549853278");
        
        
        
CREATE TABLE ROOMTYPE (
	TypeID VARCHAR (10) NOT NULL,
    Description VARCHAR (250) NOT NULL,
    Quantity SMALLINT NOT NULL,
    DailyPrice SMALLINT NOT NULL,
    CustomerCapacity SMALLINT NOT NULL
);  

ALTER TABLE ROOMTYPE 
	ADD CONSTRAINT PK_ROOMTYPE PRIMARY KEY (TypeID);
    
INSERT INTO ROOMTYPE (TypeID, Description, Quantity, DailyPrice, CustomerCapacity)  
	VALUES ("101", "Bungalov", 60, 1000, 7);
INSERT INTO ROOMTYPE (TypeID, Description, Quantity, DailyPrice, CustomerCapacity)  
	VALUES ("102", "Inside", 300, 400, 5);    
INSERT INTO ROOMTYPE (TypeID, Description, Quantity, DailyPrice, CustomerCapacity)  
	VALUES ("103", "Apartment", 400, 200, 3);    
INSERT INTO ROOMTYPE (TypeID, Description, Quantity, DailyPrice, CustomerCapacity)  
	VALUES ("104", "Pool Side", 200, 250, 5);
INSERT INTO ROOMTYPE (TypeID, Description, Quantity, DailyPrice, CustomerCapacity)  
	VALUES ("105", "Sea Side", 200, 350, 5);    
    
    
CREATE TABLE RESERVATION (
	ReservationNumber VARCHAR (10) NOT NULL,
    ReservationCancellationDate DATETIME ,
    Customer_ID VARCHAR (10) NOT NULL,
    Type_ID VARCHAR (10) NOT NULL,
    ReservationDate DATETIME NOT NULL,
    CheckInDate DATETIME NOT NULL,
    CheckOutDate DATETIME NOT NULL,
    EstimatedPrice SMALLINT NOT NULL,
    DiscountRate SMALLINT NOT NULL,
    NumberOfAdults SMALLINT NOT NULL, 
    NumberOfChildren SMALLINT NOT NULL
);

ALTER TABLE RESERVATION 
	ADD CONSTRAINT PK_RESERVATION PRIMARY KEY (ReservationNumber);
    
ALTER TABLE `hotelmgmtsys`.`reservation` 
ADD INDEX `CustFor_idx` (`Customer_ID` ASC) VISIBLE;
;
ALTER TABLE `hotelmgmtsys`.`reservation` 
ADD CONSTRAINT `CustFor`
  FOREIGN KEY (`Customer_ID`)
  REFERENCES `hotelmgmtsys`.`customer` (`CustomerID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;       
  
ALTER TABLE `hotelmgmtsys`.`reservation` 
ADD INDEX `RoomTypeFor_idx` (`Type_ID` ASC) VISIBLE;
;
ALTER TABLE `hotelmgmtsys`.`reservation` 
ADD CONSTRAINT `RoomTypeFor`
  FOREIGN KEY (`Type_ID`)
  REFERENCES `hotelmgmtsys`.`roomtype` (`TypeID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;




INSERT INTO RESERVATION (ReservationNumber, ReservationCancellationDate, Customer_ID, Type_ID, ReservationDate, CheckInDate, CheckOutDate,
	EstimatedPrice, DiscountRate, NumberOfAdults, NumberOfChildren)
    VALUES ("1", NULL, "1", "101",  STR_TO_DATE('04-16-2022','%m-%d-%Y'), STR_TO_DATE('07-16-2022','%m-%d-%Y'), STR_TO_DATE('07-21-2022','%m-%d-%Y'), 5500, 5, 2, 3);
INSERT INTO RESERVATION (ReservationNumber, ReservationCancellationDate, Customer_ID, Type_ID, ReservationDate, CheckInDate, CheckOutDate,
	EstimatedPrice, DiscountRate, NumberOfAdults, NumberOfChildren)
    VALUES ("2", NULL, "2", "104",  STR_TO_DATE('03-16-2022','%m-%d-%Y'), STR_TO_DATE('07-22-2022','%m-%d-%Y'), STR_TO_DATE('07-29-2022','%m-%d-%Y'), 6000, 6, 2, 2);
INSERT INTO RESERVATION (ReservationNumber, ReservationCancellationDate, Customer_ID, Type_ID, ReservationDate, CheckInDate, CheckOutDate,
	EstimatedPrice, DiscountRate, NumberOfAdults, NumberOfChildren)
    VALUES ("3", STR_TO_DATE('06-16-2022','%m-%d-%Y'), "3", "102",  STR_TO_DATE('04-20-2022','%m-%d-%Y'), STR_TO_DATE('07-08-2022','%m-%d-%Y'), STR_TO_DATE('07-12-2022','%m-%d-%Y'), 2000, 3, 2, 0);
INSERT INTO RESERVATION (ReservationNumber, ReservationCancellationDate, Customer_ID, Type_ID, ReservationDate, CheckInDate, CheckOutDate,
	EstimatedPrice, DiscountRate, NumberOfAdults, NumberOfChildren)
    VALUES ("4",NULL, "4", "105",  STR_TO_DATE('01-11-2022','%m-%d-%Y'), STR_TO_DATE('08-08-2022','%m-%d-%Y'), STR_TO_DATE('08-15-2022','%m-%d-%Y'), 4000, 5, 2, 2);
INSERT INTO RESERVATION (ReservationNumber, ReservationCancellationDate, Customer_ID, Type_ID, ReservationDate, CheckInDate, CheckOutDate,
	EstimatedPrice, DiscountRate, NumberOfAdults, NumberOfChildren)
    VALUES ("5",NULL, "5", "103",  STR_TO_DATE('12-11-2021','%m-%d-%Y'), STR_TO_DATE('06-12-2022','%m-%d-%Y'), STR_TO_DATE('06-20-2022','%m-%d-%Y'), 3000, 3, 2, 0);    
    
    
  
    