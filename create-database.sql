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

CREATE TABLE CarType
(
	IDCarType	int IDENTITY,
	[Type]		nvarchar(50),
	CONSTRAINT PK_IDCarType PRIMARY KEY (IDCarType)
)
GO

CREATE TABLE CarBrand
(
	IDCarBrand	int IDENTITY,
	[Name]		nvarchar(50),
	CONSTRAINT PK_IDCarBrand PRIMARY KEY (IDCarBrand)
)
GO

CREATE TABLE CarModel
(
	IDCarModel	int IDENTITY,
	[Name]		nvarchar(50),
	CarBrandID	int,
	CONSTRAINT PK_IDCarModel PRIMARY KEY (IDCarModel),
	CONSTRAINT FK_CarModel_CarBrandID FOREIGN KEY (CarBrandID) REFERENCES CarBrand(IDCarBrand)
)
GO

CREATE TABLE Car
(
	IDCar				int IDENTITY,
	InitialKm			int,
	YearOfProduction	int,
	CarTypeID			int,
	CarModelID			int,
	CONSTRAINT PK_IDCar PRIMARY KEY (IDCar),
	CONSTRAINT FK_Car_CarTypeID FOREIGN KEY (CarTypeID) REFERENCES CarType(IDCarType),	
	CONSTRAINT FK_Car_CarModelID FOREIGN KEY (CarModelID) REFERENCES CarModel(IDCarModel)
)
GO

CREATE TABLE TravelOrderType
(
	IDTravelOrderType	int IDENTITY,
	[Type]				nvarchar(50),
	CONSTRAINT PK_IDTravelOrderType PRIMARY KEY (IDTravelOrderType)
)
GO

CREATE TABLE Country
(
	IDCountry	int IDENTITY,
	[Name]		nvarchar(50),
	CONSTRAINT IDCountry PRIMARY KEY (IDCountry)
)
GO

CREATE TABLE City
(
	IDCity		int IDENTITY,
	[Name]		nvarchar(50),
	CountryID	int,
	CONSTRAINT PK_IDCity PRIMARY KEY (IDCity),
	CONSTRAINT FK_City_CountryID FOREIGN KEY (CountryID) REFERENCES Country(IDCountry)
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
	CONSTRAINT PK_IDTravelOrder PRIMARY KEY (IDTravelOrder),
	CONSTRAINT FK_TravelOrder_TravelOrderTypeID FOREIGN KEY (TravelOrderTypeID) REFERENCES TravelOrderType(IDTravelOrderType),	
	CONSTRAINT FK_TravelOrder_DriverID FOREIGN KEY (DriverID) REFERENCES Driver(IDDriver),
	CONSTRAINT FK_TravelOrder_StartCityID FOREIGN KEY (StartCityID) REFERENCES City(IDCity),	
	CONSTRAINT FK_TravelOrder_FinishCityID FOREIGN KEY (FinishCityID) REFERENCES City(IDCity)
)
GO

CREATE TABLE Cost
(
	IDCost			int IDENTITY,
	[Date]			date,
	Quantity		int,		
	Price			money,
	CityID			int,
	TravelOrderID	int,
	CONSTRAINT PK_IDCost PRIMARY KEY (IDCost),
	CONSTRAINT FK_Cost_CityID FOREIGN KEY (CityID) REFERENCES City(IDCity),
	CONSTRAINT FK_Cost_TravelOrderID FOREIGN KEY (TravelOrderID) REFERENCES TravelOrder(IDTravelOrder)
)
GO