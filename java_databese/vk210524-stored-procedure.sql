
CREATE PROCEDURE OdbradaZahtevaPostajanjaKurira
	@Zahtev int,
	@Obrada int
AS
BEGIN
	declare @UserId int
	declare @VehicleId int

	SELECT @UserId = UserId FROM Request WHERE Id = @Zahtev 
	SELECT  @VehicleId = Vehicle FROM Request WHERE Id = @Zahtev

	DELETE FROM Request WHERE Id = @Zahtev 

	if @Obrada = 1 and not exists( SELECT * FROM Courier WHERE Id = @UserId)
	BEGIN
		INSERT INTO [dbo].[Courier]
           ([Id]
           ,[VehicleId]
           ,[DeliveredPackages]
           ,[Profit]
           ,[StatusDriving])
     VALUES
           (@UserId, @VehicleId, 0, 0, 0)
	END
END
GO
