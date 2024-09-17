CREATE TRIGGER TR_TransportOffer_New_Offer
   ON  Offer
   AFTER INSERT
AS 
BEGIN
	declare @NoviZahtev cursor
	declare @CourierId int
	declare @PackageId int

	SET @NoviZahtev = CURSOR FOR
	select i.PackageId, i.CourierId
	from inserted i

	OPEN @NoviZahtev
	FETCH NEXT FROM @NoviZahtev
	INTO @CourierId, @PackageId

	WHILE @@FETCH_STATUS = 0
	BEGIN
		DELETE FROM Offer WHERE PackageId = @PackageId and CourierId = @CourierId and
		exists( SELECT * FROM Package WHERE Id = @PackageId and DelieveryStatus != 0 )

		FETCH NEXT FROM @NoviZahtev
		INTO @CourierId, @PackageId
	END
	CLOSE @NoviZahtev
	DEALLOCATE @NoviZahtev

END
GO

CREATE TRIGGER TR_TransportOffer_Accepted_Offer
   ON  Package
   AFTER UPDATE
AS 
BEGIN
	declare @OdobrenZahtev cursor
	declare @CourierId int
	declare @PackageId int

	SET @OdobrenZahtev = CURSOR FOR
	select i.CourierId, i.Id
	from deleted d, inserted i 
	where d.Id = i.Id and i.DelieveryStatus = 1 and d.DelieveryStatus = 0

	OPEN @OdobrenZahtev
	FETCH NEXT FROM @OdobrenZahtev
	INTO @CourierId, @PackageId

	WHILE @@FETCH_STATUS = 0
	BEGIN
		DELETE FROM Offer WHERE PackageId = @PackageId and CourierId != @CourierId

		FETCH NEXT FROM @OdobrenZahtev
		INTO @CourierId, @PackageId
	END
	CLOSE @OdobrenZahtev
	DEALLOCATE @OdobrenZahtev

END
GO

CREATE TRIGGER TR_TransportOffer_Removed_Offer
   ON  Offer
   AFTER Delete
AS 
BEGIN
	declare @ObrisanZahtev cursor
	declare @CourierId int
	declare @PackageId int
	declare @Percentage decimal(10, 3)

	SET @ObrisanZahtev = CURSOR FOR
	SELECT d.CourierId, d.PackageId, d.Percentage  
	FROM deleted d 
	WHERE d.CourierId IN ( SELECT p.CourierId FROM Package p WHERE p.Id = d.PackageId and p.CourierId = d.CourierId )
	
	OPEN @ObrisanZahtev
	FETCH NEXT FROM @ObrisanZahtev
	INTO @CourierId, @PackageId, @Percentage

	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO [dbo].[Offer]
           ([Percentage]
           ,[PackageId]
           ,[CourierId])
     VALUES
           (@Percentage, @PackageId, @CourierId)
		

		FETCH NEXT FROM @ObrisanZahtev
		INTO @CourierId, @PackageId, @Percentage
	END
	CLOSE @ObrisanZahtev
	DEALLOCATE @ObrisanZahtev

END
GO


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
