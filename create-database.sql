CREATE DATABASE PPPK
GO

USE PPPK
GO

CREATE TABLE Driver
(
	IDDriver				int IDENTITY,
	FirstName				nvarchar(50),
	LastName				nvarchar(50),
	PhoneNumber				nvarchar(20),
	DriversLicenceNumber	nvarchar(20),
	CONSTRAINT PK_IDDriver PRIMARY KEY (IDDriver)
)
GO

CREATE TABLE CarBrand
(
	IDCarBrand	int IDENTITY,
	[Name]		nvarchar(50),
	CONSTRAINT PK_IDCarBrand PRIMARY KEY (IDCarBrand)
)
GO

CREATE TABLE CarType
(
	IDCarType	int IDENTITY,
	[Name]		nvarchar(50),
	CarBrandID	int,
	CONSTRAINT PK_IDCarModel PRIMARY KEY (IDCarType),
	CONSTRAINT FK_CarModel_CarBrandID FOREIGN KEY (CarBrandID) REFERENCES CarBrand(IDCarBrand)
)
GO

CREATE TABLE Car
(
	IDCar				int IDENTITY,
	Registration		nvarchar(20),
	InitialKm			int,
	YearOfProduction	int,
	CarTypeID			int,
	CONSTRAINT PK_IDCar PRIMARY KEY (IDCar),
	CONSTRAINT FK_Car_CarTypeID FOREIGN KEY (CarTypeID) REFERENCES CarType(IDCarType)
)
GO

CREATE TABLE TravelOrderType
(
	IDTravelOrderType	int IDENTITY,
	[Type]				nvarchar(50),
	CONSTRAINT PK_IDTravelOrderType PRIMARY KEY (IDTravelOrderType)
)
GO

CREATE TABLE City
(
	IDCity		int IDENTITY,
	[Name]		nvarchar(50),
	CONSTRAINT PK_IDCity PRIMARY KEY (IDCity)
)
GO

CREATE TABLE Fuel
(
	IDFuel	int IDENTITY,
	[Name]	nvarchar(50),
	CONSTRAINT PK_IDFuel PRIMARY KEY (IDFuel)
)
GO

CREATE TABLE TravelOrder
(
	IDTravelOrder		int IDENTITY,
	Distance			int,
	StartDate			date,
	EndDate				date,
	TravelOrderTypeID	int,
	DriverID			int,
	StartCityID			int,
	FinishCityID		int,
	CarID				int,
	CONSTRAINT PK_IDTravelOrder PRIMARY KEY (IDTravelOrder),	
	CONSTRAINT FK_TravelOrder_TravelOrderTypeID FOREIGN KEY (TravelOrderTypeID) REFERENCES TravelOrderType(IDTravelOrderType),	
	CONSTRAINT FK_TravelOrder_DriverID FOREIGN KEY (DriverID) REFERENCES Driver(IDDriver),
	CONSTRAINT FK_TravelOrder_StartCityID FOREIGN KEY (StartCityID) REFERENCES City(IDCity),	
	CONSTRAINT FK_TravelOrder_FinishCityID FOREIGN KEY (FinishCityID) REFERENCES City(IDCity),	
	CONSTRAINT FK_TravelOrder_CarID FOREIGN KEY (CarID) REFERENCES Car(IDCar)
)
GO

CREATE TABLE Cost
(
	IDCost			int IDENTITY,
	[Date]			date,
	Quantity		int,		
	Price			money,	
	FuelID			int,
	CityID			int,
	TravelOrderID	int,
	CONSTRAINT PK_IDCost PRIMARY KEY (IDCost),
	CONSTRAINT FK_Cost_FuelID FOREIGN KEY (FuelID) REFERENCES Fuel(IDFuel),	
	CONSTRAINT FK_Cost_CityID FOREIGN KEY (CityID) REFERENCES City(IDCity),
	CONSTRAINT FK_Cost_TravelOrderID FOREIGN KEY (TravelOrderID) REFERENCES TravelOrder(IDTravelOrder)
)
GO

CREATE TABLE [Route]
(
	IDRoute			int IDENTITY,
    StartCoordinate float,
    EndCoordinate	float,
    StartDate		date,
    EndDate			date,
    Distance		float,
    FuelUsed		float,
    TravelOrderID	int,
	CONSTRAINT PK_IDRoute PRIMARY KEY (IDRoute),
	CONSTRAINT FK_Route_TravelOrderID FOREIGN KEY (TravelOrderID) REFERENCES TravelOrder(IDTravelOrder)
)