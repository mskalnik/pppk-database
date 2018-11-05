USE PPPK
GO

INSERT INTO Driver (FirstName, LastName, PhoneNumber, DriversLicenceNumber)
VALUES	('First', 'Person', '77564765776', '645365436563'),
		('Second', 'Person', '6543653653', '8768758765768'),
		('Third', 'Person', '756434756856', '9879879879996')
GO

INSERT INTO CarType ([Type])
VALUES ('Sedan'), ('Coupe'), ('SUV')
GO

INSERT INTO CarBrand ([Name])
VALUES ('Audi'), ('BMW'), ('Mercedes')
GO

INSERT INTO CarModel ([Name], CarBrandID)
VALUES ('A8', 1), ('X4', 2), ('S', 3)
GO

INSERT INTO Car(InitialKm, YearOfProduction, CarTypeID, CarModelID)
VALUES (12321, 1991, 1, 1), (423, 1992, 2, 2), (545, 1993, 3, 3)
GO

INSERT INTO TravelOrderType ([Type])
VALUES ('Open'), ('Closed'), ('Future'), ('Filtered')
GO

INSERT INTO City ([Name])
VALUES ('Zagreb'), ('Berlin'), ('Sarajevo')
GO

INSERT INTO Fuel ([Name])
VALUES ('Dizel'), ('Benzin')
GO

INSERT INTO TravelOrder (Distance, StartDate, EndDate, TravelOrderTypeID, DriverID, StartCityID, FinishCityID)
VALUES	(321, '20180101', '20180101', 1, 1, 1, 2),
		(123, '20180102', '20180202', 2, 2, 2, 3),
		(231, '20180103', '20180303', 3, 3, 3, 1)		
GO

INSERT INTO Cost ([Date], Quantity, Price, CityID, TravelOrderID)
VALUES	('20180101', 7, 7, 1, 1),
		('20180102', 8, 8, 2, 2),
		('20180103', 9, 9, 3, 3)
GO