USE PPPK
GO

CREATE PROCEDURE GetCarBrand
AS
BEGIN
	SELECT *
	FROM CarBrand
END
GO

CREATE PROCEDURE GetCarType
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

CREATE PROCEDURE GetCity
AS
BEGIN
	SELECT *
	FROM City
END
GO

CREATE PROCEDURE GetCost
AS
BEGIN
	SELECT *
	FROM Cost
END
GO

CREATE PROCEDURE GetFuel
AS
BEGIN
	SELECT *
	FROM Fuel
END
GO

CREATE PROCEDURE GetTravelOrderType
AS
BEGIN
	SELECT *
	FROM TravelOrderType
END
GO

CREATE PROCEDURE GetTravelOrder
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