USE PPPK
GO

CREATE PROCEDURE GetCarBrands
AS
BEGIN
	SELECT *
	FROM CarBrand
END
GO

CREATE PROCEDURE GetCarTypes
AS
BEGIN
	SELECT *
	FROM CarType
END
GO

CREATE PROCEDURE GetCars
AS
BEGIN
	SELECT *
	FROM Car
END
GO

CREATE PROCEDURE GetCities
AS
BEGIN
	SELECT *
	FROM City
END
GO

CREATE PROCEDURE GetCosts
AS
BEGIN
	SELECT *
	FROM Cost
END
GO

CREATE PROCEDURE GetFuels
AS
BEGIN
	SELECT *
	FROM Fuel
END
GO

CREATE PROCEDURE GetTravelOrderTypes
AS
BEGIN
	SELECT *
	FROM TravelOrderType
END
GO

CREATE PROCEDURE GetTravelOrders
AS
BEGIN
	SELECT *
	FROM TravelOrder
END
GO

CREATE PROCEDURE EditCar
	@IDCar int,
	@Registration nvarchar(20),
	@InitialKm int,
	@YearOfProduction int,
	@CarTypeID int
AS
BEGIN
	UPDATE Car 
	SET Registration = @Registration, InitialKm = @InitialKm, YearOfProduction = @YearOfProduction, CarTypeID = @CarTypeID WHERE IDCar = @IDCar
END
GO

CREATE PROCEDURE AddCar
	@IDCar int,
	@Registration nvarchar(20),
	@InitialKm int,
	@YearOfProduction int,
	@CarTypeID int
AS
BEGIN
	INSERT INTO Car (Registration, InitialKm, YearOfProduction, CarTypeID)
	VALUES (@Registration, @InitialKm, @YearOfProduction, @CarTypeID)
END
GO

CREATE PROCEDURE DeleteCar
	@IDCar int
AS
BEGIN
	DELETE FROM Cost WHERE TravelOrderID IN (SELECT IDTravelOrder FROM TravelOrder WHERE CarID = @IDCar)
	DELETE FROM TravelOrder WHERE CarID = @IDCar
	DELETE FROM Car WHERE IDCar = @IDCar
END
GO

CREATE PROCEDURE DeleteDriver
	@IDDriver int
AS
BEGIN
	DELETE FROM Cost WHERE TravelOrderID IN (SELECT IDTravelOrder FROM TravelOrder WHERE DriverID = @IDDriver)
	DELETE FROM TravelOrder WHERE DriverID = @IDDriver
	DELETE FROM Driver WHERE IDDriver = @IDDriver
END
GO

CREATE PROCEDURE AddRoute
	@StartCoordinate	decimal, 
	@EndCoordinate		decimal, 
	@StartDate			date,
	@EndDate			date, 
	@Distance			decimal, 
	@FuelUsed			decimal, 
	@TravelOrderID		int
AS
BEGIN
	INSERT INTO [Route](StartCoordinate, EndCoordinate, StartDate, EndDate, Distance, FuelUsed, TravelOrderID)
	VALUES (@StartCoordinate, @EndCoordinate, @StartDate, @EndDate, @Distance, @FuelUsed, @TravelOrderID)
END
GO

CREATE PROCEDURE GetRoutes
AS
	SELECT * FROM [Route]
GO

CREATE PROCEDURE GetRoutesFor
	@idTravelOrder	int
AS
	SELECT * 
	FROM [Route] 
	WHERE [Route].TravelOrderId = @idTravelOrder
GO

CREATE PROCEDURE UpdateRoute
	@IDRoute			int,
	@StartCoordinate	decimal, 
	@EndCoordinate		decimal, 
	@StartDate			date,
	@EndDate			date, 
	@Distance			decimal, 
	@FuelUsed			decimal, 
	@TravelOrderID		int
AS
	UPDATE [Route]
	SET	StartCoordinate = @StartCoordinate, EndCoordinate = @EndCoordinate, StartDate = @StartDate, EndDate = @EndDate, 
		Distance = @Distance, FuelUsed = @FuelUsed, TravelOrderID = @TravelOrderID
	WHERE [Route].IDRoute = @IDRoute		
GO

CREATE PROCEDURE DeleteRoute
	@id	int
AS
	DELETE FROM [Route]
	WHERE [Route].IDRoute = @id
GO