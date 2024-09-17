
CREATE TABLE [Admin]
( 
	[Id]                 integer  NOT NULL 
)
go

CREATE TABLE [City]
( 
	[PostalCode]         integer  NOT NULL ,
	[Name]               varchar(100)  NOT NULL ,
	[Id]                 integer  IDENTITY  NOT NULL 
)
go

CREATE TABLE [Courier]
( 
	[Id]                 integer  NOT NULL ,
	[VehicleId]          integer  NULL ,
	[DeliveredPackages]  integer  NOT NULL 
	CONSTRAINT [Default_Zero_Integer_40149127]
		 DEFAULT  0,
	[Profit]             decimal(10,3)  NOT NULL ,
	[StatusDriving]      integer  NOT NULL 
	CONSTRAINT [Default_Zero_Integer_473145822]
		 DEFAULT  0
	CONSTRAINT [Validation_Status_Driving_1285523693]
		CHECK  ( [StatusDriving]=0 OR [StatusDriving]=1 )
)
go

CREATE TABLE [District]
( 
	[Id]                 integer  IDENTITY  NOT NULL ,
	[Name]               varchar(100)  NOT NULL ,
	[X]                  integer  NOT NULL ,
	[Y]                  integer  NOT NULL ,
	[CityId]             integer  NOT NULL 
)
go

CREATE TABLE [Offer]
( 
	[Percentage]         decimal(10,3)  NULL ,
	[PackageId]          integer  NOT NULL ,
	[CourierId]          integer  NOT NULL ,
	[Id]                 integer  IDENTITY  NOT NULL 
)
go

CREATE TABLE [Package]
( 
	[Type]               integer  NOT NULL 
	CONSTRAINT [Validation_Package_Type_120362409]
		CHECK  ( [Type]=0 OR [Type]=1 OR [Type]=2 ),
	[Weight]             decimal(10,3)  NOT NULL 
	CONSTRAINT [Validation_Positive_Decimal_337178103]
		CHECK  ( Weight >= 0.0 ),
	[DelieveryStatus]    integer  NOT NULL 
	CONSTRAINT [Default_Zero_Integer_554993768]
		 DEFAULT  0
	CONSTRAINT [Validation_Delievery_Status_639643815]
		CHECK  ( [DelieveryStatus]=0 OR [DelieveryStatus]=1 OR [DelieveryStatus]=2 OR [DelieveryStatus]=3 ),
	[Id]                 integer  IDENTITY  NOT NULL ,
	[AcceptanceTime]     DATETIME  NULL 
	CONSTRAINT [Default_NULL_366144160]
		 DEFAULT  NULL,
	[DstDistrictId]      integer  NOT NULL ,
	[SrcDistrictId]      integer  NOT NULL ,
	[CourierId]          integer  NULL ,
	[Price]              decimal(10,3)  NULL 
)
go

CREATE TABLE [Prevozi]
( 
	[PackageId]          integer  NOT NULL ,
	[CourierId]          integer  NOT NULL ,
	[count]              integer  NULL 
)
go

CREATE TABLE [Request]
( 
	[UserId]             integer  NOT NULL ,
	[Vehicle]            integer  NOT NULL ,
	[Id]                 integer  IDENTITY  NOT NULL 
)
go

CREATE TABLE [User]
( 
	[FirstName]          varchar(100)  NOT NULL ,
	[Surname]            varchar(100)  NOT NULL ,
	[Username]           varchar(100)  NOT NULL ,
	[Password]           varchar(100)  NOT NULL ,
	[SentPackages]       integer  NOT NULL 
	CONSTRAINT [Default_Zero_Integer_864665052]
		 DEFAULT  0
	CONSTRAINT [Validation_Positive_Integer_571379858]
		CHECK  ( SentPackages >= 0 ),
	[Id]                 integer  IDENTITY  NOT NULL 
)
go

CREATE TABLE [Vehicle]
( 
	[Id]                 integer  IDENTITY  NOT NULL ,
	[Registration]       varchar(100)  NOT NULL ,
	[FuelType]           integer  NOT NULL 
	CONSTRAINT [Validation_FuelType_220049337]
		CHECK  ( [FuelType]=0 OR [FuelType]=1 OR [FuelType]=2 ),
	[Consumption]        decimal(10,3)  NOT NULL 
)
go

CREATE TABLE [Voznja]
( 
	[CourierId]          integer  NOT NULL ,
	[zarada]             decimal(10,3)  NULL 
	CONSTRAINT [Default_Value_367_992764449]
		 DEFAULT  0
)
go

ALTER TABLE [Admin]
	ADD CONSTRAINT [XPKAdmin] PRIMARY KEY  CLUSTERED ([Id] ASC)
go

ALTER TABLE [City]
	ADD CONSTRAINT [XPKCity] PRIMARY KEY  CLUSTERED ([Id] ASC)
go

ALTER TABLE [City]
	ADD CONSTRAINT [XAK1City_PostalCode] UNIQUE ([PostalCode]  ASC)
go

ALTER TABLE [City]
	ADD CONSTRAINT [XAK2City_Name] UNIQUE ([Name]  ASC)
go

ALTER TABLE [Courier]
	ADD CONSTRAINT [XPKCourier] PRIMARY KEY  CLUSTERED ([Id] ASC)
go

ALTER TABLE [District]
	ADD CONSTRAINT [XPKDistrict] PRIMARY KEY  CLUSTERED ([Id] ASC)
go

ALTER TABLE [Offer]
	ADD CONSTRAINT [XPKOffer] PRIMARY KEY  CLUSTERED ([Id] ASC)
go

ALTER TABLE [Package]
	ADD CONSTRAINT [XPKPackage] PRIMARY KEY  CLUSTERED ([Id] ASC)
go

ALTER TABLE [Prevozi]
	ADD CONSTRAINT [XPKPrevozi] PRIMARY KEY  CLUSTERED ([PackageId] ASC,[CourierId] ASC)
go

ALTER TABLE [Request]
	ADD CONSTRAINT [XPKRequest] PRIMARY KEY  CLUSTERED ([Id] ASC)
go

ALTER TABLE [User]
	ADD CONSTRAINT [XPKUser] PRIMARY KEY  CLUSTERED ([Id] ASC)
go

ALTER TABLE [User]
	ADD CONSTRAINT [XAK1User_Username] UNIQUE ([Username]  ASC)
go

ALTER TABLE [Vehicle]
	ADD CONSTRAINT [XPKVehicle] PRIMARY KEY  CLUSTERED ([Id] ASC)
go

ALTER TABLE [Voznja]
	ADD CONSTRAINT [XPKVoznja] PRIMARY KEY  CLUSTERED ([CourierId] ASC)
go


ALTER TABLE [Admin]
	ADD CONSTRAINT [R_1] FOREIGN KEY ([Id]) REFERENCES [User]([Id])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Courier]
	ADD CONSTRAINT [R_2] FOREIGN KEY ([Id]) REFERENCES [User]([Id])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [Courier]
	ADD CONSTRAINT [R_10] FOREIGN KEY ([VehicleId]) REFERENCES [Vehicle]([Id])
		ON UPDATE CASCADE
go


ALTER TABLE [District]
	ADD CONSTRAINT [R_3] FOREIGN KEY ([CityId]) REFERENCES [City]([Id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Offer]
	ADD CONSTRAINT [R_6] FOREIGN KEY ([PackageId]) REFERENCES [Package]([Id])
		ON UPDATE CASCADE
go

ALTER TABLE [Offer]
	ADD CONSTRAINT [R_7] FOREIGN KEY ([CourierId]) REFERENCES [Courier]([Id])
		ON UPDATE CASCADE
go


ALTER TABLE [Package]
	ADD CONSTRAINT [R_8] FOREIGN KEY ([DstDistrictId]) REFERENCES [District]([Id])
		ON UPDATE CASCADE
go


ALTER TABLE [Prevozi]
	ADD CONSTRAINT [R_14] FOREIGN KEY ([PackageId]) REFERENCES [Package]([Id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Prevozi]
	ADD CONSTRAINT [R_15] FOREIGN KEY ([CourierId]) REFERENCES [Voznja]([CourierId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Request]
	ADD CONSTRAINT [R_4] FOREIGN KEY ([Vehicle]) REFERENCES [Vehicle]([Id])
		ON UPDATE CASCADE
go

ALTER TABLE [Request]
	ADD CONSTRAINT [R_5] FOREIGN KEY ([UserId]) REFERENCES [User]([Id])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Voznja]
	ADD CONSTRAINT [R_12] FOREIGN KEY ([CourierId]) REFERENCES [Courier]([Id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go
